create proc GetListReport
as
begin
	select * from ReportExeception
end

exec GetListReport

--Inseart Report
alter proc InsertReport
(	
	@Content ntext,
	@CreateDate datetime,
	@CreateBy varchar(15)
)
as
begin
	INSERT INTO ReportExeception(Content,CreateDate,CreateBy) 
	VALUES(@Content,@CreateDate,@CreateBy)
	if @@ERROR <>0
		return 0
	else
		return 1
end

declare @tmp int;
EXEC @tmp = InsertReport 'this is tesr report 2',NULL,'son1'
select @tmp

--Update Report
create PROC UpdateReport
(	
	@ID int,
	@Content ntext,
	@CreateDate datetime,
	@CreateBy varchar(15)
)
AS
BEGIN
	UPDATE ReportExeception SET Content =@Content, CreateDate=@CreateDate,
	 CreateBy=@CreateBy

	 WHERE ID = @ID
	 if @@ERROR <>0
		return 0
	else
		return 1
END

declare @tmp int;
EXEC @tmp = UpdateReport 2,'this report has been changed',NULL,'son1'
select @tmp 

Create proc DeleteReport
(
	@ID int
)
as
begin
	DELETE FROM ReportExeception WHERE ID =  @ID
	if @@ERROR <>0
		return 0
	else
		return 1
end

exec DeleteReport 2
