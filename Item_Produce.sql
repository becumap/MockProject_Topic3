create proc GetListItem
as
begin
	select * from Item
end

exec GetListItem

--Inseart Item

create proc InsertItem
(
	@ItemID nchar(7),
	@Name nvarchar(50),
	@Image ntext,
	@Price decimal(18,0),
	@Quantity int,
	@CreateDate date,
	@CreateBy varchar(15),
	@CategoryID int,
	@Status bit
)
as
begin
	INSERT INTO Item(ItemID,Name,Image,Price,Quantity,CreateDate,CreateBy,CategoryID,Status) 
	VALUES(@ItemID,@Name,@Image,@Price,@Quantity,@CreateDate,@CreateBy,@CategoryID,@Status)
	if @@ERROR <>0
		return 0
	else
		return 1
end

declare @tmp int;
EXEC @tmp = InsertItem 'A1','Day001','D:/1212.jpg',800000,4,NULL,'son nguyen',2,1
select @tmp

--Update item
create PROC UpdateItem
(	
	@ItemID nchar(7),
	@Name nvarchar(50),
	@Image ntext,
	@Price decimal(18,0),
	@Quantity int,
	@CreateDate date,
	@CreateBy varchar(15),
	@CategoryID int,
	@Status bit
)
AS
BEGIN
	UPDATE Item SET Name =@Name, Image=@Image, Price=@Price,
	Quantity=@Quantity, CreateDate=@CreateDate, CreateBy=@CreateBy,
	CategoryID=@CategoryID, Status=@Status

	 WHERE ItemID = @ItemID
	 if @@ERROR <>0
		return 0
	else
		return 1
END
declare @tmp int;
EXEC @tmp = UpdateItem 'A1','Quan1','D:/1111.jpg',60000,2,NULL,'thach nguyen',3,0
select @tmp 

--Delete Item
Create PROC DeleteItem
(
	@ItemID nchar(7)
)
AS
BEGIN
	DELETE FROM Item WHERE ItemID = @ItemID
	if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp= DeleteCate 1
select @tmp

--Search Item
Create Proc SearchItem
(
	@SearchKey nvarchar(50)
)