--CREATE VIEW FOR SALES--
GO
CREATE VIEW Sales
AS
SELECT        SaleDateTime, CollectionDate, Collection_OR_Delivery, PaymentAuthorised
FROM            tblSales
GO
--CREATE VIEW FOR PRODUCTS--
CREATE VIEW Products
as
SELECT        ProductMake, ProductModel, Current_Price, Discontinued
FROM            tblProducts
GO
--CREATE VIEW FOR EQUIPMENT--
CREATE VIEW Equipment
AS
SELECT        Equipment_Type_Name, Description
FROM            tblEquipment_Type
GO
--CREATE VIEW FOR CUSTOMER--
CREATE VIEW Customer
AS
SELECT        tblCustomer.*
FROM            tblCustomer
GO
--CREATE VIEW FOR PAYMENT TYPE--
CREATE VIEW Payment
AS
SELECT        tblPaymentType.*
FROM            tblPaymentType
GO
--CREATE VIEW FOR SALES DETAILS--
CREATE VIEW SalesDetails
AS
SELECT        tblSales_Details.*
FROM            tblSales_Details
GO
--CREATE VIEW FOR SUPPLIER--
CREATE VIEW Supplier
AS
SELECT        tblSupplier.*
FROM            tblSupplier
GO
--CREATE VIEW FOR OPERATOR--
CREATE VIEW Operator
AS
SELECT        tblTillOperator.*
FROM            tblTillOperator
GO
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--

