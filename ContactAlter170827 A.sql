/*
   Sunday, August 27, 201712:47:23 PM
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
CREATE TABLE dbo.Tmp_Contact
	(
	Id int NOT NULL IDENTITY (1, 1),
	FirstName varchar(20) NOT NULL,
	LastName varchar(10) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Contact SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Contact ON
GO
IF EXISTS(SELECT * FROM dbo.Contact)
	 EXEC('INSERT INTO dbo.Tmp_Contact (Id, FirstName, LastName)
		SELECT Id, FirstName, CONVERT(varchar(10), LastName) FROM dbo.Contact WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Contact OFF
GO
DROP TABLE dbo.Contact
GO
EXECUTE sp_rename N'dbo.Tmp_Contact', N'Contact', 'OBJECT' 
GO
ALTER TABLE dbo.Contact ADD CONSTRAINT
	PK_Contact PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Contact', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Contact', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Contact', 'Object', 'CONTROL') as Contr_Per 