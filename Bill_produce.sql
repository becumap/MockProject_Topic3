create proc GetListBill
as
begin
	select * from Bill
end

exec GetListBill

--Inseart Bill

create proc InsertBill
(	
	@CreateDate datetime,
	@Price decimal(18,0),
	@CreateBy varchar(15),
	@Status bit
)
as
begin
	INSERT INTO Bill(CreateDate,Price,CreateBy,Status) 
	VALUES(@CreateDate,@Price,@CreateBy,@Status)
	if @@ERROR <>0
		return 0
	else
		return 1
end

declare @tmp int;
EXEC @tmp = InsertBill NULL,800000,'thach',0
select @tmp

--Update item
create PROC UpdateBill
(	
	@ID int,
	@CreateDate datetime,
	@Price decimal(18,0),
	@CreateBy varchar(15),
	@Status bit
)
AS
BEGIN
	UPDATE Bill SET CreateDate =@CreateDate, Price=@Price,
	 CreateBy=@CreateBy, Status=@Status

	 WHERE ID = @ID
	 if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp = UpdateBill 4,NULL,800000,'son1',0
select @tmp 