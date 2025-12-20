using poservice as service from '../../srv/service';
annotate service.PurchaseOrder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'createdAt',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'poNumber',
                Value : poNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supplier',
                Value : supplier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalAmount',
                Value : totalAmount,
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
            Label : 'Items Info',
            ID : 'ItemsInfo',
            Target : 'to_poitems/@UI.LineItem#ItemsInfo',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'createdAt',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'poNumber',
            Value : poNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'supplier',
            Value : supplier,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'totalAmount',
            Value : totalAmount,
        },
    ],
    UI.Identification : [
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'poservice.Submit',
            Label  : 'Submit'
        }
    ]
);

annotate service.PurchaseOrderItems with @(
    UI.LineItem #ItemsInfo : [
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.amount,
            Label : 'amount',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.PO_ID,
            Label : 'PO_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.product,
            Label : 'product',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.quantity,
            Label : 'quantity',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items',
            ID : 'Items',
            Target : '@UI.Identification',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.amount,
            Label : 'amount',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.PO_ID,
            Label : 'PO_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.modifiedBy,
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.product,
            Label : 'product',
        },
        {
            $Type : 'UI.DataField',
            Value : PO.to_poitems.quantity,
            Label : 'quantity',
        },
    ],
);

