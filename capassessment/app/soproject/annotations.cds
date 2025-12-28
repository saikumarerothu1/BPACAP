using ZAPI_SALES_ORDER_SRVSampleService as service from '../../srv/ZAPI_SALES_ORDER_SRV';
annotate service.A_SalesOrder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'SalesOrder',
                Value : SalesOrder,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SalesOrderType',
                Value : SalesOrderType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SalesOrganization',
                Value : SalesOrganization,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CreationDate',
                Value : CreationDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CreatedByUser',
                Value : CreatedByUser,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SalesOrderDate',
                Value : SalesOrderDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TotalNetAmount',
                Value : TotalNetAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransactionCurrency',
                Value : TransactionCurrency,
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
            Label : 'SalesOrder',
            Value : SalesOrder,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SalesOrderType',
            Value : SalesOrderType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SalesOrganization',
            Value : SalesOrganization,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ZAPI_SALES_ORDER_SRVSampleService.EntityContainer/approveSalesorder',
            Label : 'approveSalesorder',
            Inline : true,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ZAPI_SALES_ORDER_SRVSampleService.EntityContainer/rejectSalesorder',
            Label : 'rejectSalesorder',
            Inline : true,
        },
    ],
);

