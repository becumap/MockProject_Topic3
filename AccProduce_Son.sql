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
	INSERT INTO Account(UseName) VALUES(@UseName)
	INSERT INTO Account(Password) VALUES(@Password)
	INSERT INTO Account(FullName) VALUES(@FullName)
	INSERT INTO Account(SDT) VALUES(@SDT)
	INSERT INTO Account(CreateDate) VALUES(@CreateDate)
	INSERT INTO Account(Role) VALUES(@Role)
	INSERT INTO Account(Status) VALUES(@Status)
END

--update account
CREATE PROC UpdateAcc
(
@UseName varchar(15),
@FullName nvarchar(60),
@SDT int,
@CreateDate date,
@Role nvarchar(50),
@Status bit

)
AS
BEGIN
	UPDATE Account SET FullName=@FullName WHERE UseName LIKE @UseName
	UPDATE Account SET SDT=@SDT WHERE UseName LIKE @UseName
	UPDATE Account SET CreateDate=@CreateDate WHERE UseName LIKE @UseName
	UPDATE Account SET Role=@Role WHERE UseName LIKE @UseName
	UPDATE Account SET Status=@Status WHERE UseName LIKE @UseName
END

CREATE PROC DeleteAcc
(
	@UseName varchar(15)
)
AS
BEGIN
	DELETE FROM Account WHERE UseName LIKE  @UseName
END

EXEC DeleteAcc 'son1'

