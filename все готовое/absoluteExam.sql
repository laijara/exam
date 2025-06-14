USE [master]
GO
/****** Object:  Database [absoluteExam]    Script Date: 02.06.2025 22:13:01 ******/
CREATE DATABASE [absoluteExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'absoluteExam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\absoluteExam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'absoluteExam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\absoluteExam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [absoluteExam] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [absoluteExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [absoluteExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [absoluteExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [absoluteExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [absoluteExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [absoluteExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [absoluteExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [absoluteExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [absoluteExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [absoluteExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [absoluteExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [absoluteExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [absoluteExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [absoluteExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [absoluteExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [absoluteExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [absoluteExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [absoluteExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [absoluteExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [absoluteExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [absoluteExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [absoluteExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [absoluteExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [absoluteExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [absoluteExam] SET  MULTI_USER 
GO
ALTER DATABASE [absoluteExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [absoluteExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [absoluteExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [absoluteExam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [absoluteExam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [absoluteExam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [absoluteExam] SET QUERY_STORE = ON
GO
ALTER DATABASE [absoluteExam] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [absoluteExam]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 02.06.2025 22:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialsId] [int] NOT NULL,
	[MaterialsName] [nvarchar](255) NULL,
	[MaterialsTypeLink] [int] NULL,
	[MaterialsMinPrice] [float] NULL,
	[MaterialsQuantity] [float] NULL,
	[MaterialsMinQuantity] [float] NULL,
	[MaterialsInBox] [float] NULL,
	[MaterialsUnit] [nvarchar](255) NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsProducts]    Script Date: 02.06.2025 22:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialsProducts](
	[MaterialProductsId] [int] NOT NULL,
	[MaterialsProductsMaterialsLink] [int] NULL,
	[MaterialsProductsProductsLink] [int] NULL,
	[MaterialsProductsQuantity] [int] NULL,
 CONSTRAINT [PK_MaterialsProducts] PRIMARY KEY CLUSTERED 
(
	[MaterialProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsType]    Script Date: 02.06.2025 22:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialsType](
	[MaterialsTypeId] [int] NOT NULL,
	[MaterialsTypeType] [nvarchar](255) NULL,
	[MaterialsTypeProcent] [float] NULL,
 CONSTRAINT [PK_MaterialsType] PRIMARY KEY CLUSTERED 
(
	[MaterialsTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02.06.2025 22:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductsId] [int] NOT NULL,
	[ProductsTypeLink] [int] NULL,
	[ProductsName] [nvarchar](255) NULL,
	[ProductsArticle] [nvarchar](255) NULL,
	[ProductsMinPrice] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 02.06.2025 22:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductsTypeId] [int] NOT NULL,
	[ProductsTypeType] [nvarchar](255) NULL,
	[ProductsTypeCoeff] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductsTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialsType] FOREIGN KEY([MaterialsTypeLink])
REFERENCES [dbo].[MaterialsType] ([MaterialsTypeId])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_MaterialsType]
GO
ALTER TABLE [dbo].[MaterialsProducts]  WITH CHECK ADD  CONSTRAINT [FK_MaterialsProducts_Materials] FOREIGN KEY([MaterialsProductsMaterialsLink])
REFERENCES [dbo].[Materials] ([MaterialsId])
GO
ALTER TABLE [dbo].[MaterialsProducts] CHECK CONSTRAINT [FK_MaterialsProducts_Materials]
GO
ALTER TABLE [dbo].[MaterialsProducts]  WITH CHECK ADD  CONSTRAINT [FK_MaterialsProducts_Products] FOREIGN KEY([MaterialsProductsProductsLink])
REFERENCES [dbo].[Products] ([ProductsId])
GO
ALTER TABLE [dbo].[MaterialsProducts] CHECK CONSTRAINT [FK_MaterialsProducts_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([ProductsTypeLink])
REFERENCES [dbo].[ProductType] ([ProductsTypeId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
USE [master]
GO
ALTER DATABASE [absoluteExam] SET  READ_WRITE 
GO
