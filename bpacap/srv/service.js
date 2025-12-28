const cds = require("@sap/cds");

module.exports = async function () {
  const { purchaseorder } = this.entities;

  this.after("CREATE", purchaseorder, async (data, req) => {
    try {
      const id = data.po_id;
      const po = await SELECT.one.from(purchaseorder).where({ po_id: id });
      if (!po) {
        throw new Error("PO not found");
      }

      const payload = {
        definitionId: "us10.ebb2d5eetrial.purchaseorder.productorderprocess",
        context: {
          data: {
            po_id: po.po_id,
            po_code: po.po_code,
            po_types: po.po_types,
            po_category: po.po_category,
            po_item: po.po_item,
            po_description: po.po_description,
            po_deliverydate: po.po_deliverydate,
            po_subcategory: po.po_subcategory,
            po_netamount: Number(po.po_netamount),
            po_quantity: po.po_quantity
          }
        }
      };

      console.log(payload);

      const bpadest = await cds.connect.to("bpa");

      const trig = await bpadest.tx(req).send({
        method: "POST",
        path: "/workflow/rest/v1/workflow-instances",
        headers: {
          "Content-Type": "application/json"
        },
        data: payload
      });

      if (!trig) {
        throw new Error("Failed to trigger BPA workflow");
      } else {
        return "PO Approval Process triggered successfully";
      }

    } catch (err) {
      console.error("❌ BPA Trigger Error:", err);
      throw new Error("Failed to trigger BPA workflow");
    }
  });
};
