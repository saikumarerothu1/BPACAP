using MasterDataService as service from '../../srv/service';
using from '../../db/schema';

annotate service.MaterialTable with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'MaterialCode',
                Value : MaterialCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MaterialDescription',
                Value : MaterialDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StandardPrice',
                Value : StandardPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Flag',
                Value : Flag,
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
            Target : '@UI.FieldGroup#ItemsInfo',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'MaterialCode',
            Value : MaterialCode,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MaterialDescription',
            Value : MaterialDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : 'StandardPrice',
            Value : StandardPrice,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Flag',
            Value : Flag,
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : to_salesitems.Material_MaterialID,
            Label : 'Material_MaterialID',
        },
        {
            $Type : 'UI.DataField',
            Value : to_salesitems.NetValue,
            Label : 'NetValue',
        },
        {
            $Type : 'UI.DataField',
            Value : to_salesitems.OrderedQuantity,
            Label : 'OrderedQuantity',
        },
        {
            $Type : 'UI.DataField',
            Value : to_salesitems.SalesItemID,
            Label : 'SalesItemID',
        },
        {
            $Type : 'UI.DataField',
            Value : to_salesitems.SalesOrder_SalesOrderID,
            Label : 'SalesOrder_SalesOrderID',
        },
        {
            $Type : 'UI.DataField',
            Value : to_salesitems.UnitPrice,
            Label : 'UnitPrice',
        },
    ],
    UI.SelectionFields : [
        MaterialCode,
        MaterialID,
        StandardPrice,
    ],
    UI.FieldGroup #ItemsInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : to_salesitems.Material_MaterialID,
                Label : 'Material_MaterialID',
            },
            {
                $Type : 'UI.DataField',
                Value : to_salesitems.NetValue,
                Label : 'NetValue',
            },
            {
                $Type : 'UI.DataField',
                Value : to_salesitems.SalesOrder_SalesOrderID,
                Label : 'SalesOrder_SalesOrderID',
            },
            {
                $Type : 'UI.DataField',
                Value : to_salesitems.OrderedQuantity,
                Label : 'OrderedQuantity',
            },
            {
                $Type : 'UI.DataField',
                Value : to_salesitems.SalesItemID,
                Label : 'SalesItemID',
            },
            {
                $Type : 'UI.DataField',
                Value : to_salesitems.UnitPrice,
                Label : 'UnitPrice',
            },
        ],
    },
);



annotate service.MaterialTable with {
    MaterialCode @Common.Label : 'MaterialCode'
};

annotate service.MaterialTable with {
    MaterialID @Common.Label : 'MaterialID'
};

annotate service.MaterialTable with {
    StandardPrice @Common.Label : 'StandardPrice'
};

