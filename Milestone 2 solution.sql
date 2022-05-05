CREATE DATABASE PostGradOffice;
go
use PostGradOffice;
CREATE TABLE PostGradUser(
id int primary key identity(1,1),
email varchar(50) not null,
password varchar(30) not null
)
CREATE TABLE Admin(
id int primary key foreign key references PostGradUser on delete cascade on update cascade
)
CREATE TABLE GucianStudent(
id int primary key foreign key references PostGradUser on delete cascade on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2),
undergradID int
)
CREATE TABLE NonGucianStudent(
id int primary key foreign key references PostGradUser on delete cascade on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2),
)
CREATE TABLE GUCStudentPhoneNumber(
id int primary key foreign key references GucianStudent on delete cascade on update cascade,
phone int
)
CREATE TABLE NonGUCStudentPhoneNumber(
id int primary key foreign key references NonGucianStudent on delete cascade on update cascade,
phone int
)
CREATE TABLE Course(
id int primary key identity(1,1),
fees int,
creditHours int,
code varchar(10)
)
CREATE TABLE Supervisor(
id int primary key foreign key references PostGradUser,
name varchar(20),
faculty varchar(30)
);
CREATE TABLE Examiner(
id int primary key foreign key references PostGradUser on delete cascade on update cascade,
name varchar(20),
fieldOfWork varchar(100),
isNational BIT
)
CREATE TABLE Payment(
id int primary key identity(1,1),
amount decimal(7,2),
noOfInstallments int,
fundPercentage decimal(4,2)
)
CREATE TABLE Thesis(
serialNumber int primary key identity(1,1),
field varchar(20),
type varchar(3) not null,
title varchar(100) not null,
startDate date not null,
endDate date not null,
defenseDate date,
years as (year(endDate)- year(startDate)),
grade decimal(4,2),
payment_id int foreign key references payment on delete cascade on update cascade,
noOfExtensions int
)
CREATE TABLE Publication(
id int primary key identity(1,1),
title varchar(100) not null,
dateOfPublication date,
place varchar(100),
accepted BIT,
host varchar(100)
);
Create table Defense (serialNumber int,
date datetime,
location varchar(15),
grade decimal(4,2),
primary key (serialNumber, date),
foreign key (serialNumber) references Thesis on delete cascade on update cascade)
Create table GUCianProgressReport (
sid int foreign key references GUCianStudent on delete cascade on update cascade
, no int
, date datetime
, eval int
, state int
, description varchar(200)
, thesisSerialNumber int foreign key references Thesis on delete cascade on update cascade
, supid int foreign key references Supervisor
, primary key (sid, no) )
Create table NonGUCianProgressReport (sid int foreign key references NonGUCianStudent on delete cascade on update cascade,
no int
, date datetime
, eval int
, state int
, description varchar(200)
, thesisSerialNumber int foreign key references Thesis on delete cascade on update cascade
, supid int foreign key references Supervisor
, primary key (sid, no) )
Create table Installment (date datetime,
paymentId int foreign key references Payment on delete cascade on update cascade
, amount decimal(8,2)
, done bit
, primary key (date, paymentId))
Create table NonGucianStudentPayForCourse(sid int foreign key references NonGucianStudent on delete cascade on update cascade,
paymentNo int foreign key references Payment on delete cascade on update cascade,
cid int foreign key references Course on delete cascade on update cascade,
primary key (sid, paymentNo, cid))
Create table NonGucianStudentTakeCourse (sid int foreign key references NonGUCianStudent on delete cascade on update cascade
, cid int foreign key references Course on delete cascade on update cascade
, grade decimal (4,2)
, primary key (sid, cid) )
Create table GUCianStudentRegisterThesis (sid int foreign key references GUCianStudent on delete cascade on update cascade,
supid int foreign key references Supervisor
, serial_no int foreign key references Thesis on delete cascade on update cascade
, primary key(sid, supid, serial_no))
Create table NonGUCianStudentRegisterThesis (sid int foreign key references NonGUCianStudent on delete cascade on update cascade,
supid int foreign key references Supervisor,
serial_no int foreign key references Thesis on delete cascade on update cascade,
primary key (sid, supid, serial_no))
Create table ExaminerEvaluateDefense(date datetime,
serialNo int,
examinerId int foreign key references Examiner on delete cascade on update cascade,
comment varchar(300),
primary key(date, serialNo, examinerId),
foreign key (serialNo, date) references Defense (serialNumber, date) on delete cascade on update cascade)
Create table ThesisHasPublication(serialNo int foreign key references Thesis on delete cascade on update cascade,
pubid int foreign key references Publication on delete cascade on update cascade,
primary key(serialNo,pubid))
go
create proc studentRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50),
@address varchar(50),
@IDout int output
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
if(@Gucian=1)
insert into GucianStudent(id,firstName,lastName,faculty,address) values(@id,@first_name,@last_name,@faculty,@address)
else
insert into NonGucianStudent(id,firstName,lastName,faculty,address) values(@id,@first_name,@last_name,@faculty,@address)
set @IDout=@id
end
go
create proc supervisorRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@email varchar(50),
@IDout int output
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
declare @name varchar(50)
set @name = CONCAT(@first_name,@last_name)
insert into Supervisor(id,name,faculty) values(@id,@name,@faculty)
set @IDout=@id
end
go
Create proc userLogin
@id int,
@password varchar(20),
@success bit output,
@type int output
as
begin
if exists(
select ID,password
from PostGradUser
where id=@id and password=@password)
begin
set @success =1
-- check user type 0-->Student,1-->Admin,2-->Supervisor ,3-->Examiner
if exists(select id from GucianStudent where id=@id union select id from
NonGucianStudent where id=@id )
set @type=0
if exists(select id from Admin where id=@id)
set @type=1
if exists(select id from Supervisor where id=@id)
set @type=2
if exists(select id from Examiner where id=@id)
set @type=3
end
else
set @success=0
end

go
create proc addMobile
@ID varchar(20),
@mobile_number varchar(20)
as
begin
if @ID is not null and @mobile_number is not null
begin
--check Gucian student or not
if(exists(select * from GucianStudent where id=@ID))
insert into GUCStudentPhoneNumber values(@ID,@mobile_number)
if(exists(select * from NonGucianStudent where id=@ID))
insert into NonGUCStudentPhoneNumber values(@ID,@mobile_number)
end
end
go
CREATE Proc AdminListSup
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
go
CREATE Proc AdminViewSupervisorProfile
@supId int
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
WHERE @supId = s.id
go
CREATE Proc AdminViewAllTheses
As
Select serialNumber,field,type,title,startDate,endDate,defenseDate,years,grade,payment_id,noOfExtensions
From Thesis
go
CREATE Proc AdminViewOnGoingTheses
@thesesCount int output
As
Select @thesesCount=Count(*)
From Thesis
where endDate > Convert(Date,CURRENT_TIMESTAMP)
go
CREATE Proc AdminViewStudentThesisBySupervisor
As
Select s.name,t.title,gs.firstName
From Thesis t inner join GUCianStudentRegisterThesis sr on t.serialNumber=sr.serial_no
inner join Supervisor s on s.id=sr.supid inner join GucianStudent gs on sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
union
Select s.name,t.title,gs.firstName
From Thesis t inner join NonGUCianStudentRegisterThesis sr on t.serialNumber=sr.serial_no
inner join Supervisor s on s.id=sr.supid inner join NonGucianStudent gs on sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
go
go
CREATE Proc AdminListNonGucianCourse
@courseID int
As
if(exists(select * from Course where id=@courseID))
Select ng.firstName,ng.lastName,c.code,n.grade
From NonGucianStudentTakeCourse n inner join Course c on n.cid=c.id inner join NonGucianStudent ng on ng.id=n.sid
where n.cid=@courseID
go
CREATE Proc AdminUpdateExtension
@ThesisSerialNo int,
@exists int output
As
set @exists=0
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
set @exists=1
declare @noOfExtensions int
select @noOfExtensions=noOfExtensions from Thesis where serialNumber=@ThesisSerialNo
update Thesis
set noOfExtensions=@noOfExtensions+1
where serialNumber=@ThesisSerialNo
end
go
CREATE Proc AdminIssueThesisPayment
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal,
@exists int output,
@payid int output
As
set @payid=9999
set @exists=0
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
set @exists=1
insert into Payment(amount,noOfInstallments,fundPercentage) values(@amount,@noOfInstallments,@fundPercentage)
declare @id int
set @payid=SCOPE_IDENTITY()
SELECT @id=SCOPE_IDENTITY()
update Thesis
set payment_id=@id
where serialNumber=@ThesisSerialNo
end
go
CREATE Proc AdminViewStudentProfile
@sid int
As
if(exists(select * from GucianStudent where id=@sid))
Select u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,s.address,s.GPA
from PostGradUser u inner join GucianStudent s on u.id=s.id
WHERE @sid = s.id
else if(exists(select * from NonGucianStudent where id=@sid))
Select u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,s.address,s.GPA
from PostGradUser u inner join NonGucianStudent s on u.id=s.id
WHERE @sid = s.id
go
CREATE Proc AdminIssueInstallPayment
@paymentID int,
@InstallStartDate date,
@exists int output
As
set @exists=0
if(exists(select * from Payment where id=@paymentID))
begin
set @exists=1
declare @numOfInst int
select @numOfInst=noOfInstallments
from Payment
where id=@paymentID
declare @payAmount int
select @payAmount=amount
from Payment
where id=@paymentID
DECLARE @Counter INT
SET @Counter=1
WHILE (@counter<=@numOfInst)
BEGIN
declare @instdate date
set @instdate=@InstallStartDate
declare @instAmount int
set @instAmount=@payAmount/@numOfInst
if(@counter=1)
insert into Installment(date,paymentId,amount,done)values(@InstallStartDate,@paymentID,@instAmount,0)
else
begin
set @instdate=DATEADD(MM, 6, @instdate);
insert into Installment(date,paymentId,amount,done)values(@instdate,@paymentID,@instAmount,0)
end
SET @counter=@counter+1
END
end
go
CREATE Proc AdminListAcceptPublication
As
select t.serialNumber,p.title
from ThesisHasPublication tp inner join Thesis t on tp.serialNo=t.serialNumber
inner join Publication p on p.id=tp.pubid
where p.accepted=1
go
CREATE Proc AddCourse
@courseCode varchar(10),
@creditHrs int,
@fees decimal
As
insert into Course values(@fees,@creditHrs,@courseCode)
go
CREATE Proc linkCourseStudent
@courseID int,
@studentID int
As
if(exists(select * from Course ) and exists(select * from NonGucianStudent where id=@studentID))
insert into NonGucianStudentTakeCourse(sid,cid,grade)values(@studentID,@courseID,null)
go
CREATE Proc addStudentCourseGrade
@courseID int,
@studentID int,
@grade decimal
As
if(exists(select * from NonGucianStudentTakeCourse where sid=@studentID and cid=@courseID))
update NonGucianStudentTakeCourse
set grade =@grade
where cid=@courseID and sid=@studentID
go
CREATE Proc ViewExamSupDefense
@defenseDate datetime
As
select s.serial_no,ee.date,e.name,sup.name
from ExaminerEvaluateDefense ee inner join examiner e on ee.examinerId=e.id
inner join GUCianStudentRegisterThesis s on ee.serialNo=s.serial_no
inner join Supervisor sup on sup.id=s.supid
go
CREATE Proc EvaluateProgressReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int
As
if(exists(select * from Thesis where serialNumber=@thesisSerialNo ) and @evaluation in(0,1,2,3) )
begin
if(exists(select * from GUCianStudentRegisterThesis where serial_no=@thesisSerialNo and supid=@supervisorID))
begin
declare @gucSid int
select @gucSid=sid
from GUCianStudentRegisterThesis
where serial_no=@thesisSerialNo
update GUCianProgressReport
set eval=@evaluation
where sid=@gucSid and thesisSerialNumber=@thesisSerialNo and no=@progressReportNo
end
else if(exists(select * from NonGUCianStudentRegisterThesis where serial_no=@thesisSerialNo and supid=@supervisorID))
begin
declare @nonGucSid int
select @nonGucSid=sid
from NonGUCianStudentRegisterThesis
where serial_no=@thesisSerialNo
update NonGUCianProgressReport
set eval=@evaluation
where sid=@nonGucSid and thesisSerialNumber=@thesisSerialNo and no=@progressReportNo
end
end
go
CREATE Proc ViewSupStudentsYears
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select s.firstName,s.lastName,t.years
from GUCianStudentRegisterThesis sr inner join GucianStudent s on sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
union
select s.firstName,s.lastName,t.years
from NonGUCianStudentRegisterThesis sr inner join NonGucianStudent s on sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
end
go
CREATE Proc SupViewProfile
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select u.id,u.email,u.password,s.name,s.faculty
from PostGradUser u inner join Supervisor s on u.id=s.id
end
go
---------------------------------------
create proc UpdateSupProfile
@supervisorID int, @name varchar(20), @faculty varchar(20)
as
update Supervisor
set name = @name, faculty = @faculty
where id = @supervisorID
go
create proc ViewAStudentPublications
@StudentID int
as
select P.*
from GUCianStudentRegisterThesis GUC
inner join Thesis T
on GUC.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where GUC.sid = @StudentID
union all
select P.*
from NonGUCianStudentRegisterThesis NON
inner join Thesis T
on NON.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where NON.sid = @StudentID
go
create proc AddDefenseGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
insert into Defense values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
go
create proc AddDefenseNonGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
declare @idOfStudent int
select @idOfStudent = sid
from NonGUCianStudentRegisterThesis
where serial_no = @ThesisSerialNo
if(not exists(select grade
from NonGucianStudentTakeCourse
where sid = @idOfStudent and grade < 50))
begin
insert into Defense values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
end
go
create proc AddExaminer
@ThesisSerialNo int , @DefenseDate Datetime , @ExaminerName varchar(20),@Password varchar(30), @National bit, @fieldOfWork varchar(20),
@IDout int output
as
insert into PostGradUser values(@ExaminerName,@Password)
declare @id int
set @id = SCOPE_IDENTITY()
set @IDout=@id
insert into Examiner values(@id,@ExaminerName,@fieldOfWork,@National)
insert into ExaminerEvaluateDefense values(@DefenseDate,@ThesisSerialNo,@id,null)

go
create proc CancelThesis
@ThesisSerialNo int
as
if(exists(
select *
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
))
begin
declare @gucianEval int
set @gucianEval = (
select top 1 eval
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by no desc
)
if(@gucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
end
end
else
begin
declare @nonGucianEval int
set @nonGucianEval = (
select top 1 eval
from NonGUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by no desc
)
if(@nonGucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
end
end
go
create proc AddGrade
@ThesisSerialNo int
as
declare @grade decimal(4,2)
select @grade = grade
from Defense
where serialNumber = @ThesisSerialNo
update Thesis
set grade = @grade
where serialNumber = @ThesisSerialNo
go
create proc AddDefenseGrade
@ThesisSerialNo int , @DefenseDate Datetime , @grade decimal(4,2)
as
update Defense
set grade = @grade
where serialNumber = @ThesisSerialNo and date = @DefenseDate
go
create proc AddCommentsGrade
@ThesisSerialNo int , @DefenseDate Datetime , @comments varchar(300)
as
update ExaminerEvaluateDefense
set comment = @comments
where serialNo = @ThesisSerialNo and date = @DefenseDate
go
create proc viewMyProfile
@studentId int
as
if(exists(
select * from GucianStudent where id = @studentId
))
begin
select G.*,P.email
from GucianStudent G
inner join PostGradUser P
on G.id = P.id
where G.id = @studentId
end
else
begin
select N.*,P.email
from NonGucianStudent N
inner join PostGradUser P
on N.id = P.id
where N.id = @studentId
end
go
create proc editMyProfile
@studentID int, @firstName varchar(20), @lastName varchar(20), @password varchar(30), @email varchar(50)
, @address varchar(50), @type varchar(3)
as
update GucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type = @type
where id = @studentID
update NonGucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type = @type
where id = @studentID
update PostGradUser
set email = @email, password = @password
where id = @studentID
go
create proc addUndergradID
@studentID int, @undergradID varchar(10)
as
update GucianStudent
set undergradID = @undergradID
where id = @studentID
go
create proc ViewCoursesGrades
@studentID int
as
select grade
from NonGucianStudentTakeCourse
where sid = @studentID
go
create proc ViewCoursePaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment',P.fundPercentage as 'Percentage of fund for payment', P.noOfInstallments as 'Number of installments',
I.amount as 'Installment Amount',I.date as 'Installment date', I.done as 'Installment done or not'
from NonGucianStudentPayForCourse NPC
inner join Payment P
on NPC.paymentNo = P.id and NPC.sid = @studentID
inner join Installment I
on I.paymentId = P.id
go
create proc ViewThesisPaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment', P.fundPercentage as 'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as 'Installment done or not'
from GUCianStudentRegisterThesis G
inner join Thesis T
on G.serial_no = T.serialNumber and G.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
union
select P.id as 'Payment Number',P.amount as 'Amount of Payment', P.fundPercentage as 'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as 'Installment done or not'
from NonGUCianStudentRegisterThesis NG
inner join Thesis T
on NG.serial_no = T.serialNumber and NG.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
go
create proc ViewUpcomingInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
go
create proc ViewMissedInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date < CURRENT_TIMESTAMP and I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
go
create proc AddProgressReport
@thesisSerialNo int, @progressReportDate date, @studentID int,@progressReportNo int
as
declare @gucian int
if(exists(
select id
from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
insert into GUCianProgressReport values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
else
begin
insert into NonGUCianProgressReport values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
go
create proc FillProgressReport
@thesisSerialNo int, @progressReportNo int, @state int, @description varchar(200),@studentID int
as
declare @gucian bit
if(exists(
select * from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
update GUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no = @progressReportNo
end
else
begin
update NonGUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no = @progressReportNo
end
go
create proc ViewEvalProgressReport
@thesisSerialNo int, @progressReportNo int,@studentID int
as
select eval
from GUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no = @progressReportNo
union
select eval
from NonGUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no = @progressReportNo
go
create proc addPublication
@title varchar(50), @pubDate datetime, @host varchar(50), @place varchar(50), @accepted bit,@PubID int output
as
insert into Publication values(@title,@pubDate,@place,@accepted,@host)
set @PubID=SCOPE_IDENTITY()
go
create proc linkPubThesis
@PubID int, @thesisSerialNo int
as
insert into ThesisHasPublication values(@thesisSerialNo,@PubID)

go
create proc UpdateExaminerProfile
@ExaminerID int, @name varchar(20), @fieldOfWork varchar(20), @password varchar(20)
as
update Examiner
set name = @name, fieldOfWork=@fieldOfWork
where id = @ExaminerID
update PostGradUser
set password = @password
where id=@ExaminerID

go
create proc ExaminerViewMyProfile
@ExaminerId int
as
if(exists(select * from Examiner where id=@ExaminerId))
begin
select E.*,P.email
from Examiner E inner join PostGradUser P on E.id=P.id
where E.id=@ExaminerId
end

go
CREATE Proc ExaminerViewThesis
@title varchar(40)
As
Select *
From Thesis Th
where Th.title like '%'+@title+'%'

exec ExaminerViewThesis 'of'

go
create proc adminRegister
@password varchar(20),
@email varchar(50),
@IDout int output
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
insert into Admin(id) values(@id)
set @IDout=@id
end
go
create proc ExaminerViewDefenses
@ExaminerId int
as
select Th.title, S.name as 'Supervisor name', GS.firstName as 'Student name'
from ExaminerEvaluateDefense EED inner join Thesis Th on Th.serialNumber=EED.serialNo and EED.examinerId=@ExaminerId
inner join GUCianStudentRegisterThesis GRT on GRT.serial_no=Th.serialNumber 
inner join GucianStudent GS on GS.id=GRT.sid inner join Supervisor S on S.id=GRT.supid
union
(select Th.title, S.name as 'Supervisor name', NGS.firstName as 'Student name'
from ExaminerEvaluateDefense EED inner join Thesis Th on Th.serialNumber=EED.serialNo and EED.examinerId=@ExaminerId
inner join NonGUCianStudentRegisterThesis NGRT on NGRT.serial_no=Th.serialNumber 
inner join NonGucianStudent NGS on NGS.id=NGRT.sid inner join Supervisor S on S.id=NGRT.supid)

go
create proc NonGucianCourses
@studentID int
as
select NGSTC.cid, NGSTC.grade
from NonGucianStudentTakeCourse NGSTC
where NGSTC.sid = @studentID

go
create proc ViewGucianThesis
@studentID int
as
select th.*
from Thesis th inner join GucianStudent GS on th.type = GS.type 
where GS.id = @studentID 

go
create proc ViewNonGucianThesis
@studentID int
as
select th.*
from Thesis th inner join NonGucianStudent NGS on th.type = NGS.type 
where NGS.id = @studentID
go
create trigger deleteSupervisor
on Supervisor
instead of delete
as
delete from GUCianProgressReport where supid in (select id from deleted)
delete from NonGUCianProgressReport where supid in (select id from deleted)
delete from GUCianStudentRegisterThesis where supid in (select id from deleted)
delete from NonGUCianStudentRegisterThesis where supid in (select id from deleted)
delete from Supervisor where id in (select id from deleted)
delete from PostGradUser where id in (select id from deleted)

delete from PostGradUser
delete from Defense
delete from Payment
delete from Thesis
delete from Supervisor

insert into PostGradUser values ('fairPhillip@mail.com','wxkexne')
insert into PostGradUser values ('wickedKristine40@yahoo.com.au','w3z3e')
insert into PostGradUser values ('funnyRoger@bluewin.ch','xrsen32')
insert into PostGradUser values ('anxiousDennis@freenet.de','sama321')
insert into PostGradUser values ('fairKristine49@me.com','bab12')
insert into PostGradUser values ('grotesqueGary51@rediffmail.com','amjse')
insert into PostGradUser values ('creepyJimmy@mail.com','pass2421')
insert into PostGradUser values ('Hannahdangerous@hetnet.nl','mwhatsoever')
insert into PostGradUser values ('Amandacomfortable@sfr.fr','wwhen23')
insert into PostGradUser values ('Kristopherenchanting@earthlink.net','projecte')
insert into PostGradUser values ('Lanceshiny@outlook.com','breakxne')
insert into PostGradUser values ('soreVanessa72@aliceadsl.fr','w211')
insert into PostGradUser values ('panickyRachel69@yahoo.es','back2school')
insert into PostGradUser values ('upsetVincent8@skynet.be','wwhen23')
insert into PostGradUser values ('betterMallory66@web.de','wnicwdkqe')
insert into PostGradUser values ('aliRabie@skynet.be','anx23')
insert into PostGradUser values ('sarahEhab66@web.de','aasmmx')

insert into Admin(id) values(25)
insert into GucianStudent values(26,'Andrew','Sharp','Masters','MET','8 AliEl-Kassar St.',2.12,1141)
insert into GucianStudent values(27,'Amelia','Robertson','PHD','Architecture','1 Salah Salem St.',1.2,1324)
insert into GucianStudent values(28,'Boris','Davidson','Masters','Pharmacy','15a Ibn El-fared St.',0.8,1114)
insert into GucianStudent values(29,'Virginia','Manning','Masters','BI','3 Abo El Soaud St.',3.2,3422)
insert into GucianStudent values(30,'Lucas','Wright','PHD','IET','35 Abbas El Akkad St.',2.8,0122)

insert into NonGucianStudent values(31,'Lana','Fatin','Masters','CS','3 Samir Mokhtar St., Ard El Golf',3.3)
insert into NonGucianStudent values(32,'Dalida','Refaat','PHD','CS','91 El Manyal St., EL MANYAL',1.5)
insert into NonGucianStudent values(33,'Malika','Adel','PHD','Business','7 AbdElAziz ElAttar Giza',2.4)

insert into Supervisor values(34, 'Ali Refaat', 'MET')
insert into Supervisor values(35, 'Rania Khalil', 'IET')
insert into Supervisor values(36, 'Ali Abdel Geleel', 'Pharmacy')

insert into Examiner values(37,'Ali Rabie','Computer Science','1')
insert into Examiner values(38,'Sarah Ehab','Mechatronics','0')

insert into Payment(amount,noOfInstallments) values(612,2)
insert into Payment(amount,noOfInstallments,fundPercentage) values(12673,3, 1.3)
insert into Payment values(6000.0,1, 50.0)
insert into Payment values(5000.0,1, 10.0)
insert into Payment values(7000.0,1, 10.0)
insert into Payment values(4000.0,1, 5.0)
insert into Payment values(9000.0,1, 10.0)
insert into Payment values(12000.0,2, 40.0)
insert into Payment values(9000.0,1, 4.0)
insert into Payment values(6000.0,1, 5.0)
insert into Payment values(10000.0,2, 20.0)
insert into Payment values(5000.0,1, 6.0)
insert into Payment values(6000.0,1, 9.0)
insert into Payment values(15000.0,2, 50.0)
insert into Payment values (4000,1,0.0)

insert into Installment values('1/2/2018',2,306,'1')
insert into Installment values('1/7/2018',2,306,'1')
insert into Installment values('1/3/2018',3,4224,'1')
insert into Installment values('1/8/2018',3,4224,'1')
insert into Installment values('1/2/2019',3,4224,'1')
insert into Installment values('1/2/2020',4,6000,'1')
insert into Installment values('1/2/2018',5,5000,'1')
insert into Installment values('1/4/2021',6,7000,'1')
insert into Installment values('1/2/2018',7,4000,'1')
insert into Installment values('6/3/2020',8,9000,'1')
insert into Installment values('1/2/2018',9,6000,'1')
insert into Installment values('1/8/2020',9,6000,'1')
insert into Installment values('1/2/2020',10,9000,'1')
insert into Installment values('1/9/2020',11,6000,'1')
insert into Installment values('1/2/2020',12,5000,'1')
insert into Installment values('1/8/2020',12,5000,'1')
insert into Installment values('1/2/2020',13,5000,'1')
insert into Installment values('1/2/2020',14,6000,'1')
insert into Installment values('1/2/2020',15,7500,'1')
insert into Installment values('1/8/2020',15,7500,'1')

delete from Thesis
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('nano technology','PHD', 'Nano Technology in genetics', '1/2/2018', '2/6/2021', '2/4/2021', 67, 2,34)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('Mechanics','PHD', 'The mechanics behind back pain', '1/3/2018', '12/6/2021', '2/5/2021', 84, 3,14)
insert into Thesis(field, type, title, startDate, endDate, payment_id,noOfExtensions) 
values('biotechnology','Masters', 'Modern devices used in biotechnology', '1/2/2020','3/2/2023', 4,3)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('Mechanics','PHD', 'Dynamics of Inkjet printing fluids', '1/2/2018', '2/6/2021', '2/4/2021', 61, 5,12)
insert into Thesis(field, type, title, startDate,endDate, payment_id,noOfExtensions) 
values('fluid mechanics','Masters', 'drag reduction', '1/4/2021','5/4/2024', 6,1)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('chemical engineering','Masters', 'next generation Lithium ion batteries', '1/2/2018', '2/6/2021', '2/4/2021', 67, 7,11)
insert into Thesis(field, type, title, startDate,endDate, payment_id,noOfExtensions) 
values('chemical engineering','PHD', 'analysis of Ammonia decomposition catalysts', '6/3/2020','6/5/2023', 8,9)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('computer science','PHD', 'canonical genetic programming', '1/2/2018', '2/6/2021', '2/4/2021', 97, 9,12)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('chemical engineering','PHD', 'nox formation in air combustion', '1/2/2018', '2/6/2021', '2/4/2021', 91, 10,12)
insert into Thesis(field, type, title, startDate,endDate, payment_id,noOfExtensions) 
values('mathematics','Masters', 'applications of continued functions', '1/9/2021','8/7/2024', 11,1)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('mechatronics','Masters', 'analysis of oxide fluid cell', '1/2/2018', '2/6/2021', '12/4/2021',90, 12,13)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('pharmacy','PHD', 'Preemptive Pharmacogenetic Testing', '1/2/2018', '2/6/2021', '2/5/2021', 57, 13,12)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('computer systems','PHD', 'improving cloud transactions', '1/2/2018', '2/6/2021', '9/4/2021', 80, 14,15)
insert into Thesis(field, type, title, startDate, endDate, defenseDate, grade, payment_id,noOfExtensions) 
values('nano technology','Masters', 'effect of nano metals on oral microbial activity', '1/2/2018', '2/6/2021', '7/4/2021', 72, 15,31)


insert into Course values(8000.0,4, 'DMET 102')
insert into Course values(9000.0,4, 'DSD 501')
insert into Course values(9000.0,4, 'DLD 502')
insert into Course values(10000.0,6, 'NTW 503')

insert into Defense values(34,'2/5/2021','H15', 8.4)
insert into Defense values(33,'2/4/2021','H15', 6.7)
insert into Defense values(36,'2/4/2021','H15', 6.1)
insert into Defense values(38,'2/4/2021','H15', 6.7)
insert into Defense values(40,'2/4/2021','H15', 9.7)
insert into Defense values(41,'2/4/2021','H15', 2.7)
insert into Defense values(43,'12/4/2021','H15', 4.7)
insert into Defense values(44,'2/5/2021','H15', 5.7)
insert into Defense values(45,'9/4/2021','H15', 8.1)
insert into Defense values(46,'7/4/2021','H15', 6.9)

 insert into ExaminerEvaluateDefense values ('2/5/2021',34,38,'The candidate demonstrated the ability to understand a vast area of research and
 clearly identify some of the problems in this area.He then went on to develop some novel solutions to these problems.')
 insert into ExaminerEvaluateDefense values ('2/4/2021',33,38,'The candidate demonstrated the ability to understand a vast area of research and
 clearly identify some of the problems in this area.He then went on to develop some novel solutions to these problems.')
 insert into ExaminerEvaluateDefense values ('2/4/2021',36,37,'The candidate demonstrated the ability to understand a vast area of research and 
 clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.')
 insert into ExaminerEvaluateDefense values ('2/4/2021',38,38,'The candidate demonstrated the ability to understand a vast area of research 
 and clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.')
  insert into ExaminerEvaluateDefense values ('2/4/2021',40,38,'The candidate demonstrated the ability to understand a vast area of research 
 and clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.') 
 insert into ExaminerEvaluateDefense values ('2/4/2021',41,38,'The candidate demonstrated the ability to understand a vast area of research 
 and clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.') 
 insert into ExaminerEvaluateDefense values ('12/4/2021',43,37,'The candidate demonstrated the ability to understand a vast area of research 
 and clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.')
  insert into ExaminerEvaluateDefense values ('2/5/2021',44,37,'The candidate demonstrated the ability to understand a vast area of research 
 and clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.')
  insert into ExaminerEvaluateDefense values ('9/4/2021',45,38,'The candidate demonstrated the ability to understand a vast area of research 
 and clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.')
  insert into ExaminerEvaluateDefense values ('7/4/2021',46,37,'The candidate demonstrated the ability to understand a vast area of research 
 and clearly identify some of the problems in this area. He then went on to develop some novel solutions to these problems.')

 insert into GUCianStudentRegisterThesis values(26,34,34)
 insert into NonGUCianStudentRegisterThesis values(32,35,40)
 insert into GUCianStudentRegisterThesis values(29,36,43)
 insert into GUCianStudentRegisterThesis values(27,36,44)