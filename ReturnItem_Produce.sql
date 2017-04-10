create proc GetListReturnItem
as
begin
	select * from ReturnItem
end

exec GetListReturnItem

--Inseart Bill

create proc InsertReturnItem
(	
	@ReturnItem nchar(7),
	@Quantity int,
	@CreateDate datetime
)
as
begin
	INSERT INTO ReturnItem(ReturnItem,Quantity,CreateDate) 
	VALUES(@ReturnItem,@Quantity,@CreateDate)
	if @@ERROR <>0
		return 0
	else
		return 1
end

declare @tmp int;
EXEC @tmp = InsertReturnItem 'A2',2,NULL
select @tmp

--Update item
create PROC UpdateReturnItem
(	
	@ReturnItem nchar(7),
	@Quantity int,
	@CreateDate datetime
)
AS
BEGIN
	UPDATE ReturnItem SET Quantity =@Quantity, CreateDate=@CreateDate
	
	 WHERE ReturnItem = @ReturnItem
	 if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp = UpdateReturnItem 'A1',3,NULL
select @tmp 

Create PROC DeleteReturnItem
(
	@ReturnItem nchar(7)
)
AS
BEGIN
	DELETE FROM ReturnItem WHERE ReturnItem = @ReturnItem
	if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp= DeleteReturnItem 'A1'
select @tmp
