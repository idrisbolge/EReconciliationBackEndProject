USE [master]
GO
/****** Object:  Database [eReconciliationDb]    Script Date: 9.04.2023 17:34:55 ******/
CREATE DATABASE [eReconciliationDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eReconciliationDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eReconciliationDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eReconciliationDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eReconciliationDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [eReconciliationDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eReconciliationDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eReconciliationDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eReconciliationDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eReconciliationDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eReconciliationDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eReconciliationDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [eReconciliationDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eReconciliationDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eReconciliationDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eReconciliationDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eReconciliationDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eReconciliationDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eReconciliationDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eReconciliationDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eReconciliationDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eReconciliationDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eReconciliationDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eReconciliationDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eReconciliationDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eReconciliationDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eReconciliationDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eReconciliationDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eReconciliationDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eReconciliationDb] SET RECOVERY FULL 
GO
ALTER DATABASE [eReconciliationDb] SET  MULTI_USER 
GO
ALTER DATABASE [eReconciliationDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eReconciliationDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eReconciliationDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eReconciliationDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eReconciliationDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eReconciliationDb] SET QUERY_STORE = OFF
GO
USE [eReconciliationDb]
GO
/****** Object:  Table [dbo].[AccountReconciliationDetails]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReconciliationDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountReconciliationId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[CurrencyDebit] [money] NOT NULL,
	[CurrencyCredit] [money] NOT NULL,
 CONSTRAINT [PK_AccountReconciliationDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountReconciliations]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReconciliations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CurrencyAccountId] [int] NOT NULL,
	[StartingDate] [date] NOT NULL,
	[EndingDate] [date] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[CurrencyDebit] [money] NOT NULL,
	[CurrencyCredit] [money] NOT NULL,
	[IsSendMail] [bit] NOT NULL,
	[SendEmailDate] [datetime] NULL,
	[IsEmailRead] [bit] NULL,
	[EmailReadDate] [datetime] NULL,
	[IsResultSucceed] [bit] NULL,
	[ResultDate] [datetime] NULL,
	[ResultNote] [varchar](500) NULL,
 CONSTRAINT [PK_AccountReconciliations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaBsReconciliations]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaBsReconciliations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CurrencyAccountId] [int] NOT NULL,
	[Type] [char](2) NOT NULL,
	[Mount] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[IsSendEmail] [bit] NOT NULL,
	[SendEmailDate] [datetime] NULL,
	[IsEmailRead] [bit] NULL,
	[EmailReadDate] [datetime] NULL,
	[IsResultSucceed] [bit] NULL,
	[ResultDate] [datetime] NULL,
	[ResultNote] [varchar](500) NULL,
 CONSTRAINT [PK_BaBsReconciliations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaBsReconciliationsDetails]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaBsReconciliationsDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BaBsReconciliationId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_BaBsReconciliationsDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[TaxDepartment] [varchar](100) NOT NULL,
	[TaxIdNumber] [char](10) NULL,
	[IdentityNumber] [char](11) NULL,
	[AddedAt] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyAccounts]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyAccounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Code] [varchar](150) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[TaxDepartment] [varchar](150) NULL,
	[TaxIdNumber] [char](10) NULL,
	[IdentityNumber] [char](11) NULL,
	[Email] [varchar](250) NULL,
	[Authorized] [varchar](150) NULL,
	[IsActive] [bit] NULL,
	[AddedAt] [datetime] NULL,
 CONSTRAINT [PK_CurrencyAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailParameters]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailParameters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[SMTP] [varchar](150) NOT NULL,
	[Port] [int] NOT NULL,
	[SSL] [bit] NOT NULL,
 CONSTRAINT [PK_MailParameters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailTemplates]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailTemplates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MailTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[AddedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_OperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCompanies]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompanies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[AddedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserCompanies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
	[AddedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_UserOperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9.04.2023 17:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PasswordSalt] [varbinary](max) NOT NULL,
	[PasswordHash] [varbinary](max) NOT NULL,
	[AddedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[MailConfirm] [bit] NOT NULL,
	[MailConfirmValue] [nvarchar](max) NOT NULL,
	[MailConfirmDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (3, N'Aren Yazılım Ltd. Şti', N'Ankara', N'Yenimahalle', N'string    ', N'string     ', CAST(N'2023-03-25T14:27:10.513' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (4, N'Mai Güzellik Merkezi', N'İstanbul', N'Sultanbeyli', N'string    ', N'string     ', CAST(N'2023-03-25T15:31:08.297' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (5, N'Arıcı Teknik', N'Konya', N'Konya', N'string    ', N'string     ', CAST(N'2023-03-25T15:33:54.483' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (6, N'Arıcı Teknik', N'Konya', N'Konya', N'string    ', N'string     ', CAST(N'2023-03-25T15:33:54.483' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (7, N'TEST', N'string', N'string', N'string    ', N'string     ', CAST(N'2023-04-09T13:33:38.097' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (8, N'TEST', N'string', N'string', N'string    ', N'string     ', CAST(N'2023-04-09T13:33:38.097' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (9, N'string', N'string', N'string', N'string    ', N'string     ', CAST(N'2023-04-09T13:36:49.117' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (10, N'string', N'string', N'string', N'string    ', N'string     ', CAST(N'2023-04-09T13:36:49.117' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (11, N'İdris tesd', N'string', N'string', N'string    ', N'string     ', CAST(N'2023-04-09T13:42:50.893' AS DateTime), 1)
INSERT [dbo].[Companies] ([Id], [Name], [Address], [TaxDepartment], [TaxIdNumber], [IdentityNumber], [AddedAt], [IsActive]) VALUES (12, N'Deneme Şirketi', N'string', N'string', N'string    ', N'string     ', CAST(N'2023-04-09T14:30:09.323' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[MailParameters] ON 

INSERT [dbo].[MailParameters] ([Id], [CompanyId], [Email], [Password], [SMTP], [Port], [SSL]) VALUES (1, 3, N'idrisbolge74@gmail.com', N'sqppawwvrigetgxz', N'smtp.gmail.com', 587, 1)
SET IDENTITY_INSERT [dbo].[MailParameters] OFF
GO
SET IDENTITY_INSERT [dbo].[MailTemplates] ON 

INSERT [dbo].[MailTemplates] ([Id], [CompanyId], [Type], [Value]) VALUES (1, 3, N'Kayıt', N'<html>
  <head>
    <meta http-equiv=''Content-Type'' content="text/html; charset=utf-8" />
    <style>
       /* Add custom classes and styles that you want inlined here */
    </style>
  </head>
  <body class="bg-light">
    <div class="container">
      <div class="card my-10">
        <div class="card-body">
          <h1 class="h3 mb-2">{{title}}</h1>
          
          <hr>
          <div class="space-y-3">           
            <p class="text-gray-700">
             {{message}}
            </p>            
          </div>
          <hr>
          <a class="btn btn-primary" href="{{link}}" target="_blank">{{linkDescription}}</a>
        </div>
      </div>
    </div>
  </body>
</html>
')
SET IDENTITY_INSERT [dbo].[MailTemplates] OFF
GO
SET IDENTITY_INSERT [dbo].[UserCompanies] ON 

INSERT [dbo].[UserCompanies] ([Id], [UserId], [CompanyId], [AddedAt], [IsActive]) VALUES (1, 1, 12, CAST(N'2023-04-09T17:30:34.900' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserCompanies] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [PasswordSalt], [PasswordHash], [AddedAt], [IsActive], [MailConfirm], [MailConfirmValue], [MailConfirmDate]) VALUES (1, N'İdris Bölge', N'idrisbolge74@gmail.com', 0x4DD4B8D4A63DD19809B9F5C530A02D3961950CE8CEAD39DFE428DF5A3A294C93D56FF1436F06E514254EFABADA17606A5281AD197C2BFECD2AE8643EC334FE7C45432D289A590280BBECE6A6D4B950FD8964BB359E484615692575F3C04448B6974061E39F846A45451C4B3BF611F94DC0C6771AF92906661C900B36470700E8, 0xE25594C0AAA8B984C026C10E0FF91CA585D56B44E80E25833DA934F93D3C36C3B29DDC22689AFA081AC4594B3D140285E59BC1039FAC478132E3273438BC924E, CAST(N'2023-04-09T17:30:34.620' AS DateTime), 1, 0, N'07882d70-de51-4338-bac1-e3937f2b9676', CAST(N'2023-04-09T17:30:34.620' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Currencies_Code_Name]    Script Date: 9.04.2023 17:34:55 ******/
ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [UK_Currencies_Code_Name] UNIQUE NONCLUSTERED 
(
	[Code] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 9.04.2023 17:34:55 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountReconciliationDetails]  WITH CHECK ADD  CONSTRAINT [FK_AccountReconciliationDetails_AccountReconciliations] FOREIGN KEY([AccountReconciliationId])
REFERENCES [dbo].[AccountReconciliations] ([Id])
GO
ALTER TABLE [dbo].[AccountReconciliationDetails] CHECK CONSTRAINT [FK_AccountReconciliationDetails_AccountReconciliations]
GO
ALTER TABLE [dbo].[AccountReconciliationDetails]  WITH CHECK ADD  CONSTRAINT [FK_AccountReconciliationDetails_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[AccountReconciliationDetails] CHECK CONSTRAINT [FK_AccountReconciliationDetails_Currencies]
GO
ALTER TABLE [dbo].[AccountReconciliations]  WITH CHECK ADD  CONSTRAINT [FK_AccountReconciliations_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[AccountReconciliations] CHECK CONSTRAINT [FK_AccountReconciliations_Companies]
GO
ALTER TABLE [dbo].[AccountReconciliations]  WITH CHECK ADD  CONSTRAINT [FK_AccountReconciliations_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[AccountReconciliations] CHECK CONSTRAINT [FK_AccountReconciliations_Currencies]
GO
ALTER TABLE [dbo].[BaBsReconciliations]  WITH CHECK ADD  CONSTRAINT [FK_BaBsReconciliations_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[BaBsReconciliations] CHECK CONSTRAINT [FK_BaBsReconciliations_Companies]
GO
ALTER TABLE [dbo].[BaBsReconciliationsDetails]  WITH CHECK ADD  CONSTRAINT [FK_BaBsReconciliationsDetails_BaBsReconciliations] FOREIGN KEY([BaBsReconciliationId])
REFERENCES [dbo].[BaBsReconciliations] ([Id])
GO
ALTER TABLE [dbo].[BaBsReconciliationsDetails] CHECK CONSTRAINT [FK_BaBsReconciliationsDetails_BaBsReconciliations]
GO
ALTER TABLE [dbo].[CurrencyAccounts]  WITH CHECK ADD  CONSTRAINT [FK_CurrencyAccounts_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[CurrencyAccounts] CHECK CONSTRAINT [FK_CurrencyAccounts_Companies]
GO
ALTER TABLE [dbo].[UserCompanies]  WITH CHECK ADD  CONSTRAINT [FK_UserCompanies_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[UserCompanies] CHECK CONSTRAINT [FK_UserCompanies_Companies]
GO
ALTER TABLE [dbo].[UserCompanies]  WITH CHECK ADD  CONSTRAINT [FK_UserCompanies_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserCompanies] CHECK CONSTRAINT [FK_UserCompanies_Users]
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserOperationClaims_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims] CHECK CONSTRAINT [FK_UserOperationClaims_Companies]
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserOperationClaims_OperationClaims] FOREIGN KEY([OperationClaimId])
REFERENCES [dbo].[OperationClaims] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims] CHECK CONSTRAINT [FK_UserOperationClaims_OperationClaims]
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserOperationClaims_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims] CHECK CONSTRAINT [FK_UserOperationClaims_Users]
GO
USE [master]
GO
ALTER DATABASE [eReconciliationDb] SET  READ_WRITE 
GO
