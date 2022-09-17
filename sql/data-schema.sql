USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 9/17/2022 6:39:05 PM ******/
CREATE DATABASE [SWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIEUSHIN\MSSQL\DATA\SWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIEUSHIN\MSSQL\DATA\SWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP391] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391', N'ON'
GO
ALTER DATABASE [SWP391] SET QUERY_STORE = OFF
GO
USE [SWP391]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[AnswerContent] [nvarchar](max) NULL,
	[QuestionID] [int] NOT NULL,
	[isCorrect] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogDate] [datetime] NULL,
	[BlogContent] [nvarchar](max) NULL,
	[BlogTilte] [nvarchar](256) NOT NULL,
	[BlogImage] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentBlog]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentBlog](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentContent] [nvarchar](max) NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[Likes] [int] NOT NULL,
	[BlogID] [int] NOT NULL,
	[isReported] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentVideo]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentVideo](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentContent] [nvarchar](max) NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[Likes] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[VideoID] [int] NOT NULL,
	[isReported] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](200) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[Category] [nvarchar](200) NOT NULL,
	[NumberEnrolled] [int] NOT NULL,
	[CoursePrice] [real] NULL,
	[CourseImage] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[from] [int] NOT NULL,
	[to] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[content] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NoticeID] [int] IDENTITY(1,1) NOT NULL,
	[NoticeContent] [nvarchar](max) NULL,
	[NoticeDate] [datetime] NULL,
	[isSeen] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionContent] [nvarchar](max) NOT NULL,
	[QuizID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Mark] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recharge]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recharge](
	[RechargeID] [int] IDENTITY(1,1) NOT NULL,
	[RechargeDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [real] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RechargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[Country] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[DoB] [date] NOT NULL,
	[PostCode] [varchar](10) NULL,
	[Balance] [real] NULL,
	[Avatar] [varbinary](max) NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[BankNumber] [varchar](20) NULL,
	[BankName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Course]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Course](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[isStudied] [bit] NOT NULL,
	[CourseRating] [real] NULL,
	[CourseFeedback] [nvarchar](max) NULL,
	[Process] [real] NULL,
	[PayDate] [datetime] NULL,
	[isFavourite] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Notification]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Notification](
	[UserID] [int] NOT NULL,
	[NoticeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Video]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Video](
	[UserID] [int] NOT NULL,
	[VideoID] [int] NOT NULL,
	[isWatched] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 9/17/2022 6:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[VideoName] [nvarchar](256) NOT NULL,
	[VideoLink] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (1, N'Kiến Thức Nhập Môn IT', CAST(N'2022-09-17T00:00:00.000' AS DateTime), 4, N'Frontend', 6234, NULL, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (2, N'HTML CSS từ Zero đến Hero', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 11, N'Frontend', 2135, NULL, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (3, N'Responsive Với Grid System', CAST(N'2022-06-18T00:00:00.000' AS DateTime), 12, N'Frontend', 663, NULL, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (4, N'Kiến Thức Nhập Môn IT', CAST(N'2021-07-23T00:00:00.000' AS DateTime), 13, N'Backend', 15234, NULL, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (5, N'Làm việc với Terminal & Ubuntu', CAST(N'2021-06-09T00:00:00.000' AS DateTime), 11, N'Backend', 9846, NULL, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (6, N'Node & ExpressJS', CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, N'Backend', 7896, NULL, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (7, N'HTML CSS Pro', CAST(N'2022-07-20T00:00:00.000' AS DateTime), 4, N'Pro', 17628, 109000, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (8, N'JavaScript Pro', CAST(N'2022-06-17T00:00:00.000' AS DateTime), 12, N'Pro', 13768, 99000, NULL)
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage]) VALUES (9, N'ReactJS Pro', CAST(N'2022-02-23T00:00:00.000' AS DateTime), 13, N'Pro', 9847, 99000, NULL)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (1, N'Nam', N'Ngô Hải', N'huongprowar@gmail.com', N'0364104616', N'Vietnam', N'Hanoi', N'Thach that, hoa lac', CAST(N'2002-12-25' AS Date), N'99999', 1.025E+07, NULL, N'huongprowar', N'2ce80d75a95e048573ee28d31681de0ec9c1eb205f0cc70e5b1d8353cc4ea8eb', N'Admin')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (2, N'Hùng', N'Vũ Mạnh', N'hungvmhe163268@fpt.edu.vn', N'0357079822', N'Vietnam', N'Halong', N'BaiChay', CAST(N'2002-06-16' AS Date), N'9999', 1000000, NULL, N'hungvmhe163268', N'93b6604a21552aeafebbc337ceb147cfd463ddeb62bd2dc6e151896360439f90', N'Admin')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (3, N'Hiếu', N'Nguyễn Văn', N'hieunvhe163104@fpt.edu.vn', N'0123456789', N'Vietnam', N'Bắc Giang', N'Bắc Giang', CAST(N'2002-07-28' AS Date), N'9999', 1000000, NULL, N'hieunvhe163104', N'b2cd77431c284d04160f1c92a615cd8c1177405fe9c94b86c0dfcb1d0b097979', N'Admin')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (4, N'Quang', N'Triệu Đình', N'quangtdhe163060@fpt.edu.vn', N'0123456789', N'Vietnam', N'Hạ Long', N'Hạ Long', CAST(N'2002-09-15' AS Date), N'9999', 500000, NULL, N'quangtdhe163060', N'165e30c5c0912b1e20c6934eb93d118dbd098dcab332dc02d7c7d01a7bea5af6', N'Mentor')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (5, N'Cường', N'Vàng Việt', N'cuongvvhe130951@fpt.edu.vn', N'0123456789', N'Việt Nam', N'Bắc Ninh', N'Bắc Ninh', CAST(N'2002-04-24' AS Date), N'9999', 100000, NULL, N'cuongvvhe130951', N'efe00d5ae94484ea71b939eb0c73f636ccf0a62afa4a4a07bf63bc900cdc0b6b', N'User')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (6, N'Hùng', N'Trần Mạnh', N'hungtmhe163407@fpt.edu.vn', N'0123456789', N'Việt Nam', N'Hạ Long', N'Hạ Long', CAST(N'2002-05-25' AS Date), N'9999', 123456, NULL, N'hungtmhe163407', N'9566f599cc9b7e2e67bb6fa7deeba93b46c0624cce916e96377682d9633de8ab', N'Admin')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (7, N'Dũng', N'Lê Đào Quang', N'dungldqhe161262@fpt.edu.vn', N'012345678', N'Việt Nam', N'Hà Nam', N'Hà Nam', CAST(N'2002-06-19' AS Date), N'1000', 733257, NULL, N'dungldqhe161262', N'5d54e7eae06a7686e1c1190bd021b3a3b22c9512834e598e0d68b9a5d5ca2763', N'Admin')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (8, N'Dương', N'Phạm Chu', N'duongpche163153@fpt.edu.vn', N'012345678', N'Việt Nam', N'Hà Tây', N'Hà Tây ', CAST(N'2002-07-18' AS Date), N'2222', 18492, NULL, N'duongpche163153', N'f5082b27da49a7d97b2dc1ea447a8aa88ce0ca37ca293022e4a65e3390b22d76', N'User')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (9, N'Quân', N'Lê Minh', N'quanlmhe163084@fpt.edu.vn', N'0123456789', N'Việt Nam', N'Quảng Bình', N'Quảng Bình', CAST(N'2002-03-24' AS Date), N'7673', 63728, NULL, N'quanlmhe163084', N'92a0ae5b8ea9f45a75c6496cc9e14d8ae1aed321942efa3f8fa5f82e6c6827b0', N'User')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (10, N'Quân', N'Nguyễn Bá', N'quannbhe163333@fpt.edu.vn', N'0123138575', N'Việt Nam', N'Hà Giang', N'Hà Giang', CAST(N'2002-02-07' AS Date), N'3333', 673852, NULL, N'quannbhe163333', N'3d566f94e17eaf0997ec38629187f5515512972c6679f97c2228d71b3b607f3a', N'User')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (11, N'Ánh', N'Khuất Thị Minh', N'anhktmhe163997@fpt.edu.vn', N'0123434657', N'Việt Nam', N'Bắc Ninh', N'Bắc Ninh', CAST(N'2002-04-27' AS Date), N'7736', 983495, NULL, N'anhktmhe163997', N'2278f720b17f0e6640bef93fc1b0ff2f9fa5f65b918c473f770ca330a3ab5d55', N'Mentor')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (12, N'Khải', N'Nguyễn Quang', N'khainqhe161218@fpt.edu.vn', N'0734824659', N'Việt Nam', N'Hà Tây', N'Hà Tây', CAST(N'2002-02-23' AS Date), N'1233', 312331, NULL, N'khainqhe161218', N'a526a4625b557acf9f4d3332c4e7ab1dfdba5fd20269847dc399be80eefdc5ad', N'Mentor')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (13, N'Hữu', N'Phạm Bằng', N'huupbhe160316@fpt.edu.vn', N'0539815724', N'Việt Nam', N'Hà Nội', N'Hà Nội', CAST(N'2002-11-23' AS Date), N'31223', 81233, NULL, N'huupbhe160316', N'e6810d714eabd3ee82f64b92dffd7da402cdef9f0123cbcba172c5f8d3047628', N'Mentor')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role]) VALUES (14, N'Hiếu', N'Nguyễn', N'hieunvhe163104@fpt.edu.vn', N'0988561896', N'Việt Nam', N'Bắc Giang', N'Mỹ Thái, Lạng Giang, Bắc Giang', CAST(N'2002-11-07' AS Date), N'10001', 1000000, NULL, N'hieunv', N'Hieunguyen02@', N'User')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (7, 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (7, 2, 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (7, 3, 1, 5, N'Là một khóa học rất bổ ích', 100, NULL, 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (7, 7, 1, 5, N'Đáng đồng tiền bát gạo', 100, CAST(N'2022-09-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (10, 3, 1, 4, N'Hơi khó để học', 97.5, NULL, 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (10, 8, 1, 4.3, N'Đáng học', 67.9, CAST(N'2022-07-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (10, 9, 1, 3.7, N'Khó', 69.96, CAST(N'2022-06-27T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (11, 2, 1, 4.7, N'Game là dễ ', 100, NULL, 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (11, 3, 1, 4.8, N'Quá dễ hiểu', 100, NULL, 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Process], [PayDate], [isFavourite]) VALUES (13, 7, 1, 3.9, N'Đắt quá', 79.6, CAST(N'2022-08-28T00:00:00.000' AS DateTime), 0)
GO
/****** Object:  Index [Answer_AnswerID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Answer_AnswerID] ON [dbo].[Answer]
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Blog_BlogID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Blog_BlogID] ON [dbo].[Blog]
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CommentVideo_CommentID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [CommentVideo_CommentID] ON [dbo].[CommentVideo]
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Course_CourseID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Course_CourseID] ON [dbo].[Course]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Notification_NoticeID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Notification_NoticeID] ON [dbo].[Notification]
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Question_QuestionID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Question_QuestionID] ON [dbo].[Question]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Quiz_QuizID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Quiz_QuizID] ON [dbo].[Quiz]
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Recharge_RechargeID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Recharge_RechargeID] ON [dbo].[Recharge]
(
	[RechargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [User_UserID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [User_UserID] ON [dbo].[User]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Video_VideoID]    Script Date: 9/17/2022 6:39:06 PM ******/
CREATE NONCLUSTERED INDEX [Video_VideoID] ON [dbo].[Video]
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FKAnswer353317] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FKAnswer353317]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FKBlog360084] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FKBlog360084]
GO
ALTER TABLE [dbo].[CommentBlog]  WITH CHECK ADD  CONSTRAINT [FKCommentBlo644738] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogID])
GO
ALTER TABLE [dbo].[CommentBlog] CHECK CONSTRAINT [FKCommentBlo644738]
GO
ALTER TABLE [dbo].[CommentVideo]  WITH CHECK ADD  CONSTRAINT [FKCommentVid42371] FOREIGN KEY([UserID], [VideoID])
REFERENCES [dbo].[User_Video] ([UserID], [VideoID])
GO
ALTER TABLE [dbo].[CommentVideo] CHECK CONSTRAINT [FKCommentVid42371]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FKMessage213227] FOREIGN KEY([from])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FKMessage213227]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FKMessage65145] FOREIGN KEY([to])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FKMessage65145]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FKQuestion143290] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FKQuestion143290]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FKQuiz365735] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FKQuiz365735]
GO
ALTER TABLE [dbo].[Recharge]  WITH CHECK ADD  CONSTRAINT [FKRecharge738481] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Recharge] CHECK CONSTRAINT [FKRecharge738481]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FKUser_Cours401962] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FKUser_Cours401962]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FKUser_Cours952265] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FKUser_Cours952265]
GO
ALTER TABLE [dbo].[User_Notification]  WITH CHECK ADD  CONSTRAINT [FKUser_Notif428842] FOREIGN KEY([NoticeID])
REFERENCES [dbo].[Notification] ([NoticeID])
GO
ALTER TABLE [dbo].[User_Notification] CHECK CONSTRAINT [FKUser_Notif428842]
GO
ALTER TABLE [dbo].[User_Notification]  WITH CHECK ADD  CONSTRAINT [FKUser_Notif445216] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Notification] CHECK CONSTRAINT [FKUser_Notif445216]
GO
ALTER TABLE [dbo].[User_Video]  WITH CHECK ADD  CONSTRAINT [FKUser_Video248293] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Video] ([VideoID])
GO
ALTER TABLE [dbo].[User_Video] CHECK CONSTRAINT [FKUser_Video248293]
GO
ALTER TABLE [dbo].[User_Video]  WITH CHECK ADD  CONSTRAINT [FKUser_Video483149] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Video] CHECK CONSTRAINT [FKUser_Video483149]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FKVideo487133] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FKVideo487133]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [from_to] CHECK  (([from]<>[to]))
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FKCourse] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [from_to]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_account]    Script Date: 9/17/2022 6:39:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_create_account]
	@UserName	varchar(50),
	@Password	varchar(32),
	@FirstName	Nvarchar(30),
	@LastName	Nvarchar(30),
	@DoB		date,
	@Role	varchar(50)
AS 
BEGIN
	INSERT INTO [User](UserName, Password, FirstName, LastName, DoB, Role) 
	VALUES (@UserName, @Password,@FirstName, @LastName, @DoB, @Role);
END;

GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
