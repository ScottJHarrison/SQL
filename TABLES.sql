-- creating an equipment table --
CREATE TABLE tblEquipment_Type
(
EquipmentID INT IDENTITY(1, 1)NOT NULL,
Equipment_Type_Name NVARCHAR(15)NOT NULL,
"Description" NTEXT NOT NULL,
PRIMARY KEY (EquipmentID)
);

--creating supplier table --
CREATE TABLE tblSupplier
(
SupplierID INT IDENTITY(1, 1)NOT NULL,
SupplierName NVARCHAR(40)NOT NULL,
SupplierAddress NVARCHAR(60)NOT NULL,
Region NVARCHAR(25)NOT NULL,
ContactNumber NVARCHAR(24)NOT NULL,
PRIMARY KEY(SupplierID)
)

--creating payment type table--
CREATE TABLE tblPaymentType
(
PaymentID INT IDENTITY(1, 1)NOT NULL,
PaymentType NVARCHAR(20)NOT NULL,
PRIMARY KEY(PaymentID)
)

--creating till operator table--
CREATE TABLE tblTillOperator
(
OperatorID INT IDENTITY(1, 1)NOT NULL,
FirstName NVARCHAR(20)NOT NULL,
LastName NVARCHAR(20)NOT NULL,
Title NVARCHAR(30)NOT NULL,
ManagementFunctions NVARCHAR(3)NOT NULL,
BirthDate DATE NOT NULL,
Employment DATE NOT NULL,
Active NVARCHAR(5),
OperatorAddress NVARCHAR(20),
ContactSeller NVARCHAR(20),
PRIMARY KEY(OperatorID),
CONSTRAINT CK_BirthDate CHECK(BirthDate<getdate())
)

--creating customer table--
CREATE TABLE tblCustomer
(
CustomerID NVARCHAR(5) NOT NULL,
CustomerForename NVARCHAR(20)NOT NULL,
CustomerSurname NVARCHAR(20)NOT NULL,
CustomerAddress NVARCHAR(20)NOT NULL,
CustomerPostCode NVARCHAR(12)NOT NULL,
CustomerCity NVARCHAR(20)NOT NULL,
CustomerMobile NVARCHAR(12)NOT NULL,
PRIMARY KEY(CustomerID)
)

--creating product table--
CREATE TABLE tblProducts
(
ProductID INT IDENTITY(1, 1)NOT NULL,
ProductMake NVARCHAR(20) NOT NULL,
ProductModel NVARCHAR(20)NOT NULL,
EquipmentID INT NOT NULL,
SupplierID INT NOT NULL,
Current_Price MONEY NOT NULL CONSTRAINT DF_Products_CurrentPrice DEFAULT(0),
Stock_Holding SMALLINT NOT NULL CONSTRAINT DF_Products_Sock_Holding DEFAULT(0),
Reorder_level  SMALLINT NOT NULL CONSTRAINT DF_Products_Reorder_level DEFAULT(0),
Reorder_Quantity SMALLINT NOT NULL CONSTRAINT DF_Products_Reorder_Quantity DEFAULT(0),
Discontinued BIT NOT NULL CONSTRAINT DF_Products_Discontinued DEFAULT(0),
PRIMARY KEY(ProductID),
FOREIGN KEY(EquipmentID) REFERENCES tblEquipment_Type(EquipmentID),
FOREIGN KEY(SupplierID) REFERENCES tblSupplier(SupplierID),
CONSTRAINT "CK_Current_Price" CHECK (Current_Price >= 0),
CONSTRAINT "CK_Reorder_level" CHECK (Reorder_level >=0),
CONSTRAINT "CK_Reorder_Quantity" CHECK (Reorder_Quantity >=0),
);

--create sales record table--
CREATE TABLE tblSales
(
SalesID INT IDENTITY(1, 1)NOT NULL,
SaleDateTime DATETIME NOT NULL,
PaymentID INT NOT NULL,
OperatorID INT NOT NULL,
CustomerID NVARCHAR(5) NOT NULL,
CollectionDate DATETIME NOT NULL,
Collection_OR_Delivery NVARCHAR(10) NOT NULL,
PaymentAuthorised NVARCHAR(10)NOT NULL,
PRIMARY KEY(SalesID),
FOREIGN KEY(PaymentID) REFERENCES tblPaymentType(PaymentID),
FOREIGN KEY(OperatorID) REFERENCES tblTillOperator(OperatorID),
FOREIGN KEY(CustomerID) REFERENCES tblCustomer(CustomerID),
);

--create the sales details table--
CREATE TABLE tblSales_Details
(
SalesID INT NOT NULL,
ProductID INT NOT NULL,
Price_Per_Unit MONEY NOT NULL CONSTRAINT DF_Sales_Details_Price_Per_Unit DEFAULT(0),
Quantity SMALLINT NOT NULL CONSTRAINT DF_Sales_Details_Quantity DEFAULT(1),
Discount REAL NOT NULL CONSTRAINT DF_Sales_Details_Discount DEFAULT(0),
PRIMARY KEY(SalesID, ProductID),
FOREIGN KEY(SalesID) REFERENCES tblSales(SalesID),
FOREIGN KEY(ProductID) REFERENCES tblProducts(ProductID),
)

