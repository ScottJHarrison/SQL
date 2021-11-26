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
EXEC pAddSupplier 'Samsung', '2 Factory park', 'China', '123456789';

/*EXECUTE REMOVING A SUPPLIER USING A STORED PROCEDURE*/
EXEC pRemoveSupplier @SupplierID=4;


SELECT * FROM tblSupplier
