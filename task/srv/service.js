const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { POHeaders, POItems } = this.entities;

    // BEFORE EVENT HANDLERS
    // BEFORE CREATE - POHeaders
    this.before('CREATE', 'POHeaders', async (req) => {
        const po = req.data;
        // Validate mandatory fields
        if (!po.vendorCode){
            req.error(403,'Vendor Code is mandatory');}
        if (!po.poNumber) throw new Error('PO Number is mandatory');
        if (!po.poDate) throw new Error('PO Date is mandatory');
        if (!po.currency) throw new Error('Currency is mandatory');
        if (!po.createdBy) throw new Error('Created By is mandatory');
        // Validate currency format (3 characters)
        if (po.currency && po.currency.length !== 3) {
            throw new Error('Currency must be exactly 3 characters');
        }
        // Set default status if not provided
        if (!po.poStatus) {
            po.poStatus = 'Open';
        }
        // Set creation timestamp
        po.lastModifiedDate = new Date().toISOString().split('T')[0];
        po.lastModifiedBy = req.user.id || po.createdBy;

        console.log(`BEFORE CREATE POHeader: ${po.poNumber}`);
    });
    // BEFORE CREATE - POItems
    this.before('CREATE', 'POItems', async (req) => {
        const item = req.data;  
        // Validate mandatory fields
        if (!item.materialCode) throw new Error('Material Code is mandatory');
        if (!item.quantity || item.quantity <= 0) {
            throw new Error('Quantity must be greater than 0');
        }
        // Calculate amount if price and quantity are provided
        if (item.price && item.quantity) {
            item.amount = item.price * item.quantity;
        }
        // Set default line status
        if (!item.lineStatus) {
            item.lineStatus = 'Open';
        }
        console.log(`BEFORE CREATE POItem: ${item.materialCode}`);
    });
    // BEFORE UPDATE - POHeaders
    this.before('UPDATE', 'POHeaders', async (req) => {
        const po = req.data;
        
        // Update modification timestamp
        po.lastModifiedDate = new Date().toISOString().split('T')[0];
        po.lastModifiedBy = req.user.id || 'SYSTEM';

        // Validate status transitions
        if (po.poStatus === 'Closed') {
            const existing = await SELECT.one.from(POHeaders).where({ PO_ID: req.data.PO_ID });
            if (existing && existing.poStatus === 'Closed') {
                throw new Error('Cannot modify a closed Purchase Order');
            }
        }
        console.log(`BEFORE UPDATE POHeader: ${po.PO_ID}`);
    });
    // BEFORE UPDATE - POItems
    this.before('UPDATE', 'POItems', async (req) => {
        const item = req.data;
        
        // Recalculate amount if price or quantity changed
        if (item.price !== undefined || item.quantity !== undefined) {
            const existing = await SELECT.one.from(POItems).where({ item_ID: item.item_ID });
            const price = item.price !== undefined ? item.price : existing.price;
            const quantity = item.quantity !== undefined ? item.quantity : existing.quantity;
            item.amount = price * quantity;
        }

        console.log(`BEFORE UPDATE POItem: ${item.item_ID}`);
    });

    // BEFORE DELETE - POHeaders
    this.before('DELETE', 'POHeaders', async (req) => {
        const poId = req.data.PO_ID;
        
        // Check if PO is closed
        const po = await SELECT.one.from(POHeaders).where({ PO_ID: poId });
        if (po && po.poStatus === 'Closed') {
            throw new Error('Cannot delete a closed Purchase Order');
        }

        console.log(`BEFORE DELETE POHeader: ${poId}`);
    });

    // ON EVENT HANDLERS
    // ON READ - Add custom logic for reading
    this.on('READ', 'POHeaders', async (req, next) => {
        console.log('ON READ POHeaders');
        const results = await next();
        
        // Add custom computed fields or formatting
        if (Array.isArray(results)) {
            results.forEach(po => {
                po.isEditable = po.poStatus !== 'Closed';
            });
        } else if (results) {
            results.isEditable = results.poStatus !== 'Closed';
        }
        
        return results;
    });
    // AFTER EVENT HANDLERS
    // AFTER CREATE - POHeaders
    this.after('CREATE', 'POHeaders', async (data, req) => {
        console.log(`AFTER CREATE POHeader: ${data.poNumber}`);
        
        // Send notification or trigger workflow
        console.log(`Purchase Order ${data.poNumber} created successfully`);
        
        // You can add logic here to:
        // - Send email notifications
        // - Trigger approval workflows
        // - Update related systems
    });
    // AFTER CREATE - POItems
    this.after('CREATE', 'POItems', async (data, req) => {
        console.log(`AFTER CREATE POItem: ${data.materialCode}`);
        // Update header totals
        if (data.header_PO_ID) {
            await updatePOTotals(data.header_PO_ID);
        }
    });
    // AFTER UPDATE - POHeaders
    this.after('UPDATE', 'POHeaders', async (data, req) => {
        console.log(`AFTER UPDATE POHeader: ${data.PO_ID}`) 
        // Log status changes
        if (data.poStatus === 'Approved') {
            console.log(`Purchase Order ${data.poNumber} has been approved`);
        }
    });
    // AFTER UPDATE - POItems
    this.after('UPDATE', 'POItems', async (data, req) => {
        console.log(`AFTER UPDATE POItem: ${data.item_ID}`);
        
        // Update header totals when item is updated
        if (data.header_PO_ID) {
            await updatePOTotals(data.header_PO_ID);
        }
    });
    // AFTER DELETE - POItems
    this.after('DELETE', 'POItems', async (data, req) => {
        console.log(`AFTER DELETE POItem`);
        
        // Update header totals after item deletion
        // Note: In delete, we need to get the header_PO_ID before deletion
    });
    // AFTER READ - Expand items with additional processing
    this.after('READ', 'POHeaders', async (data, req) => {
        if (!data) return;      
        const headers = Array.isArray(data) ? data : [data];  
        for (const header of headers) {
            // Add computed fields
            if (header.totalAmount && header.taxAmount) {
                header.netAmount = header.totalAmount - header.taxAmount;
            }
            // Calculate days until delivery
            if (header.deliveryDate) {
                const today = new Date();
                const delivery = new Date(header.deliveryDate);
                const diffTime = delivery - today;
                const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                header.daysUntilDelivery = diffDays;
            }
        }
    });
    // HELPER FUNCTIONS
    async function updatePOTotals(poId) {
        // Calculate total amount from all items
        const items = await SELECT.from(POItems).where({ header_PO_ID: poId });
        
        let totalAmount = 0;
        let taxAmount = 0;
        
        items.forEach(item => {
            const itemAmount = item.amount || 0;
            const itemTax = itemAmount * (item.taxPercent || 0) / 100;
            
            totalAmount += itemAmount;
            taxAmount += itemTax;
        });
        
        // Update the header
        await UPDATE(POHeaders)
            .set({ 
                totalAmount: totalAmount,
                taxAmount: taxAmount 
            })
            .where({ PO_ID: poId });
        
        console.log(`Updated totals for PO: ${poId}`);
    }
    // CUSTOM ACTIONS (Optional)
    // Custom action to approve a PO
    this.on('approvePO', async (req) => {
        const { PO_ID } = req.data;
        
        const po = await SELECT.one.from(POHeaders).where({ PO_ID });
        
        if (!po) throw new Error('Purchase Order not found');
        if (po.poStatus === 'Approved') throw new Error('PO already approved');
        if (po.poStatus === 'Closed') throw new Error('Cannot approve a closed PO');
        
        await UPDATE(POHeaders)
            .set({ 
                poStatus: 'Approved',
                approvedBy: req.user.id || 'SYSTEM',
                approvedDate: new Date().toISOString().split('T')[0]
            })
            .where({ PO_ID });
        
        return { message: `Purchase Order ${po.poNumber} approved successfully` };
    });

    // Custom action to close a PO
    this.on('closePO', async (req) => {
        const { PO_ID } = req.data;
        const po = await SELECT.one.from(POHeaders).where({ PO_ID });
        if (!po) throw new Error('Purchase Order not found');
        if (po.poStatus === 'Closed') throw new Error('PO already closed'); 
        await UPDATE(POHeaders)
            .set({ poStatus: 'Closed' })
            .where({ PO_ID });
        return { message: `Purchase Order ${po.poNumber} closed successfully` };
    });

});