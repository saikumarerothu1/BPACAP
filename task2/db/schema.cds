namespace my.sample;

using { managed } from '@sap/cds/common';

entity Customer : managed {
    key ID        : UUID;
    firstName     : String(80);
    lastName      : String(80);
    email         : String(120);
    phoneNumber   : String(20);
    products      : Composition of many Product
                    on products.customer = $self;
}

entity Product : managed {
    key ID        : UUID;
    name          : String(100);
    category      : String(50);
    price         : Decimal(10,2);
    stockQuantity : Integer;
    customer      : Association to Customer;
}
