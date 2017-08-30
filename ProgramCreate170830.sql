/*
   Wednesday, August 30, 201710:26:27 PM
   User: 
   Server: GAZI2017\SQLEXPRESS
   Database: EnvironWeb
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Program
	(
	Id int NOT NULL IDENTITY (1, 1),
	ProgramName varchar(20) NOT NULL,
	CityId int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Program ADD CONSTRAINT
	PK_Program PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Program SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Program', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Program', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Program', 'Object', 'CONTROL') as Contr_Per 