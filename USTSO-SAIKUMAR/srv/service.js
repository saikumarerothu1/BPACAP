const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { MaterialTable} = this.entities;

    // this.before('CREATE', 'MaterialTable', async (req) => {
    //     const { MaterialCode } = req.data;
        
    //     if (MaterialCode) {
    //         const existing = await SELECT.one.from(MaterialTable)
    //             .where({ MaterialCode: MaterialCode });
            
    //         if (existing) {
    //             req.error(400, `Material code ${MaterialCode} already exists`);
    //         }
    //     }
    // });
    this.after('CREATE', 'MaterialTable', (data) => {
        if (data.MaterialCode === MAT006){
            console.warn("Material code should be unique");
        }});

})