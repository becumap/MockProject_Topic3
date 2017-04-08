USE [SIMS]
--GET LIST ACCOUNT
CREATE PROC GETLISTACC
AS
BEGIN 
	select *from Account 
	
END

EXEC GETLISTACC

--ADD ACCOUNT
CREATE PROC InsertAcc
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
	
END

EXEC InsertAcc 'son1','123','son nguyen',789,NULL,'Admin',1
--update account
CREATE PROC UpdateAcc
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
END

EXEC UpdateAcc 'son1','Nguyen Hong Son',56456154,'Member',0

CREATE PROC DeleteAcc
(
	@UseName varchar(15)
)
AS
BEGIN
	DELETE FROM Account WHERE UseName LIKE  @UseName
END

EXEC DeleteAcc 'son1'

