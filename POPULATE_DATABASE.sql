GO
--INSERT EQUIPMENT TYPE DATA--
EXEC pAddEquipmentType'kettle', 'a container used to make tea and hold boiling water';
EXEC pAddEquipmentType'Ball', 'a rubber ball used to play sports ';
EXEC pAddEquipmentType'Toaster', 'a machine used to toast bread';
EXEC pAddEquipmentType'oven', 'a machine used to heat food';
EXEC pAddEquipmentType'Cuttlery', 'Equipment used to eat food';
EXEC pAddEquipmentType'Microwave', 'Machine used to quickly heat food';
EXEC pAddEquipmentType'Fridge', 'Appliance used to keep food at a cool temperature';

GO
--INSERT SUPPLIER DATA--

EXEC pAddSupplier 'Apple', '3 Factory park', 'Ireland', '123456789';
EXEC pAddSupplier 'Huawei', '4 Factory park', 'Japan', '198456789';
EXEC pAddSupplier 'Blackberry', '5 down road', 'Amsterdam', '167456789';
EXEC pAddSupplier 'Motorolla', '18 Factory park', 'Ireland', '1981826789';
EXEC pAddSupplier 'Evike', '7 down road', 'America', '947456789';
EXEC pAddSupplier 'Tokyo Marui', '124 Factory  park', 'Japan', '123456789';
EXEC pAddSupplier 'Taran Tactical', 'Shipment area 4', 'America', '173556789';
GO
--INSERT SALES RECORDS DATA--
EXEC rpAddSalesRecords 5, '2020-05-07 15:34:04.280', 8, 10, 'SEABO', '2020-07-12 15:34:04.280', C, Y;
EXEC rpAddSalesRecords 4, '2020-05-07 15:34:04.280', 7, 10, AK47S, '2020-07-12 15:34:04.280', C, Y;
EXEC rpAddSalesRecords 1, '2020-05-07 15:34:04.280', 8, 10, 'SEABO', '2020-07-12 15:34:04.280', C, Y;
EXEC rpAddSalesRecords 8, '2020-05-07 15:34:04.280', 1, 8, 'SEABO', '2020-05-07 15:34:04.280', C, N;
EXEC rpAddSalesRecords 9, '2020-05-07 15:34:04.280', 6, 8, AK47S, '2020-05-07 15:34:04.280', C, N;
EXEC rpAddSalesRecords 3, '2020-05-07 15:34:04.280', 3, 10, AK47S, '2020-05-07 15:34:04.280', D, Y;
EXEC rpAddSalesRecords 6, '2020-05-07 15:34:04.280', 1, 8, AK47S, '2020-05-07 15:34:04.280', D, N;

GO

--INSERT CUSTOMER DATA--

EXEC spAddCustomer 'SEFBO','John', 'Smith', 'Park Avenue', 'BT5 SQL', 'Belfast', '07255628922';
EXEC spAddCustomer 'AK47S', 'Patrick', 'Mooney', 'Belfast Road', 'BT6 SQL', 'BEelfast', '0719412441';
EXEC spAddCustomer 'CM16S','James', 'Harrison', 'Park road', 'BT7 SQL', 'Blefast', '07987898789';
EXEC spAddCustomer 'AR15L', 'Nadine', 'Johnston', 'Hill View', 'BT8 SQL', 'Bangor', '07182638123'; 
EXEC spAddCustomer 'G17CS', 'Matt', 'Fitz', 'Park View', 'BT9 SQL', 'Lisburn', '0817283912';
EXEC spAddCustomer '1911S', 'Naoise', 'Gerald', 'Downtown', 'BT10 SQL', 'Helens bay', '0818291342';
EXEC spAddCustomer 'FAL15', 'Owen' , 'Dunlop', 'My ladies mile', 'BT11 SQL', 'Holywood', '091829129';
SELECT * FROM tblCustomer
GO


--ADD PRODUCTS DATA--

EXEC spAddProducts 'BMW 3series', 'BMW new car', 2, 7, 30000, 15, 12, 3, 0;
EXEC spAddProducts 'Toyota Supra', 'Toyota new car', 3, 8, 40000, 16, 2, 2, 0;
EXEC spAddProducts 'Vauxhall Corsa', 'Vauxhall new car', 4, 900, 50, 1, 13, 7, 0;
EXEC spAddProducts 'Bugatti', 'Bugatti new car', 5, 8, 6000, 1, 23, 9, 0;
EXEC spAddProducts 'Honda', 'Honda new car', 6, 9, 3000, 15, 12, 3, 0;
EXEC spAddProducts 'BMW 3series', 'BMW new car', 2, 7, 30, 15, 12, 3, 0;
EXEC spAddProducts 'BMW 3series', 'BMW new car', 2, 7, 30, 15, 12, 3, 0;
EXEC spAddProducts 'BMW 3series', 'BMW new car', 2, 7, 30, 15, 12, 3, 0;
GO

--ADD PAYMENT TYPE DATA--
EXEC spAddingPaymentType '2', 'Credit';
EXEC spAddingPaymentType '3', 'Debit';
EXEC spAddingPaymentType '4', 'Paypal';
EXEC spAddingPaymentType '5', 'Visa';
EXEC spAddingPaymentType '6', 'Cash';
EXEC spAddingPaymentType '7', 'Credit';
EXEC spAddingPaymentType '8', 'Visa';
GO

--ADD TILL OPERATOR--
EXEC spAddTillOperator 'Sean', 'Haughey', 'Programmer', 'Dev', '' ,'' , 'yes', 'down Avenue', '0972893023';
EXEC spAddTillOperator 'Max', 'Hardwell', 'Cook', 'Dev', '' ,'' , 'no', 'HillView', '0972893023';
EXEC spAddTillOperator 'Joel', 'Liberante', 'Data engineer', 'Dev', '' ,'' , 'no', 'Park Avenue', '0972893023';
EXEC spAddTillOperator 'Fred', 'Clarke', 'Mechanic', 'Dev', '' ,'' , 'yes', 'Church street', '0972893023';
EXEC spAddTillOperator 'Hannah', 'Burns', 'Teacher', 'Dev', '' ,'' , 'yes', 'Holywood', '0972893023';
GO