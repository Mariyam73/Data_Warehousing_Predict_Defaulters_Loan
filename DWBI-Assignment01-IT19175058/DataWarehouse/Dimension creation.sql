USE [Pedict_loan_defaulters_DW]
GO

/****** Object:  Table [dbo].[DimAccount]    Script Date: 5/10/2021 1:53:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAccount](
	[accountSK] [int] IDENTITY(1,1) NOT NULL,
	[alternateAccountID] [varchar](50) NOT NULL,
	[districtKey] [int] NULL,
	[frequency] [varchar](50) NULL,
	[started_date] [date] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimAccount] PRIMARY KEY CLUSTERED 
(
	[accountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[DimClient]    Script Date: 5/10/2021 1:53:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimClient](
	[clientSK] [int] IDENTITY(1,1) NOT NULL,
	[alternateClientID] [varchar](50) NOT NULL,
	[birthDate] [date] NULL,
	[age] [int] NULL,
	[firstName] [varchar](60) NULL,
	[lastName] [varchar](60) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[districtSK] [int] NULL,
	[Address_1] [nvarchar](100) NULL,
	[Address_2] [nvarchar](100) NULL,
	[ZipCode] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimClient] PRIMARY KEY CLUSTERED 
(
	[clientSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[DimDisposition]    Script Date: 5/10/2021 1:54:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDisposition](
	[dispositionSK] [int] IDENTITY(1,1) NOT NULL,
	[alternateDispositionID] [int] NOT NULL,
	[clientKey] [int] NULL,
	[accountKey] [int] NULL,
	[dispositionType] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimDisposition] PRIMARY KEY CLUSTERED 
(
	[dispositionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[DimDistrict]    Script Date: 5/10/2021 1:54:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDistrict](
	[districtSK] [int] IDENTITY(1,1) NOT NULL,
	[alternateDistrictID] [int] NOT NULL,
	[districtName] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimDistrict] PRIMARY KEY CLUSTERED 
(
	[districtSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[DimLoan]    Script Date: 5/10/2021 1:55:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimLoan](
	[loanSK] [int] IDENTITY(1,1) NOT NULL,
	[alternateLoanID] [int] NOT NULL,
	[accountID] [int] NULL,
	[loanDate] [date] NULL,
	[amount] [numeric](38, 0) NULL,
	[duration] [int] NULL,
	[payments] [int] NULL,
	[status] [varchar](60) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimLoan] PRIMARY KEY CLUSTERED 
(
	[loanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO




/****** Object:  Table [dbo].[DimStandingOrder]    Script Date: 5/10/2021 1:55:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimStandingOrder](
	[standingOrderSK] [int] IDENTITY(1,1) NOT NULL,
	[alternateStandingOrderID] [int] NOT NULL,
	[account_ID] [int] NULL,
	[bank_to] [varchar](50) NULL,
	[account_to] [int] NULL,
	[amount] [numeric](38, 0) NULL,
	[k_symbol] [varchar](100) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimStandingOrder] PRIMARY KEY CLUSTERED 
(
	[standingOrderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[DimCard]    Script Date: 5/10/2021 1:56:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCard](
	[cardSK] [int] IDENTITY(1,1) NOT NULL,
	[alternateCardID] [int] NOT NULL,
	[dispositionKey] [int] NULL,
	[type] [nvarchar](60) NULL,
	[issuedDate] [date] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimCard] PRIMARY KEY CLUSTERED 
(
	[cardSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[FactTransaction]    Script Date: 5/10/2021 1:56:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactTransaction](
	[transactionID] [int] NOT NULL,
	[accountKey] [int] NULL,
	[clientKey] [int] NULL,
	[loanKey] [int] NULL,
	[standingOrderKey] [int] NULL,
	[dispositionKey] [int] NULL,
	[dateKey] [int] NULL,
	[type] [varchar](100) NULL,
	[amount] [numeric](38, 0) NULL,
	[balance] [numeric](38, 0) NULL,
	[operation] [varchar](100) NULL,
	[bank] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO



