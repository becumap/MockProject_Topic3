--Search
create proc SearchItem
@searchkey nvarchar(50)
as
begin
	declare @tmp nvarchar(50);
	Set @tmp = ('%'+@searchkey+'%');
	select * from Item
	where [Name] like @tmp or ItemID like @tmp
end

exec SearchItem 'SP'
--Delete Item by ItemID
alter proc DeleteItem
@ItemID nchar(7),
as
	delete from Item where ItemID = @ItemID
	if @@ERROR <>0
		return 0;
	else
		return 1;

declare @tmp int
exec @tmp = DeleteItem 'SP10001'
select @tmp
--Delete Item by CategoryID
create proc DeleteItemByCategoryID
@CategoryID int
as
	delete from Item where CategoryID = @CategoryID
	if @@ERROR <>0
		return 0;
	else
		return 1;

declare @tmp int
exec @tmp = DeleteItemByCategoryID 1
select @tmp

--Delete Category
create proc DeleteCategory
@CategoryID int
as
begin
	declare @tmp int;
	exec @tmp =  DeleteItemByCategoryID @CategoryID
	if((select @tmp) = 1)
	begin
		delete from Category where ID = @CategoryID
	end
	if @@ERROR <>0
		return 0;
	else
		return 1;
end

declare @tmp int
exec @tmp = DeleteCategory 1
select @tmp



