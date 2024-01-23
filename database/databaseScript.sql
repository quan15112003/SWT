USE [master]
GO
/****** Object:  Database [PROJECT]    Script Date: 11/6/2023 8:23:50 PM ******/
CREATE DATABASE [PROJECT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROJECT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PROJECT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROJECT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PROJECT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PROJECT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROJECT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROJECT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROJECT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROJECT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROJECT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROJECT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PROJECT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROJECT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROJECT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROJECT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROJECT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROJECT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROJECT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROJECT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROJECT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROJECT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROJECT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROJECT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PROJECT] SET  MULTI_USER 
GO
ALTER DATABASE [PROJECT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROJECT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROJECT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROJECT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROJECT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROJECT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PROJECT] SET QUERY_STORE = ON
GO
ALTER DATABASE [PROJECT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PROJECT]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[isSeller] [bit] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDetail]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDetail](
	[id] [int] NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[avatar] [varchar](100) NULL,
	[amount] [money] NULL,
	[gender] [bit] NULL,
	[phoneNumber] [varchar](10) NULL,
	[emailAddress] [varchar](50) NULL,
	[Region/Country] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[date] [date] NULL,
	[userId] [int] NULL,
	[productId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[date] [date] NULL,
	[totalmoney] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[oId] [int] NOT NULL,
	[pId] [int] NOT NULL,
	[sizeId] [int] NOT NULL,
	[matId] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[oId] ASC,
	[pId] ASC,
	[sizeId] ASC,
	[matId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](100) NULL,
	[cid] [int] NOT NULL,
	[sid] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[pId] [int] NOT NULL,
	[sId] [int] NOT NULL,
	[mId] [int] NOT NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pId] ASC,
	[sId] ASC,
	[mId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 11/6/2023 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (1, N'Ria', N'123', 1, 1)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (2, N'Lia', N'234', 0, 1)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (3, N'Tia', N'456', 1, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (4, N'Mia', N'345', 0, -1)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (5, N'Sistine', N'234', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (6, N'Alya', N'567', 1, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (7, N'Long', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (9, N'Mahiru', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (10, N'Celia', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (11, N'Chris', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (12, N'Rin', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (13, N'Rum', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (14, N'Rena', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (15, N'Lina', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (16, N'Rina', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (17, N'Luna', N'123', 0, -1)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (18, N'Tina', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (19, N'Sylvi', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (20, N'Shia', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (21, N'longhb622003@gmail.com', N'', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (22, N'ariahb622003@gmail.com', N'', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (23, N'longnhhe172431@fpt.edu.vn', N'', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (24, N'Runa', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([id], [account], [password], [isSeller], [isAdmin]) VALUES (25, N'Nina', N'123', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (1, N'Long', N'img-avatar/IMG_1312.JPG', 100.0000, 1, N'0866162397', N'longnhhe172431@fpt.edu.vn', N'Thach That')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (2, N'Lia', NULL, NULL, NULL, NULL, NULL, N'Ha Noi')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (3, N'Tia', NULL, NULL, NULL, NULL, NULL, N'Ho Chi Minh')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (4, N'Mia', NULL, NULL, NULL, NULL, NULL, N'Ha Noi')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (5, N'Sistine', N'img-avatar/IMG_0194.JPG', NULL, 0, N'0866162397', N'longnhhe172431@fpt.edu.vn', N'VietNam')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (6, N'Alya', NULL, NULL, NULL, NULL, NULL, N'Ha Noi')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (7, N'Long', NULL, NULL, NULL, NULL, NULL, N'Ho Chi Minh')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (9, N'Shiina Mahiru', NULL, NULL, 0, N'0123456789', N'mahimahi@gmail.com', N'VietNam')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (10, N'Celia', NULL, NULL, NULL, NULL, NULL, N'Ho Chi Minh')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (11, N'Chris', NULL, NULL, NULL, NULL, NULL, N'Ho Chi Minh')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (12, N'Rin', NULL, NULL, NULL, NULL, NULL, N'Da Nang')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (13, N'Rum', NULL, NULL, NULL, NULL, NULL, N'Da Nang')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (14, N'Rena', NULL, NULL, NULL, NULL, NULL, N'Da Nang')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (15, N'Lina', N'img-avatar/IMG_1438.JPG', NULL, 0, N'', N'', N'Da Nang')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (16, N'Rinaa', N'img-avatar/IMG_1678.JPG', NULL, 0, N'', N'', N'Ha Noi')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (17, N'Luna', NULL, NULL, NULL, NULL, NULL, N'Son La')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (18, N'Tina', N'img-avatar/IMG_0006.PNG', NULL, NULL, N'', N'', N'Ha Noi')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (19, N'Sylvi', NULL, NULL, NULL, NULL, NULL, N'Thanh Hoa')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (20, N'Shia', N'img-avatar/IMG_1680.JPG', NULL, NULL, N'', N'', N'Hung Yen')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (21, N'Long Nguyen', N'img-avatar/IMG_0796.JPG', NULL, 1, N'0866162397', N'longnhhe172431@fpt.edu.vn', N'Nghe An')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (22, N'Long Nguyen', N'img-avatar/IMG_0194.JPG', NULL, 1, N'0866162397', N'longnhhe172431@fpt.edu.vn', N'Ca Mau')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (23, N'Long Nguyen', N'img-avatar/IMG_1312.JPG', NULL, 1, N'0866162397', N'longnhhe172431@fpt.edu.vn', N'Vinh Long')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (24, N'Runa', N'img-avatar/803337455293038673.png', NULL, NULL, N'', N'', N'Quang Binh')
GO
INSERT [dbo].[AccountDetail] ([id], [fullName], [avatar], [amount], [gender], [phoneNumber], [emailAddress], [Region/Country]) VALUES (25, N'nina', N'img-avatar/803337455293038673.png', NULL, 0, N'213412', N'421', N'Ninh Thuan')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name], [image]) VALUES (1, N'Figure', N'img/cat1.jpg')
GO
INSERT [dbo].[Category] ([id], [name], [image]) VALUES (2, N'Nendoroid', N'img/cat2.jpg')
GO
INSERT [dbo].[Category] ([id], [name], [image]) VALUES (3, N'Standee', N'img/cat3.jpg')
GO
INSERT [dbo].[Category] ([id], [name], [image]) VALUES (4, N'Accessory', N'img/cat4.jpg')
GO
INSERT [dbo].[Category] ([id], [name], [image]) VALUES (5, N'Keypad', N'img/cat5.jpg')
GO
INSERT [dbo].[Category] ([id], [name], [image]) VALUES (6, N'Poster', N'img/cat6.jpg')
GO
INSERT [dbo].[Category] ([id], [name], [image]) VALUES (7, N'Others', N'img/cat7.jpg')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (1, N'comment dau tien', CAST(N'2023-06-22' AS Date), 1, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (2, N'comment thu 2', CAST(N'2021-05-05' AS Date), 21, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (3, N'comment thu 3', CAST(N'2022-02-06' AS Date), 22, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (4, N'comment thu 4', CAST(N'2023-07-08' AS Date), 23, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (5, N'<p>comment thu 5</p>', CAST(N'2023-07-08' AS Date), 24, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (6, N'<p>comment thu 6</p><p><br></p>', CAST(N'2023-07-08' AS Date), 24, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (7, N'<p>comment thu 7</p>', CAST(N'2023-07-08' AS Date), 15, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (8, N'<p><span style="background-color: rgb(0, 0, 255); color: rgb(255, 0, 255);">Comment thu 8&nbsp;</span></p>', CAST(N'2023-07-08' AS Date), 15, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (9, N'<span style="color: rgb(255, 0, 255);">Sieu cap cute pho mai que&nbsp;</span>', CAST(N'2023-07-08' AS Date), 15, 15)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (10, N'<p><span style="color: rgb(255, 0, 255);">Bây giờ đã có 1 comment</span></p>', CAST(N'2023-07-08' AS Date), 18, 26)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (11, N'<p>comment 1</p>', CAST(N'2023-07-10' AS Date), 1, 4)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (12, N'<p><span style="color: rgb(0, 0, 255);">comment 2</span></p>', CAST(N'2023-07-10' AS Date), 1, 4)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (13, N'<p><span style="background-color: rgb(255, 255, 0);">comment 3&nbsp;</span></p>', CAST(N'2023-07-10' AS Date), 22, 4)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (14, N'<p>comment 4</p>', CAST(N'2023-07-10' AS Date), 1, 4)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (15, N'<p><span style="background-color: rgb(255, 255, 0); color: rgb(0, 255, 255);">Comment 1</span></p>', CAST(N'2023-07-10' AS Date), 1, 9)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (16, N'<p>commmmmmm</p><p><br></p>', CAST(N'2023-07-10' AS Date), 21, 1070)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (17, N'<p>comment 2</p>', CAST(N'2023-07-10' AS Date), 1, 26)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (18, N'<p>comment 3</p>', CAST(N'2023-07-10' AS Date), 1, 26)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (19, N'<p>comment</p>', CAST(N'2023-07-10' AS Date), 1, 2)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (20, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (21, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (22, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (23, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (24, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (25, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (26, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (27, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (28, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (29, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (30, N'<p>12</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (31, N'<p>123</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (32, N'<p>123</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (33, N'<p>12121</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (34, N'<p>12121231</p>', CAST(N'2023-07-10' AS Date), 1, 3)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (35, N'<p>comment 2</p><p><br></p>', CAST(N'2023-07-11' AS Date), 1, 2)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (36, N'<p>comment 3</p><p><br></p><p><br></p><p><br></p>', CAST(N'2023-07-11' AS Date), 1, 2)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (37, N'<p>comment 4</p>', CAST(N'2023-07-11' AS Date), 1, 2)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (38, N'<p>comment 5</p>', CAST(N'2023-07-11' AS Date), 1, 2)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (39, N'<p>comment 9</p>', CAST(N'2023-07-11' AS Date), 1, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (40, N'<p>comment 10</p>', CAST(N'2023-07-11' AS Date), 1, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (41, N'<p>comment 11</p><p><br></p>', CAST(N'2023-07-11' AS Date), 18, 33)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (42, N'<p>móada</p>', CAST(N'2023-07-12' AS Date), 22, 26)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (43, N'<p>nóadg</p>', CAST(N'2023-07-12' AS Date), 22, 26)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (44, N'<p>comment 1</p><p><br></p>', CAST(N'2023-07-14' AS Date), 1, 40)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (45, N'<p>commwent 2</p>', CAST(N'2023-07-14' AS Date), 1, 40)
GO
INSERT [dbo].[Comment] ([id], [content], [date], [userId], [productId]) VALUES (46, N'<p><span style="background-color: rgb(0, 255, 255); color: rgb(0, 0, 255);">cacsa á</span></p>', CAST(N'2023-07-14' AS Date), 1, 40)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 
GO
INSERT [dbo].[Material] ([id], [name]) VALUES (1, N'Default')
GO
INSERT [dbo].[Material] ([id], [name]) VALUES (2, N'Nhựa hàng hiệu')
GO
INSERT [dbo].[Material] ([id], [name]) VALUES (3, N'Lụa quý''s tộc')
GO
INSERT [dbo].[Material] ([id], [name]) VALUES (4, N'Giấy hàng hiệu')
GO
INSERT [dbo].[Material] ([id], [name]) VALUES (5, N'Gỗ cổ thụ vạn năm')
GO
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2, 5, CAST(N'2023-06-14' AS Date), 2891.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (3, 2, CAST(N'2023-06-14' AS Date), 320.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (5, 2, CAST(N'2023-06-14' AS Date), 200.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (6, 2, CAST(N'2023-06-14' AS Date), 160.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (7, 2, CAST(N'2023-06-14' AS Date), 341.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (8, 7, CAST(N'2023-06-14' AS Date), 525.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (9, 7, CAST(N'2023-06-14' AS Date), 2945.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1002, 7, CAST(N'2023-06-19' AS Date), 6385.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1003, 7, CAST(N'2023-06-19' AS Date), 210.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1004, 7, CAST(N'2023-06-19' AS Date), 485.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1005, 7, CAST(N'2023-06-19' AS Date), 125.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1006, 7, CAST(N'2023-06-19' AS Date), 1199.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1007, 7, CAST(N'2023-06-19' AS Date), 1199.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1008, 7, CAST(N'2023-06-19' AS Date), 1199.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1009, 7, CAST(N'2023-06-19' AS Date), 270.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (1010, 7, CAST(N'2023-04-25' AS Date), 400.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2010, 7, CAST(N'2023-06-26' AS Date), 5000.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2011, 1, CAST(N'2023-06-27' AS Date), 1604.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2012, 7, CAST(N'2023-06-27' AS Date), 2060.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2013, 7, CAST(N'2023-06-27' AS Date), 2060.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2014, 5, CAST(N'2023-06-29' AS Date), 2405.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2015, 10, CAST(N'2023-06-29' AS Date), 2035.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2016, 11, CAST(N'2023-06-29' AS Date), 295.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2017, 11, CAST(N'2023-06-29' AS Date), 160.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2018, 12, CAST(N'2023-05-29' AS Date), 2620.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2019, 12, CAST(N'2023-04-29' AS Date), 245.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2020, 13, CAST(N'2023-01-29' AS Date), 690.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2021, 14, CAST(N'2023-01-29' AS Date), 385.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2022, 14, CAST(N'2023-02-28' AS Date), 395.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2023, 14, CAST(N'2023-03-28' AS Date), 160.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2024, 14, CAST(N'2023-04-28' AS Date), 295.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2025, 15, CAST(N'2023-07-28' AS Date), 120.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2026, 16, CAST(N'2023-08-28' AS Date), 640.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2027, 17, CAST(N'2023-09-28' AS Date), 125.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2028, 18, CAST(N'2023-10-28' AS Date), 341.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2029, 19, CAST(N'2023-11-28' AS Date), 140.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2030, 20, CAST(N'2023-12-28' AS Date), 145.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2031, 11, CAST(N'2022-01-01' AS Date), 290.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2032, 12, CAST(N'2022-05-30' AS Date), 290.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2033, 11, CAST(N'2022-02-05' AS Date), 435.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2034, 11, CAST(N'2022-03-04' AS Date), 400.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2035, 10, CAST(N'2022-04-05' AS Date), 500.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2036, 9, CAST(N'2022-06-01' AS Date), 600.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2037, 12, CAST(N'2022-07-22' AS Date), 800.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2038, 13, CAST(N'2022-08-03' AS Date), 400.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2039, 14, CAST(N'2022-09-15' AS Date), 500.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2040, 12, CAST(N'2022-10-16' AS Date), 1000.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2041, 11, CAST(N'2022-11-13' AS Date), 2000.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2043, 13, CAST(N'2022-12-31' AS Date), 3000.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2044, 13, CAST(N'2022-05-22' AS Date), 300.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2045, 12, CAST(N'2022-06-22' AS Date), 4000.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2046, 21, CAST(N'2023-07-03' AS Date), 545.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2047, 22, CAST(N'2023-07-03' AS Date), 1260.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2048, 23, CAST(N'2023-07-04' AS Date), 910.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2049, 24, CAST(N'2023-07-08' AS Date), 290.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2050, 24, CAST(N'2023-07-09' AS Date), 1850.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2051, 23, CAST(N'2023-07-09' AS Date), 1224.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2052, 22, CAST(N'2023-07-09' AS Date), 1532.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2053, 22, CAST(N'2023-07-09' AS Date), 630.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2054, 20, CAST(N'2023-07-09' AS Date), 940.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2055, 20, CAST(N'2023-07-09' AS Date), 980.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2056, 23, CAST(N'2023-07-10' AS Date), 640.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2057, 21, CAST(N'2023-07-10' AS Date), 3650.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2058, 21, CAST(N'2023-07-14' AS Date), 60.0000)
GO
INSERT [dbo].[Order] ([id], [cid], [date], [totalmoney]) VALUES (2059, 21, CAST(N'2023-07-14' AS Date), 200.0000)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2, 26, 3, 5, 1, 1500.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2, 29, 1, 2, 1, 600.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2, 36, 5, 1, 2, 203.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2, 38, 1, 1, 1, 385.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (3, 9, 1, 1, 2, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (5, 4, 1, 1, 1, 200.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (6, 9, 1, 1, 1, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (7, 34, 1, 1, 1, 341.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (8, 7, 1, 1, 1, 125.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (8, 12, 1, 1, 1, 190.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (8, 21, 1, 1, 1, 210.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (9, 11, 1, 1, 1, 145.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (9, 28, 1, 1, 5, 320.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (9, 29, 1, 5, 1, 1200.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1002, 21, 1, 1, 2, 210.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1002, 36, 3, 5, 2, 1300.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1002, 37, 1, 1, 4, 360.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1002, 38, 1, 1, 5, 385.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1003, 21, 1, 1, 1, 210.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1004, 5, 1, 1, 1, 150.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1004, 7, 1, 1, 1, 125.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1004, 21, 1, 1, 1, 210.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1005, 7, 1, 1, 1, 125.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1006, 10, 1, 1, 1, 155.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1006, 13, 1, 1, 1, 200.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1006, 17, 1, 1, 1, 225.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1006, 20, 1, 1, 1, 299.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1006, 23, 1, 1, 2, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1007, 10, 1, 1, 1, 155.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1007, 13, 1, 1, 1, 200.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1007, 17, 1, 1, 1, 225.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1007, 20, 1, 1, 1, 299.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1007, 23, 1, 1, 2, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1008, 10, 1, 1, 1, 155.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1008, 13, 1, 1, 1, 200.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1008, 17, 1, 1, 1, 225.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1008, 20, 1, 1, 1, 299.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1008, 23, 1, 1, 2, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1009, 2, 4, 2, 1, 120.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (1009, 3, 1, 1, 1, 150.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2010, 26, 5, 5, 5, 1000.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2011, 7, 1, 1, 1, 125.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2011, 10, 1, 1, 1, 155.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2011, 11, 1, 1, 1, 145.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2011, 12, 1, 1, 1, 190.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2011, 25, 1, 1, 1, 340.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2011, 28, 1, 1, 1, 320.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2011, 29, 1, 1, 1, 329.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2012, 21, 1, 1, 2, 210.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2012, 26, 3, 1, 2, 820.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2013, 21, 1, 1, 2, 210.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2013, 26, 3, 1, 2, 820.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2014, 36, 5, 5, 1, 800.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2014, 37, 1, 1, 2, 360.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2014, 38, 1, 1, 1, 385.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2014, 44, 1, 1, 1, 500.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2015, 14, 1, 1, 2, 240.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2015, 22, 1, 1, 2, 155.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2015, 39, 1, 1, 1, 395.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2015, 40, 1, 1, 1, 400.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2015, 43, 1, 1, 1, 450.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2016, 3, 1, 1, 1, 150.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2016, 11, 1, 1, 1, 145.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2017, 9, 1, 1, 1, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2018, 26, 5, 5, 1, 1000.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2018, 28, 1, 1, 1, 320.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2018, 36, 3, 5, 1, 1300.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2019, 2, 4, 2, 1, 120.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2019, 7, 1, 1, 1, 125.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2020, 9, 1, 1, 1, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2020, 12, 1, 1, 1, 190.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2020, 25, 1, 1, 1, 340.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2021, 38, 1, 1, 1, 385.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2022, 39, 1, 1, 1, 395.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2023, 9, 1, 1, 1, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2024, 30, 1, 1, 1, 295.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2025, 2, 4, 2, 1, 120.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2026, 28, 1, 1, 2, 320.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2027, 7, 1, 1, 1, 125.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2028, 34, 1, 1, 1, 341.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2029, 8, 1, 1, 1, 140.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2030, 11, 1, 1, 1, 145.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2031, 11, 1, 1, 2, 290.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2032, 11, 1, 1, 2, 290.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2033, 11, 1, 1, 3, 435.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2034, 11, 1, 1, 5, 400.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2035, 11, 1, 1, 9, 500.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2036, 5, 1, 1, 3, 600.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2037, 2, 4, 2, 15, 800.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2038, 8, 1, 1, 20, 400.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2039, 7, 1, 1, 19, 500.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2040, 34, 1, 1, 30, 1000.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2041, 38, 1, 1, 20, 2000.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2043, 40, 1, 1, 15, 3000.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2044, 5, 1, 1, 3, 300.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2045, 33, 1, 1, 40, 4000.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2046, 11, 1, 1, 1, 145.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2046, 40, 1, 1, 1, 400.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2047, 37, 1, 1, 1, 360.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2047, 40, 1, 1, 1, 400.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2047, 44, 1, 1, 1, 500.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2048, 1060, 1, 1, 2, 70.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2048, 1061, 1, 1, 11, 70.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2049, 16, 1, 1, 1, 220.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2049, 1061, 1, 1, 1, 70.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2050, 37, 1, 1, 3, 360.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2050, 38, 1, 1, 2, 385.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1062, 1, 1, 1, 99.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1063, 1, 1, 2, 90.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1064, 1, 1, 1, 99.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1065, 1, 1, 1, 80.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1067, 1, 1, 6, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1068, 1, 1, 3, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1069, 1, 1, 1, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1070, 1, 1, 2, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1073, 1, 1, 1, 99.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1074, 1, 1, 1, 70.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1078, 6, 3, 2, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1079, 6, 3, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1080, 6, 3, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1081, 6, 3, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1082, 6, 3, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1083, 6, 3, 1, 39.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1084, 6, 3, 1, 39.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2051, 1085, 6, 3, 1, 39.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1062, 1, 1, 2, 99.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1063, 1, 1, 2, 90.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1064, 1, 1, 1, 99.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1065, 1, 1, 1, 80.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1067, 1, 1, 6, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1068, 1, 1, 3, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1069, 1, 1, 1, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1070, 1, 1, 3, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1073, 1, 1, 1, 99.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1074, 1, 1, 2, 70.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1078, 6, 3, 3, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1079, 6, 3, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1080, 6, 3, 2, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1081, 6, 3, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1082, 6, 3, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1083, 6, 3, 2, 39.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1084, 6, 3, 1, 39.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2052, 1085, 6, 3, 1, 39.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2053, 1075, 1, 1, 1, 330.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2053, 1076, 1, 1, 1, 300.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1086, 6, 1, 1, 50.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1087, 6, 1, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1088, 1, 1, 3, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1089, 6, 1, 3, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1090, 1, 1, 5, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1091, 1, 1, 3, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1092, 1, 1, 2, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1094, 1, 1, 4, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2054, 1095, 1, 1, 1, 50.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1086, 6, 1, 1, 50.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1087, 6, 1, 1, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1088, 1, 1, 3, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1089, 6, 1, 3, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1090, 1, 1, 5, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1091, 1, 1, 3, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1092, 1, 1, 2, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1094, 1, 1, 5, 40.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2055, 1095, 1, 1, 1, 50.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2056, 9, 1, 1, 4, 160.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2057, 3, 1, 1, 1, 150.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2057, 26, 4, 1, 5, 700.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2058, 1067, 1, 1, 1, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2058, 1069, 1, 1, 2, 20.0000)
GO
INSERT [dbo].[OrderLine] ([oId], [pId], [sizeId], [matId], [quantity], [price]) VALUES (2059, 4, 1, 1, 1, 200.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (2, N'Figure Nezuko', N'<p><span style="color:#2ecc71">Figure Nezuko dọa nạt</span></p>
', N'img-p/FigNezuko1.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (3, N'#1 Nendoroid Umaru', N'Nendoroid Umaru đăc ý', N'img-p/NendUma2.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (4, N'#1 Nendoroid Eriri', N'Nendoroid Eriri với 3 biểu cảm vô cùng dễ thương!', N'img-p/NendEriri.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (5, N'#2 Nendoroid Umaru', N'Nendoroid Umaru uống coca', N'img-p/NendUma3.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (6, N'#3 Nendoroid Umaru', N'	Nendoroid Umaru nũng nĩu', N'img-p/NendUma4.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (7, N'Figure Sagiri', N'Figure Sagiri áo phông trắng', N'img-p/FigSagiri1.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (8, N'#1 Figure Mahiru', N'Figure Shiina Mahiru áo đồng phục', N'img-p/FigMahirun2.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (9, N'#2 Figure Mahiru', N'Figure Shiina Mahiru đồ ngủ màu đen', N'img-p/FigMahirun1.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (10, N'#3 Figure Mahiru', N'Figure Shiina Mahiru áo đồng phục', N'img-p/FigMahirun3.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (11, N'Figure Iroha', N'Figure Iroha Isshiki áo đồng phục', N'img-p/FigIroha.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (12, N'Figure Yui	', N'Figure Yuigahama Yui', N'img-p/FigYuiYui.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (13, N'#1 Nendoroid Yui', N'Nendoroid Yuigahama Yui giận dỗi', N'img-p/NeYuiYui1.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (14, N'#2 Nendoroid Yui', N'Nendoroid Yuigahama Yui vui vẻ', N'img-p/NeYuiYui2.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (15, N'#3 Nendoroid Yui', N'Nendoroid Yuigahama Yui đeo bờm cún', N'img-p/NeYuiYui3.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (16, N'#4 Nendoroid Yui', N'Nendoroid Yuigahama Yui chào Yahallo', N'img-p/NeYuiYui4.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (17, N'#1 Nendoroid Bocchi', N'Nendoroid Bocchi bối rối 1', N'img-p/NeBocchi1.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (18, N'#2 Nendoroid Bocchi', N'Nendoroid Bocchi cuốn chăn quanh người', N'img-p/NeBocchi2.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (19, N'#3 Nendoroid Bocchi', N'Nendoroid Bocchi giả chết', N'img-p/NeBocchi3.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (20, N'#4 Nendoroid Bocchi', N'Nendoroid Bocchi bối rối 2', N'img-p/NeBocchi4.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (21, N'#5 Nendoroid Bocchi', N'Nendoroid Bocchi gảy ghitar', N'img-p/NeBocchi5.jpg', 2, 3)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (22, N'#1 Nendoroid Kei', N'Nendoroid Karuizawa Kei bị cupid bắn tên', N'img-p/NeKei1.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (23, N'#2 Nendoroid Kei', N'Nendoroid Karuizawa Kei lạnh lùng', N'img-p/NeKei2.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (24, N'#3 Nendoroid Kei', N'Nendoroid Karuizawa Kei vui vẻ', N'img-p/NeKei3.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (25, N'#1 Figure Erza', N'Figure Erza Scarlet chiến tướng kèm theo cờ FairyTail', N'img-p/FigErza1.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (26, N'Figure Bocchi LIMITED', N'<p><span style="color:#8e44ad">Bocchi the rock h&agrave;ng Việt Nam chất lượng cao</span></p>
', N'img-p/FigBocchi.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (28, N'Figure Elaina pajama', N'Figure Elaina phù thủy mơ màng', N'img-p/FigElaina.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (29, N'Figure Elaina LIMITED', N'Figure Elaina ngẩn ngơ thẫn thờ ', N'img-p/FigElaina2.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (30, N'Figure Emilia và child Emilia', N'Figure Emilia và bé Emilia rất đẹp trong sáng đáng yêu', N'img-p/FigEmilia.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (33, N'Figure Emlia pajama', N'Figure Emilia đồ ngủ dễ thương', N'img-p/FigEmilia2.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (34, N'Figure Emilia váy hồng', N'Figure Emilia và ', N'img-p/FigEmilia3.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (35, N'Figure Emilia váy cưới', N'Figure Emilia trong bộ váy cưới sẽ khiến bạn ngất ngây', N'img-p/FigEmilia4.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (36, N'Figure Miku bồi bàn', N'Figure Miku bồi bàn cute kèm thêm nước uống siêu mê', N'img-p/FigMiku.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (37, N'Figure Miku mùa đông ấm áp', N'Figure Miku giáng sinh đẹp vãi òn ', N'img-p/FigMiku2.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (38, N'Figure Miku Sakura version', N'Figure Miku Sakura hồng lãng mạn ấm áp lòng người', N'img-p/FigMikuSakura.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (39, N'Figure Natsu Dragneel và rồng', N'Figure Natsu Dragneel và Igneel chiến thần', N'img-p/FigNatsu.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (40, N'Figure Ram và bé Ram', N'Figure Ram và child Ram siêu cấp cute kawaii phô mai que', N'img-p/FigRam1.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (43, N'Figure Rem và bé Rem', N'Figure Rem và child Rem siêu cấp cute kawaii phô mai que', N'img-p/FigRem1.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (44, N'Figure Yui vươn vai', N'Figure Yuigahama Yui học sinh năng động tràn đầy sức sống', N'img-p/FigYui1.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1058, N'Nendoroid Hikigaya Hachiman', N'<p><span style="color:#8e44ad"><span style="font-size:16px">Hachiman si&ecirc;u cấp ngầu l&ograve;i vip pro&nbsp;</span></span></p>
', N'img-p/NendHachiman.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1059, N'Nendoroid Yukinoshita Yukino', N'<p><span style="color:#e74c3c"><span style="font-size:16px">Nendoroid Yukinoshita Yukino si&ecirc;u cấp cute ph&ocirc; mai que</span></span></p>
', N'img-p/NendYukino3.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1060, N'Standee Karuizawa Kei', N'<p><span style="color:#1abc9c"><span style="font-size:16px">Standee nhựa mica si&ecirc;u bền, Kei si&ecirc;u cute</span></span></p>
', N'img-p/StaKei1.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1061, N'Standee Sakayanagi Arisu', N'<p><span style="color:#2980b9"><span style="font-size:18px">Standee si&ecirc;u bền, Arisu bao ngầu</span></span></p>
', N'img-p/StaArisu2.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1062, N'Standee Angelica ', N'<p><span style="color:#e74c3c">Standee mica si&ecirc;u đẹp bền</span></p>
', N'img-p/StaAngel.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1063, N'Standee Noelle', N'<p><span style="color:#2ecc71">Standee mica si&ecirc;u đẹp bền</span></p>
', N'img-p/StaNoele.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1064, N'Standee Olivia', N'<p><span style="color:#2980b9"><span style="font-size:16px">Standee mica si&ecirc;u đẹp bền</span></span></p>
', N'img-p/StaLivia.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1065, N'Standee Arya ', N'<p><span style="color:#2ecc71"><span style="font-size:16px">Standee mica si&ecirc;u đẹp bền</span></span></p>
', N'img-p/StaArya.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1066, N'Standee Arya #2', N'<p><span style="color:#16a085"><span style="font-size:16px">Standee mica si&ecirc;u đẹp bền</span></span></p>
', N'img-p/StaArya2.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1067, N'Badge Arya #1', N'<p><span style="color:#e74c3c"><span style="font-size:16px">Huy hiệu Arya g&aacute;i nga tsundere si&ecirc;u cuteeee</span></span></p>
', N'img-p/BadgeArya1.jpg', 4, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1068, N'Badge Arya #2', N'<p><span style="color:#2980b9"><span style="font-size:16px">Huy hiệu g&aacute;i nga Arya tsundere si&ecirc;u cuteee&nbsp;</span></span></p>
', N'img-p/BadgeArya2.jpg', 4, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1069, N'Badge Arya #3', N'<p><span style="background-color:#e74c3c">Huy hiệu g&aacute;i nga Arya tsundere si&ecirc;u cuteee&nbsp;</span></p>
', N'img-p/BadgeArya3.jpg', 4, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1070, N'Badge Arya #4', N'<p><span style="color:#2980b9"><span style="font-size:16px">Huy hiệu g&aacute;i nga Arya tsundere si&ecirc;u cuteee&nbsp;</span></span></p>
', N'img-p/BadgeArya4.jpg', 4, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1071, N'Standee Kyaru ', N'<p><span style="color:#2c3e50"><span style="font-size:16px">Standee m&egrave;o ngoo si&ecirc;u cute kimono</span></span></p>
', N'img-p/StaKyaru.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1072, N'Standee Pecorine Kimono', N'<p><span style="color:#2980b9"><span style="font-size:16px">Standee b&eacute; Cơm mặc Kimono&nbsp;</span></span></p>
', N'img-p/StaPeco.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1073, N'Standee Kokkoro', N'<p><span style="color:#27ae60"><span style="font-size:16px">Standee Kokkoro kimono version cool ngau</span></span></p>
', N'img-p/StaKokkoro.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1074, N'Standee Kanna', N'<p><span style="color:#3498db"><span style="font-size:16px">Standee si&ecirc;u vip si&ecirc;u bền si&ecirc;u cute</span></span></p>
', N'img-p/StaKanna.jpg', 3, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1075, N'Nendoroid Kyouka', N'<p><span style="color:#8e44ad"><span style="font-size:16px">Nendoroid sieu cap cute&nbsp;</span></span></p>
', N'img-p/NeKyouka1.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1076, N'Nendoroid Kyouka #2', N'<p><span style="color:#8e44ad"><span style="font-size:16px">Nendoroid sieu cap cute&nbsp;</span></span></p>
', N'img-p/NeKyouka2.jpg', 2, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1077, N'Figure Kyaru Summer', N'<p><span style="color:#2980b9"><span style="font-size:16px">Figure m&egrave;o ngoo tắm biển cute&nbsp;</span></span></p>
', N'img-p/FigKyaru.jpg', 1, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1078, N'Tapes Arya #1', N'<p><span style="color:#2ecc71"><span style="font-size:16px">Tapes Arya b&agrave;n b&ecirc;n si&ecirc;u đẹp, chất bền</span></span></p>
', N'img-p/TapesArya.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1079, N'Tapes Arya #2', N'<p><span style="color:#e74c3c"><span style="font-size:16px">Tapes Arya b&agrave;n b&ecirc;n si&ecirc;u đẹp, chất bền</span></span></p>
', N'img-p/TapesArya2.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1080, N'Tapes Arya #3', N'<p><span style="color:#27ae60"><span style="font-size:16px">Tapes g&aacute;i nga Tsundere Arya si&ecirc;u cute&nbsp;</span></span></p>
', N'img-p/TapesArya3.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1081, N'Tapes Arya #4', N'<p><span style="color:#2980b9"><span style="font-size:16px">Tapes g&aacute;i nga Tsundere Arya si&ecirc;u cute&nbsp;</span></span></p>
', N'img-p/TapesArya4.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1082, N'Tapes Arya #5', N'<p><span style="color:#2980b9"><span style="font-size:16px">Tapes g&aacute;i nga Tsundere Arya si&ecirc;u cute&nbsp;</span></span></p>
', N'img-p/TapesArya5.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1083, N'Tapes Mahiru #1', N'<p><span style="color:#e74c3c"><span style="font-size:16px">Tapes thi&ecirc;n sứ nh&agrave; b&ecirc;n Mahiruu si&ecirc;u cute&nbsp;</span></span></p>
', N'img-p/TapesMahiru1.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1084, N'Tapes Mahiru #2', N'<p><span style="color:#e74c3c"><span style="font-size:16px">Tapes thi&ecirc;n sứ nh&agrave; b&ecirc;n Mahiruu si&ecirc;u cute&nbsp;</span></span></p>
', N'img-p/TapesMahiru2.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1085, N'Tapes Mahiru #3', N'<p><span style="color:#2ecc71"><span style="font-size:16px">Tapes thi&ecirc;n sứ nh&agrave; b&ecirc;n Mahiruu si&ecirc;u cute&nbsp;</span></span></p>
', N'img-p/TapesMahiru3.jpg', 6, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1086, N'Keypad Summer Saren #1', N'<p><span style="color:#2ecc71"><span style="font-size:16px">L&oacute;t chuột c&ocirc;ng ch&uacute;a kết nối Saren</span></span></p>
', N'img-p/KeypadSaren.jpg', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1087, N'Keypad Summer Saren #2', N'<p><span style="color:#2ecc71"><span style="font-size:16px">L&oacute;t chuột c&ocirc;ng ch&uacute;a kết nối Saren</span></span></p>
', N'img-p/KeypadSaren2.jpg', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1088, N'Keypad Bocchi #1', N'<p><span style="color:#3498db"><span style="font-size:16px">Keypad Bocchi the Rock si&ecirc;u đẹp&nbsp;</span></span></p>
', N'img-p/KeypadBocchi1.jfif', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1089, N'Keypad Bocchi #2', N'<p><span style="color:#8e44ad">Keypad Bocchi the Rock si&ecirc;u đẹp&nbsp;</span></p>
', N'img-p/KeypadBocchi2.jpg', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1090, N'Keypad Bocchi #3', N'<p><span style="font-size:16px">Keypad Bocchi the Rock si&ecirc;u đẹp&nbsp;</span></p>
', N'img-p/KeypadBocchi3.jpg', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1091, N'Keypad Bocchi #4', N'<p><span style="font-size:16px">Keypad Bocchi the Rock si&ecirc;u đẹp&nbsp;</span></p>
', N'img-p/KeypadBocchi4.jpg', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1092, N'Keypad Bocchi #5', N'<p><span style="font-size:16px">Keypad Bocchi the Rock si&ecirc;u đẹp&nbsp;</span></p>
', N'img-p/KeypadBocchi5.jpg', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1094, N'Keypad Bocchi #6', N'<p><span style="font-size:16px">Keypad Bocchi the Rock si&ecirc;u đẹp&nbsp;</span></p>
', N'img-p/KeypadBocchi6.jpg', 5, 1)
GO
INSERT [dbo].[Product] ([id], [name], [description], [image], [cid], [sid]) VALUES (1095, N'Keypad Princess Connect', N'<p><span style="font-size:16px">L&oacute;t chuột c&ocirc;ng ch&uacute;a kết nối si&ecirc;u đẹp, over hợp</span></p>
', N'img-p/KeypadPrinCon.jpg', 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (2, 4, 2, 120.0000, 4)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (3, 1, 1, 150.0000, 7)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (4, 1, 1, 200.0000, 9)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (5, 1, 1, 150.0000, 11)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (6, 1, 1, 150.0000, 13)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (7, 1, 1, 125.0000, 2)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (8, 1, 1, 140.0000, 14)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (9, 1, 1, 160.0000, 10)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (10, 1, 1, 155.0000, 18)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (11, 1, 1, 145.0000, 10)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (12, 1, 1, 190.0000, 9)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (13, 1, 1, 200.0000, 27)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (14, 1, 1, 240.0000, 26)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (15, 1, 1, 230.0000, 24)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (16, 1, 1, 220.0000, 14)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (17, 1, 1, 225.0000, 21)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (18, 1, 1, 222.0000, 23)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (19, 1, 1, 234.0000, 21)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (20, 1, 1, 299.0000, 16)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (21, 1, 1, 210.0000, 20)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (22, 1, 1, 155.0000, 14)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (23, 1, 1, 160.0000, 17)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (24, 1, 1, 300.0000, 17)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (25, 1, 1, 340.0000, 12)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 3, 1, 820.0000, 4)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 3, 2, 1000.0000, 15)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 3, 5, 1500.0000, 24)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 4, 1, 700.0000, 0)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 4, 2, 840.0000, 13)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 4, 5, 1200.0000, 18)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 5, 1, 400.0000, 26)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 5, 2, 599.0000, 13)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (26, 5, 5, 1000.0000, 24)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (28, 1, 1, 320.0000, 7)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (29, 1, 1, 329.0000, 38)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (29, 1, 2, 600.0000, 11)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (29, 1, 5, 1200.0000, 2)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (30, 1, 1, 295.0000, 20)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (33, 1, 1, 265.0000, 39)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (34, 1, 1, 341.0000, 24)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (36, 3, 5, 1300.0000, 4)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (36, 5, 1, 203.0000, 16)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (36, 5, 2, 400.0000, 16)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (36, 5, 5, 800.0000, 7)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (37, 1, 1, 360.0000, 29)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (38, 1, 1, 385.0000, 4)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (39, 1, 1, 395.0000, 15)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (40, 1, 1, 400.0000, 35)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (43, 1, 1, 450.0000, 19)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (44, 1, 1, 500.0000, 23)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1058, 1, 1, 300.0000, 20)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1059, 1, 1, 350.0000, 24)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1060, 1, 1, 70.0000, 28)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1061, 1, 1, 70.0000, 10)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1062, 1, 1, 99.0000, 20)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1063, 1, 1, 90.0000, 20)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1064, 1, 1, 99.0000, 23)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1065, 1, 1, 80.0000, 31)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1066, 1, 1, 80.0000, 25)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1067, 1, 1, 20.0000, 74)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1068, 1, 1, 20.0000, 70)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1069, 1, 1, 20.0000, 75)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1070, 1, 1, 20.0000, 216)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1071, 1, 1, 99.0000, 25)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1072, 1, 1, 99.0000, 33)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1073, 1, 1, 99.0000, 31)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1074, 1, 1, 70.0000, 29)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1075, 1, 1, 330.0000, 22)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1076, 1, 1, 300.0000, 31)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1077, 1, 1, 200.0000, 63)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1078, 6, 3, 40.0000, 226)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1079, 6, 3, 40.0000, 211)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1080, 6, 3, 40.0000, 219)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1081, 6, 3, 40.0000, 219)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1082, 6, 3, 40.0000, 209)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1083, 6, 3, 39.0000, 120)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1084, 6, 3, 39.0000, 121)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1085, 6, 3, 39.0000, 121)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1086, 6, 1, 50.0000, 53)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1087, 6, 1, 40.0000, 220)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1088, 1, 1, 40.0000, 49)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1089, 6, 1, 40.0000, 216)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1090, 1, 1, 40.0000, 201)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1091, 1, 1, 40.0000, 105)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1092, 1, 1, 40.0000, 84)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1094, 1, 1, 40.0000, 90)
GO
INSERT [dbo].[ProductDetail] ([pId], [sId], [mId], [price], [quantity]) VALUES (1095, 1, 1, 50.0000, 121)
GO
SET IDENTITY_INSERT [dbo].[Size] ON 
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (1, N'FreeSize')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (2, N'1:1')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (3, N'1:2')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (4, N'1:4')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (5, N'1:8')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (6, N'40x60')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (7, N'40x80')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (8, N'50x80')
GO
INSERT [dbo].[Size] ([id], [name]) VALUES (9, N'60x90')
GO
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[AccountDetail]  WITH CHECK ADD  CONSTRAINT [FK_AccountDetail] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[AccountDetail] CHECK CONSTRAINT [FK_AccountDetail]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_ComProduct] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_ComProduct]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_ComUser] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_ComUser]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrderCustomer] FOREIGN KEY([cid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrderCustomer]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderId] FOREIGN KEY([oId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderPID] FOREIGN KEY([pId], [sizeId], [matId])
REFERENCES [dbo].[ProductDetail] ([pId], [sId], [mId])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderPID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProAcc] FOREIGN KEY([sid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProAcc]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProCategory] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProCategory]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_MPdetail] FOREIGN KEY([mId])
REFERENCES [dbo].[Material] ([id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_MPdetail]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_PPdetail] FOREIGN KEY([pId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_PPdetail]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_SPdetail] FOREIGN KEY([sId])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_SPdetail]
GO
USE [master]
GO
ALTER DATABASE [PROJECT] SET  READ_WRITE 
GO
