using NORTHWIND_SRV from './external/NORTHWIND_SRV';

service NORTHWIND_SRVSample {
    entity Shippers as projection on NORTHWIND_SRV.Shippers;
    entity Customers as projection on NORTHWIND_SRV.Customers;
}
