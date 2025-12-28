using PurchaseOrderService as service from '../../srv/service';
annotate service.POHeaders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'vendorCode',
                Value : vendorCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'poNumber',
                Value : poNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'poDate',
                Value : poDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'createdBy',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Label : 'vendorName',
                Value : vendorName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deliveryDate',
                Value : deliveryDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'paymentTerms',
                Value : paymentTerms,
            },
            {
                $Type : 'UI.DataField',
                Label : 'shippingAddress',
                Value : shippingAddress,
            },
            {
                $Type : 'UI.DataField',
                Label : 'billingAddress',
                Value : billingAddress,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalAmount',
                Value : totalAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'taxAmount',
                Value : taxAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'freightCharges',
                Value : freightCharges,
            },
            {
                $Type : 'UI.DataField',
                Label : 'poStatus',
                Value : poStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'remarks',
                Value : remarks,
            },
            {
                $Type : 'UI.DataField',
                Label : 'approvedBy',
                Value : approvedBy,
            },
            {
                $Type : 'UI.DataField',
                Label : 'approvedDate',
                Value : approvedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastModifiedBy',
                Value : lastModifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastModifiedDate',
                Value : lastModifiedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'referenceNumber',
                Value : referenceNumber,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'PO Items Information',
            Target : 'items/@UI.LineItem',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'vendorCode',
            Value : vendorCode,
        },
        {
            $Type : 'UI.DataField',
            Label : 'poNumber',
            Value : poNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'poDate',
            Value : poDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'currency',
            Value : currency,
        },
        {
            $Type : 'UI.DataField',
            Label : 'createdBy',
            Value : createdBy,
        },
    ],
);
annotate service.POItems with @(
    UI.FieldGroup #ItemDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'materialCode',
                Value : materialCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'materialDescription',
                Value : materialDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : 'quantity',
                Value : quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'uom',
                Value : uom,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'amount',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'taxPercent',
                Value : taxPercent,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lineStatus',
                Value : lineStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deliveryDate',
                Value : deliveryDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'remarks',
                Value : remarks,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemDetailsFacet',
            Label : 'Item Details',
            Target : '@UI.FieldGroup#ItemDetails',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'materialCode',
            Value : materialCode,
        },
        {
            $Type : 'UI.DataField',
            Label : 'materialDescription',
            Value : materialDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : 'quantity',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Label : 'uom',
            Value : uom,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'amount',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'taxPercent',
            Value : taxPercent,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lineStatus',
            Value : lineStatus,
        },]
        )

