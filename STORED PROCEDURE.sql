--CREATE STORED PROCEDURES--
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
--CREATE EQUIPMENT TYPE USING STORED PROCEDURES--
CREATE PROCEDURE pAddEquipmentType

@Equipment_Type_Name NVARCHAR (15),
@Description NTEXT

AS
INSERT INTO tblEquipment_Type
(Equipment_Type_Name, Description
)
VALUES
(
@Equipment_Type_Name, (@Description
))
SELECT * FROM tblEquipment_Type;
GO

/*Execution of the equipment type value stored procedure*/
EXEC pAddEquipmentType'rugby ball', 'a piece of equipment used to play rugby';
GO

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
--CREATING STORED PROCEDURE FOR ADD SUPPLIER--
CREATE PROCEDURE pAddSupplier
@SupplierName NVARCHAR(40),
@SupplierAddress NVARCHAR(40),
@Region NVARCHAR(15),
@ContactNumber NVARCHAR(24)
AS
INSERT INTO tblSupplier
(SupplierName,SupplierAddress,Region,ContactNumber
)
VALUES
(
@SupplierName,@SupplierAddress,@Region,@ContactNumber
);
SELECT * FROM tblSupplier;
GO

/*REMOVE A SUPPLIER USING STORED PROCEDURE*/

CREATE PROCEDURE pRemoveSupplier
@SupplierID INT
AS
BEGIN
SET NOCOUNT ON
DELETE FROM tblSupplier
WHERE SupplierID = @SupplierID
SET NOCOUNT OFF
END
GO

/*EXECUTE ADDING A SUPPLIER USING A STORED PROCEDURE*/
EXEC pAddSupplier 'Test', 'TEST', 'TEST', '123456789';

/*EXECUTE REMOVING A SUPPLIER USING A STORED PROCEDURE*/
EXEC pRemoveSupplier @SupplierID=11;

SELECT * FROM tblSupplier
GO


--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
--CREATING A PROCEDURE TO ADD A CUSTOMER--
CREATE PROCEDURE spAddCustomer
@CustomerID NVARCHAR(5),
@CustomerForename NVARCHAR(20),
@CustomerSurname NVARCHAR(20),
@CustomerAddress NVARCHAR(20),
@CustomerPostCode NVARCHAR(12),
@CustomerCity NVARCHAR(12),
@CustomerMobile NVARCHAR(14)
AS
INSERT INTO tblCustomer
(
CustomerID,CustomerForename,CustomerSurname,CustomerAddress,CustomerPostCode,CustomerCity,CustomerMobile
)
VALUES
(
@CustomerID,@CustomerForename,@CustomerSurname,@CustomerAddress,@CustomerPostCode,@CustomerCity,@CustomerMobile
);
SELECT * FROM tblCustomer
GO

--UPDATE A CUSTOMER USING A STORED PROCEDURE--
CREATE PROCEDURE spUpdateCustomer
@CustomerID NVARCHAR(5),
@CustomerForename NVARCHAR(20),
@CustomerSurname NVARCHAR(20),
@CustomerAddress NVARCHAR(20),
@CustomerPostCode NVARCHAR(12),
@CustomerCity NVARCHAR(12),
@CustomerMobile NVARCHAR(14)
AS
UPDATE tblCustomer
set
CustomerID = @CustomerID,
CustomerForename = @CustomerForename,
CustomerSurname = @CustomerSurname,
CustomerAddress = @CustomerAddress,
CustomerPostCode = @CustomerPostCode,
CustomerCity = @CustomerCity,
CustomerMobile = @CustomerMobile

WHERE CustomerID = @CustomerID

--EXECUTE ADDING CUSTOMER--
EXEC spAddCustomer 'SEABO', 'TEST', 'TEST', 'Church road', 'BT4 SQL', 'BELFAST', '07818291'; 
--EXECUTE UPDATE CUSTOMER--
EXEC spUpdateCustomer 'SEABO', 'Scott', 'Harrison', 'Church road', 'BT4 SQL', 'TEST', '07818291'; 
GO

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
--CREATE PROCEDURE FOR PAYMENT TYPE--
CREATE PROCEDURE spAddingPaymentType
@PaymentID INT,
@PaymentType NVARCHAR(20)
AS
SET IDENTITY_INSERT tblPaymentType ON
INSERT INTO tblPaymentType
(
PaymentID,PaymentType
)
VALUES
(
@PaymentID,@PaymentType
);
SET IDENTITY_INSERT tblPaymentType OFF
SELECT*FROM tblPaymentType
GO

--UPDATE PAYMENT TYPE--
CREATE PROCEDURE pUpdatePaymentType
@PaymentID INT,
@PaymentType NVARCHAR(20)
AS
UPDATE tblPaymentType
set
PaymentType = @PaymentType
WHERE PaymentID = @PaymentID

--REMOVE PAYMENT TYPE--
CREATE PROCEDURE spRemovePaymentType
@PaymentID INT
AS
BEGIN
SET NOCOUNT ON
DELETE FROM tblPaymentType
WHERE PaymentID = @PaymentID
SET NOCOUNT OFF
END
GO
--EXECUTING ADD PAYMENT TYPE--
EXEC spAddingPaymentType '1', 'Cash';
--EXECTUING UPDATE PAYMENT TYPE--
EXEC pUpdatePaymentType '1','TEST';
--EXECUTING REMOVE PAYMENT TYPE--
EXEC spRemovePaymentType @PaymentID = 1;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
--CREATE PROCEDURE FOR PRODUCT--
CREATE PROCEDURE spAddProducts
@ProductMake NVARCHAR(40),
@ProductModel NVARCHAR(40),
@EquipmentID INT,
@SupplierID INT,
@Current_Price MONEY,
@Stock_Holding SMALLINT,
@Reorder_level SMALLINT,
@Reorder_Quanitity SMALLINT,
@Discontinued BIT
AS
INSERT INTO tblProducts
(
ProductMake,ProductModel,EquipmentID,SupplierID,Current_Price,Stock_Holding,Reorder_level,Reorder_Quantity,Discontinued
)
VALUES
(
@ProductMake,@ProductModel,@EquipmentID,@SupplierID,@Current_Price,@Stock_Holding,@Reorder_level,@Reorder_Quanitity,@Discontinued
);
SELECT*FROM tblProducts
GO

--CREATE PROCEDURE TO REMOVE PRODUCTS--
CREATE PROCEDURE spRemoveProduct
@ProductID INT
AS
BEGIN
SET NOCOUNT ON
DELETE FROM tblProducts
WHERE ProductID = @ProductID
SET NOCOUNT OFF
END
GO

--CREATE PROCEDURE UPDATE PRODUCT--
CREATE PROCEDURE spUpdateProduct
@ProductID INT,
@ProductMake NVARCHAR(40),
@ProductModel NVARCHAR(40),
@EquipmentID INT,
@SupplierID INT,
@Current_Price MONEY,
@Stock_Holding SMALLINT,
@Reorder_level SMALLINT,
@Reorder_Quanitity SMALLINT,
@Discontinued BIT
AS
UPDATE tblProducts

set

ProductMake = @ProductMake,
ProductModel = @ProductModel,
EquipmentID = @EquipmentID,
SupplierID = @SupplierID,
Current_Price = @Current_Price,
Stock_Holding = @Stock_Holding,
Reorder_level = @Reorder_level,
Reorder_Quantity = @Reorder_Quanitity,
Discontinued = @Discontinued

WHERE ProductID = @ProductID

--EXECUTE ADD PRODUCT--
EXEC spAddProducts 'TEST', 'TEST', 1, 5, 20, 17, 10, 5, 0;
--UPDATE PRODUCT--
EXEC spUpdateProduct 7, 'TET', 'AASDDASDI', 1, 5, 20, 17, 10, 5, 0;
--REMOVE PRODUCT--
EXEC spRemoveProduct @ProductID =4;
SELECT * FROM tblProducts
GO
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
--CREATE PROCEDURE FOR SALES RECORDS--
CREATE PROCEDURE rpAddSalesRecords
@SalesID INT,
@SalesDateTime DATETIME,
@PaymentID INT,
@OperatorID INT,
@CustomerID NVARCHAR (5),
@CollectionDate DATETIME,
@Collection_Or_Delivery NVARCHAR(20),
@PaymentAuthorised NVARCHAR(20)
AS
SET IDENTITY_INSERT tblSales ON
INSERT INTO tblSales
(
SalesID,SaleDateTime,PaymentID,OperatorID,CustomerID,CollectionDate,Collection_OR_Delivery,PaymentAuthorised
)
VALUES
(
@SalesID,@SalesDateTime,@PaymentID,@OperatorID,@CustomerID,@CollectionDate,@Collection_Or_Delivery,@PaymentAuthorised
);
SET IDENTITY_INSERT tblSales OFF
SELECT*FROM tblSales
GO

--CREATE A SALES DETAIL PROCEDURE--
CREATE PROCEDURE spAddSalesDetail
@SalesID INT,
@ProductID INT,
@Price_Per_Unit MONEY,
@Quantity SMALLINT,
@Discount REAL
AS
INSERT INTO tblSales_Details
(
SalesID,ProductID,Price_Per_Unit,Quantity,Discount
)
VALUES
(
@SalesID,@ProductID,@Price_Per_Unit,@Quantity,@Discount
);
SELECT*FROM tblSales_Details
GO

--CREATE A PROCEDURE TO REMOVE SALE--
CREATE PROCEDURE spRemoveSale
@SalesID INT
AS
BEGIN
SET NOCOUNT ON
DELETE FROM tblSales_Details
WHERE SalesID = @SalesID
DELETE FROM tblSales
WHERE SalesID = @SalesID
SET NOCOUNT OFF
END
GO

--ADDING A SALES RECORD USING A STORED PROCEDURE-- 

EXEC rpAddSalesRecords 2, '2020-05-07 15:34:04.280', 5, 8, SEABO, '2020-05-07 15:34:04.280', C, N;
go

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
--CREATE TILL OPERATOR PROCEDURE--
CREATE PROCEDURE spAddTillOperator
@FirstName NVARCHAR(20),
@LastName NVARCHAR(20),
@Title NVARCHAR(10),
@ManagementFunctions NVARCHAR(40),
@BirthDate DATE,
@Employment DATE,
@Active NVARCHAR(5),
@OperatorAddress NVARCHAR(40),
@ContactSeller NVARCHAR(20)
AS
INSERT INTO tblTillOperator
(
FirstName,LastName,Title,ManagementFunctions,BirthDate,Employment,Active,OperatorAddress,ContactSeller
)
VALUES
(
@FirstName, @LastName, @Title, @ManagementFunctions, @BirthDate, @Employment, @Active, @OperatorAddress, @ContactSeller
);
SELECT*FROM tblTillOperator
GO

--CREATE PROCEDURE UPDATE TILL OPERATOR--
CREATE PROCEDURE spUpdateTillOperator
@OperatorID INT,
@FirstName NVARCHAR(20),
@LastName NVARCHAR(20),
@Title NVARCHAR(10),
@ManagementFunctions NVARCHAR(40),
@BirthDate DATE,
@Employment DATE,
@Active NVARCHAR(5),
@OperatorAddress NVARCHAR(40),
@ContactSeller NVARCHAR(20)
AS
UPDATE tblTillOperator
set
FirstName = @FirstName,
LastName = @LastName,
Title = @Title,
ManagementFunctions = @ManagementFunctions,
BirthDate = @BirthDate,
Employment = @Employment,
Active = @Active,
OperatorAddress = @OperatorAddress,
ContactSeller = @ContactSeller
WHERE OperatorID = @OperatorID

--CREATE A REMOVE OPERATOR PROCEDURE--
CREATE PROCEDURE spRemoveOperator
@OperatorID INT
AS
BEGIN
SET NOCOUNT ON
DELETE FROM tblTillOperator
WHERE OperatorID = @OperatorID
SET NOCOUNT OFF
END
GO

--CREATE A TILL OPERATOR--
 
EXEC spAddTillOperator 'Scott', 'Harrison', 'Programmer', 'Dev', '' ,'' , 'yes', 'Park Avenue', '0972893023';

--CREATE A REMOVE OPERATOR PROCEDURE--
EXEC spRemoveOperator @OperatorID = 5;

--CREATE AN EXECUTION FOR UPDATING OPERATOR--
EXEC spUpdateTillOperator 7, 'Scott', 'Harrison', 'Programmer', 'Dev', '' ,'' , 'yes', 'Park Avenue', '0972893023';
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--
GO


ALTER DATABASE SCOPED CONFIGURATION 
  SET VERBOSE_TRUNCATION_WARNINGS = ON;