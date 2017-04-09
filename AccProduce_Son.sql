USE [SIMS]
--GET LIST ACCOUNT
--Nho kiem tra no co ton tai hay khong.
CREATE PROC GETLISTACC
AS
BEGIN 
	select *from Account 
	
END

EXEC GETLISTACC

--ADD ACCOUNT
alter PROC InsertAcc
(
@UseName varchar(15),
@Password varchar(15),
@FullName nvarchar(60),
@SDT int,
@CreateDate date,
@Role nvarchar(50),
@Status bit
)
AS
BEGIN
	INSERT INTO Account(UseName,Password,FullName,SDT,CreateDate,Role,Status) VALUES(@UseName,@Password,@FullName,@SDT,@CreateDate,@Role,@Status)
	if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp = InsertAcc 'son10','123','son nguyen',789,NULL,'Admin',1
select @tmp
--update account
Alter PROC UpdateAcc
(
@UseName varchar(15),
@FullName nvarchar(60),
@SDT int,
@Role nvarchar(50),
@Status bit
)
AS
BEGIN
	UPDATE Account SET FullName=@FullName,SDT =@SDT, Role =@Role,Status = @Status	
	 WHERE UseName LIKE @UseName
	 if @@ERROR <>0
		return 0
	else
		return 1
END
declare @tmp int;
EXEC @tmp = UpdateAcc 'son10','Nguyen Hong Son',56456154,'Member',0
select @tmp

Alter PROC DeleteAcc
(
	@UseName varchar(15)
)
AS
BEGIN
	DELETE FROM Account WHERE UseName LIKE  @UseName
	if @@ERROR <>0
		return 0
	else
		return 1
END
declare @tmp int;
EXEC @tmp= DeleteAcc 'son10'
select @tmp

