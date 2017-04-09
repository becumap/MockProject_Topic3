create proc GetListBillDetail
as
begin
	select * from BillDetail
end

exec GetListBillDetail

--Inseart Bill

create proc InsertBillDetail
(	
	@BillID int,
	@ItemID nchar(7),
	@Quantity int,
	@Price decimal(18,0)
)
as
begin
	INSERT INTO BillDetail(BillID,ItemID,Quantity,Price) 
	VALUES(@BillID,@ItemID,@Quantity,@Price)
	if @@ERROR <>0
		return 0
	else
		return 1
end

declare @tmp int;
EXEC @tmp = InsertBillDetail 
select @tmp

--Update item
create PROC UpdateBillDetail
(	
	@BillID int,
	@ItemID nchar(7),
	@Quantity int,
	@Price decimal(18,0)
)
AS
BEGIN
	UPDATE BillDetail SET BillID =@BillID, ItemID=@ItemID,
	 Quantity=@Quantity, Price=@Price

	 WHERE BillID = @BillID And ItemID = @ItemID
	 if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp = UpdateBillDetail
select @tmp 