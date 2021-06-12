--------------------------------- Proceudre Update DimDistrict ------------------------------------------------------
CREATE PROCEDURE dbo.UpdateDimDistrict 
@districtID int, 
@districtName nvarchar(50), 
@Region nvarchar(50),
@State nvarchar(50)
AS 
BEGIN 
	if not exists (select districtSK 
	from dbo.DimDistrict 
	where alternateDistrictID = @districtID) 
	BEGIN 
		insert into dbo.DimDistrict (alternateDistrictID, districtName, Region, State, InsertDate, ModifiedDate) 
		values (@districtID, @districtName, @Region, @State, GETDATE(), GETDATE()) 
	END; 
	if exists (select districtSK 
	from dbo.DimDistrict 
	where alternateDistrictID = @districtID) 
	BEGIN 
		update dbo.DimDistrict set 
		districtName = @districtName, 
		Region = @Region, 
		State = @State, 
		ModifiedDate = GETDATE() 
		where alternateDistrictID = @districtID 
	END; 
END;



----------------------------------- Procedure Update Dim Account -----------------------------------------------
CREATE PROCEDURE dbo.UpdateDimAccount
@accountID varchar(50),
@districtID int,
@frequency varchar(50),
@started_date date
AS
BEGIN
if not exists (select accountSK
from dbo.DimAccount
where alternateAccountID = @accountID)
BEGIN
insert into dbo.DimAccount
(alternateAccountID, districtKey, frequency, started_date, InsertDate, ModifiedDate)
values
(@accountID, @districtID, @frequency, @started_date, GETDATE(), GETDATE())
END;
if exists (select accountSK
from dbo.DimAccount
where alternateAccountID = @accountID)
BEGIN
update dbo.DimAccount
set districtKey = @districtID,
frequency = @frequency,
started_date = @started_date,
ModifiedDate = GETDATE()
where alternateAccountID = @accountID
END;
END;

---------------------------- Procedure Update Loan ------------------------------------------------
CREATE PROCEDURE dbo.UpdateDimLoan
@loanID int,
@accountID int,
@loanDate date,
@amount numeric(38,0),
@duration int,
@payments int,
@status varchar(60)
AS
BEGIN
if not exists (select loanSK from dbo.DimLoan where alternateLoanID = @loanID)
BEGIN
insert into dbo.DimLoan (alternateLoanID, accountID, loanDate, amount, duration, payments, status,
InsertDate, ModifiedDate)
values(@loanID, @accountID, @loanDate, @amount, @duration, @payments, @status, GETDATE(), GETDATE())
END;
if exists (select loanSK from dbo.DimLoan where alternateLoanID = @loanID)
BEGIN
update dbo.DimLoan
set accountID = @accountID, 
loanDate = @loanDate,
amount = @amount,
duration = @duration, 
payments = @payments, 
status = @status,
ModifiedDate = GETDATE()
where alternateLoanID = @loanID
END;
END;

----------------------------- Procedure to update Standing Order --------------------------------------------------
CREATE PROCEDURE dbo.UpdateDimStandingOrder
@standingOrderID int,
@account_ID int,
@bank_to varchar(50),
@account_to int,
@amount numeric(38,0),
@k_symbol varchar(100)
AS
BEGIN
if not exists (select standingOrderSK from dbo.DimStandingOrder where alternateStandingOrderID = @standingOrderID)
BEGIN
insert into DimStandingOrder (alternateStandingOrderID, account_ID, bank_to, account_to, amount, k_symbol, 
InsertDate, ModifiedDate)
values(@standingOrderID, @account_ID, @bank_to, @account_to, @amount, @k_symbol, GETDATE(), GETDATE())
END;
if exists (select standingOrderSK from dbo.DimStandingOrder where alternateStandingOrderID = @standingOrderID)
BEGIN
update dbo.DimStandingOrder
set account_ID = @account_ID, 
bank_to = @bank_to, 
account_to = @account_to,
amount = @amount, 
k_symbol = @k_symbol,
ModifiedDate = GETDATE()
where alternateStandingOrderID = @standingOrderID
END;
END;

----------------------------- Procedure to update Disposition --------------------------------------------------
CREATE PROCEDURE dbo.UpdateDimDisposition
@dispositionID int,
@clientKey int,
@accountKey int,
@type varchar(50)
AS
BEGIN
if not exists (select dispositionSK from dbo.DimDisposition where alternateDispositionID = @dispositionID)
BEGIN
insert into DimDisposition (alternateDispositionID, clientKey, accountKey, dispositionType, 
InsertDate, ModifiedDate)
values(@dispositionID, @clientKey, @accountKey, @type, GETDATE(), GETDATE())
END;
if exists (select dispositionSK from dbo.DimDisposition where alternateDispositionID = @dispositionID)
BEGIN
update dbo.DimDisposition
set clientKey = @clientKey, 
accountKey = @accountKey, 
dispositionType = @type,
ModifiedDate = GETDATE()
where alternateDispositionID = @dispositionID
END;
END;


----------------------------- Procedure to update Disposition --------------------------------------------------
CREATE PROCEDURE dbo.UpdateDimCard
@cardID int,
@dispositionKey int,
@type nvarchar(60),
@issuedDate date
AS
BEGIN
if not exists (select cardSK from dbo.DimCard where alternateCardID = @cardID)
BEGIN
insert into DimCard (alternateCardID, dispositionKey, type, issuedDate, 
InsertDate, ModifiedDate)
values(@cardID, @dispositionKey, @type, @issuedDate, GETDATE(), GETDATE())
END;
if exists (select cardSK from dbo.DimCard where alternateCardID = @cardID)
BEGIN
update dbo.DimCard
set dispositionKey = @dispositionKey, 
type = @type,
issuedDate = @issuedDate,
ModifiedDate = GETDATE()
where alternateCardID = @cardID
END;
END;


