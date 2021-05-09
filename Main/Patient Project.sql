truncate table patientrecords
truncate table missingpatients
truncate table Logpatient

use usa
go

select *from patientrecords
go
select *from MissingPatients
select value  from missingpatients cross apply string_split([flat file source error output column],'|')
 
go
select *from logpatient

drop table if exists logpatient
Create table LogPatient(PackageName varchar(max),TaskName varchar(max),PassedtoStage INT,RejectedRows INT,
RDataTable Varchar(max) default 'MissingPatients',loadDate datetime default getdate())

insert into LogPatient(PackageName,TaskName,PassedtoStage,RejectedRows) values(?,?,?,?)
