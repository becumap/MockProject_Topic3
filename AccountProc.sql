--Get By User Name
create proc GetByUserName
@username varchar(15)
as
	select * from Account Where [UseName] = @username

exec GetByUserName 'thach'
--Check User Name -> check exits of username
create proc CheckUserName
@username varchar(15)
as
Begin
	if((select count([UseName]) from Account where [UseName]='thach' Group by [UseName])>0)
		return 1;
	else
		return 0;
End

declare @temp int;
exec @temp= CheckUserName 'thach';
select @temp


--Login
create proc [Login]
@username varchar(15),
@password varchar(15),
@isloginadmin bit
as
Begin
	declare @exitsusername int;
	exec @exitsusername = CheckUserName @username
	if(@exitsusername = 0)
		return 0; --tài khoản không tồn tại
		declare @Role nvarchar(50);
		declare @Status bit;
		declare @Passwordtmp varchar(15);
		select @Role= [Role], @Status = [Status],@Passwordtmp = [Password] from Account where [UseName] = @username
	if(@isloginadmin=1)
	Begin
		if(@Role = 'Admin' or @Role = 'Mod')
		Begin
			if(@Status = 0)
				return -1; --tài khoản bị khóa
			if(@Passwordtmp = @password)
				return 1;--đúng pass
			else
				return -2;--sai pass
		End
		else
		Begin
			return -3;--loại tài khoản không phải admin or mod
		End
	End
	else
	Begin
		if(@Status = 0)
				return -1; --tài khoản bị khóa
			if(@Passwordtmp = @password)
				return 1;--đúng pass
			else
				return -2;--sai pass
	End
End

exec [Login] 'thach','000',1
--