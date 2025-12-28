using productservice as service from '../../srv/service';
annotate service.purchaseorder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'po_id',
                Value : po_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_code',
                Value : po_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_types',
                Value : po_types,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_category',
                Value : po_category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_item',
                Value : po_item,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_description',
                Value : po_description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_deliverydate',
                Value : po_deliverydate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_subcategory',
                Value : po_subcategory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_netamount',
                Value : po_netamount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'po_quantity',
                Value : po_quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'approver',
                Value : approver,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Approver_Status',
                Value : Approver_Status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'db_status',
                Value : db_status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'is_active',
                Value : is_active,
            },
            {
                $Type : 'UI.DataField',
                Label : 'is_changed',
                Value : is_changed,
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'po_id',
            Value : po_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'po_code',
            Value : po_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'po_types',
            Value : po_types,
        },
        {
            $Type : 'UI.DataField',
            Label : 'po_category',
            Value : po_category,
        },
        {
            $Type : 'UI.DataField',
            Label : 'po_item',
            Value : po_item,
        },
    ],
);

