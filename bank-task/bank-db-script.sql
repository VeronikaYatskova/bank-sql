USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 13.11.2022 23:45:24 ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\Users\veron\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\Users\veron\Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank] SET QUERY_STORE = OFF
GO
USE [Bank]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] NOT NULL,
	[balance] [decimal](10, 2) NOT NULL,
	[bank_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Credit_Card]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Credit_Card](
	[id] [int] NOT NULL,
	[account_id] [int] NULL,
	[credit_card_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[id] [int] NOT NULL,
	[name] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank_Filial_City]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Filial_City](
	[id] [int] NOT NULL,
	[bank_id] [int] NULL,
	[filial_id] [int] NULL,
	[city_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credit_Card]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credit_Card](
	[id] [int] NOT NULL,
	[owner_name] [text] NOT NULL,
	[balance] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] NOT NULL,
	[name] [text] NOT NULL,
	[account_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filial]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filial](
	[id] [int] NOT NULL,
	[name] [text] NOT NULL,
	[address] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] NOT NULL,
	[name] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([id])
GO
ALTER TABLE [dbo].[Account_Credit_Card]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Account_Credit_Card]  WITH CHECK ADD FOREIGN KEY([credit_card_id])
REFERENCES [dbo].[Credit_Card] ([id])
GO
ALTER TABLE [dbo].[Bank_Filial_City]  WITH CHECK ADD FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([id])
GO
ALTER TABLE [dbo].[Bank_Filial_City]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Bank_Filial_City]  WITH CHECK ADD FOREIGN KEY([filial_id])
REFERENCES [dbo].[Filial] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([id])
GO
/****** Object:  StoredProcedure [dbo].[AddMoney]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMoney]
	@status_id int
AS
BEGIN
	 IF NOT EXISTS (SELECT id FROM Status WHERE id = @status_id)
	 PRINT 'No such status in the table'
	 ELSE IF NOT EXISTS(SELECT Account.id FROM Account
							JOIN Customer ON Customer.account_id = Account.id
						WHERE Customer.status_id = @status_id)
	 PRINT 'No cards with this status'
	 ELSE
	 BEGIN
		UPDATE Account
		SET Account.balance = Account.balance + (10 * 2.55)
		FROM Customer, Status
		WHERE Account.id = Customer.account_id AND Customer.status_id = @status_id
	 END;
END;
GO
/****** Object:  StoredProcedure [dbo].[TransferMoney]    Script Date: 13.11.2022 23:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransferMoney]
	@account_id int,
	@credit_card_id int,
	@transfer_money decimal(10, 2)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Account WHERE id = @account_id)
	PRINT 'No such account'
	ELSE IF NOT EXISTS (SELECT acc.credit_card_id FROM Account_Credit_Card AS acc, Account
						WHERE Account.id = @account_id AND acc.account_id = Account.id AND acc.credit_card_id = @credit_card_id)
	PRINT 'No such card in the account'
	ELSE IF NOT EXISTS (SELECT acc.account_id
						FROM Account_Credit_Card AS acc, Account, Credit_Card
						WHERE acc.account_id = @account_id AND Account.id = acc.account_id AND Credit_Card.id = acc.credit_card_id
						GROUP BY Account.balance, acc.account_id
						HAVING Account.balance - SUM(Credit_Card.balance) > @transfer_money)
	PRINT 'Not enough money on the account'
	ELSE 
	BEGIN
		SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
		BEGIN TRANSACTION;
			UPDATE Credit_Card
			SET Credit_Card.balance = Credit_Card.balance + @transfer_money
			FROM Account_Credit_Card AS acc
			WHERE acc.account_id = @account_id AND Credit_Card.id = acc.credit_card_id
		COMMIT TRANSACTION;
	END;
END;
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
