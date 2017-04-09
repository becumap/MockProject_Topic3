create proc GetListCate
as
begin
	select * from Category
end

exec GetListCate

--INSERT
alter proc InsertCate
(
	@Name nvarchar(50),
	@CreateDate date,
	@Status bit
)
as
begin
	INSERT INTO Category(Name,CreateDate,Status) VALUES(@Name,@CreateDate,@Status)
	if @@ERROR <>0
		return 0
	else
		return 1
end

declare @tmp int;
EXEC @tmp = InsertCate 'My Pham',NULL,1
select @tmp

--UPDATE
create PROC UpdateCate
(
	@ID int,
	@Name nvarchar(50),
	@Status bit
)
AS
BEGIN
	UPDATE Category SET Name =@Name,Status =@Status
	 WHERE ID = @ID
	 if @@ERROR <>0
		return 0
	else
		return 1
END
declare @tmp int;
EXEC @tmp = UpdateCate 1,'Thoi Trang',0
select @tmp

--delete
Create PROC DeleteCate
(
	@ID int
)
AS
BEGIN
	DELETE FROM Category WHERE ID = @ID
	if @@ERROR <>0
		return 0
	else
		return 1
END
declare @tmp int;
EXEC @tmp= DeleteCate 1
select @tmp
--getbyid

--Get By User Name
create proc GetByID
(
@ID int
)

as
	select * from Category Where ID = @ID

exec GetByID 2