create proc GetListReturnItemDetail
as
begin
	select * from ReturnItemDetail
end

exec GetListReturnItemDetail

--Inseart Bill

create proc InsertReturnItemDetail
(	
	@ReturnItemID nchar(7),
	@CreateBy varchar(15)
)
as
begin
	INSERT INTO ReturnItemDetail(ReturnItemID,CreateBy) 
	VALUES(@ReturnItemID,@CreateBy)
	if @@ERROR <>0
		return 0
	else
		return 1
end

declare @tmp int;
EXEC @tmp = InsertReturnItemDetail 'A2','thach'
select @tmp

--Update item
alter PROC UpdateReturnItemDetail
(	
	@ReturnItemID nchar(7),
	@CreateBy varchar(15)
)
AS
BEGIN
	UPDATE ReturnItemDetail SET CreateBy=@CreateBy
	
	 WHERE ReturnItemID = @ReturnItemID
	 if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp = UpdateReturnItemDetail 'A2','son1'
select @tmp 

Create PROC DeleteReturnItemDetail
(
	@ReturnItemID nchar(7),
	@CreateBy varchar(15)
)
AS
BEGIN
	DELETE FROM ReturnItemDetail WHERE ReturnItemID = @ReturnItemID and CreateBy = @CreateBy
	if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp= DeleteReturnItemDetail 'A2','thach'
select @tmp
