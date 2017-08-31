USE [EnvironWeb]
GO

/****** Object:  Table [dbo].[Substance]    Script Date: 8/31/2017 1:46:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Substance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[SubstanceTypeID] [int] NOT NULL,
	[SubstanceSource] [varchar](40) NULL,
	[SubstanceAmount] [varchar](30) NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Substance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


