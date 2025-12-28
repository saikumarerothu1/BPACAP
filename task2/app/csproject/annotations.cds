using CatalogService as service from '../../srv/service';
annotate service.Customers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'phoneNumber',
                Value : phoneNumber,
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
            Target : 'products/@UI.LineItem#ItemsInfo',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'phoneNumber',
            Value : phoneNumber,
        },
    ],
);

annotate service.Products with @(
    UI.LineItem #ItemsInfo : [
        {
            $Type : 'UI.DataField',
            Value : customer.products.category,
            Label : 'category',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.stockQuantity,
            Label : 'stockQuantity',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items Info',
            ID : 'ItemsInfo',
            Target : '@UI.Identification',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : customer.products.customer.products.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.customer.products.price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.customer.products.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.customer.products.stockQuantity,
            Label : 'stockQuantity',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.products.customer.products.category,
            Label : 'category',
        },
    ],
);

