USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 9/30/2022 11:41:02 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[AnswerContent] [ntext] NULL,
	[QuestionID] [int] NOT NULL,
	[isCorrect] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogDate] [datetime] NULL,
	[BlogContent] [ntext] NULL,
	[BlogTilte] [nvarchar](200) NULL,
	[BlogImage] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[VideoID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CommentContent] [ntext] NULL,
	[CommentDate] [datetime] NULL,
	[Likes] [int] NULL,
	[isReported] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentBlog]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentBlog](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentContent] [ntext] NULL,
	[CommentDate] [datetime] NULL,
	[Likes] [int] NULL,
	[BlogID] [int] NOT NULL,
	[isReported] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](200) NOT NULL,
	[DateCreate] [datetime] NULL,
	[AuthorID] [int] NOT NULL,
	[Category] [nvarchar](200) NULL,
	[NumberEnrolled] [int] NOT NULL,
	[CoursePrice] [real] NULL,
	[CourseImage] [text] NULL,
	[isDisable] [bit] NOT NULL,
	[Description] [ntext] NULL,
	[Objectives] [ntext] NULL,
 CONSTRAINT [PK__Course__C92D71873B17025C] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docs]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docs](
	[DocsID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[Content] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[DocsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NOT NULL,
	[LessonName] [nvarchar](200) NULL,
	[isDisable] [bit] NOT NULL,
	[types] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[from] [int] NOT NULL,
	[to] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[content] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NoticeID] [int] IDENTITY(1,1) NOT NULL,
	[NoticeContent] [ntext] NULL,
	[NoticeDate] [datetime] NULL,
	[isSeen] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionContent] [ntext] NOT NULL,
	[QuizID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[Mark] [real] NULL,
	[LessonID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recharge]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recharge](
	[RechargeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RechargeDate] [datetime] NULL,
	[Amount] [real] NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RechargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[SectionName] [nvarchar](200) NULL,
	[isDisable] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](12) NULL,
	[Country] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[DoB] [date] NULL,
	[PostCode] [varchar](10) NULL,
	[Balance] [real] NULL,
	[Avatar] [text] NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[BankNumber] [varchar](20) NULL,
	[BankName] [nvarchar](50) NULL,
	[isDisable] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Course]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Course](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[isStudied] [bit] NOT NULL,
	[CourseRating] [real] NULL,
	[CourseFeedback] [ntext] NULL,
	[Progress] [real] NULL,
	[Paydate] [datetime] NULL,
	[isFavourite] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Lesson]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Lesson](
	[UserID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[Checked] [bit] NOT NULL,
 CONSTRAINT [PK_User_Lesson] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Notification]    Script Date: 9/30/2022 11:41:02 PM ******/
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
/****** Object:  Table [dbo].[Video]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[VideoName] [nvarchar](200) NULL,
	[VideoLink] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (1, N'Kiến Thức Nhập Môn IT', CAST(N'2022-09-17T00:00:00.000' AS DateTime), 4, N'Frontend', 6234, 0, N'https://files.fullstack.edu.vn/f8-prod/courses/7.png', 0, N'Giúp các có cái nhìn t?ng quan v? ngành IT - L?p trình web các b?n nên xem các videos t?i khóa này tru?c nhé.', N'Các kiến thức cơ bản, nền móng của ngành IT/Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng/Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng/Hiểu hơn về cách internet và máy vi tính hoạt động')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (2, N'HTML CSS từ Zero đến Hero', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 11, N'Frontend', 2135, 0, N'https://files.fullstack.edu.vn/f8-prod/courses/2.png', 0, N'Trong khóa này chúng ta s? cùng nhau xây d?ng giao di?n 2 trang web là The Band & Shopee.', N'Biết cách xây dựng giao diện web với HTML, CSS/Biết cách phân tích giao diện website/Biết cách đặt tên class CSS theo chuẩn BEM/Biết cách làm giao diện web responsive/Làm chủ Flexbox khi dựng bố cục website/Sở hữu 2 giao diện web khi học xong khóa học/Biết cách tự tạo động lực cho bản thân/Biết cách tự học những kiến thức mới/Học được cách làm UI chỉn chu, kỹ tính/Nhận chứng chỉ khóa học do F8 cấp')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (3, N'Responsive Với Grid System', CAST(N'2022-06-18T00:00:00.000' AS DateTime), 12, N'Frontend', 663, 0, N'https://files.fullstack.edu.vn/f8-prod/courses/3.png', 0, N'Trong khóa này chúng ta sẽ học về cách xây dựng giao diện web responsive với Grid System, tương tự Bootstrap 4.', N'Biết cách xây dựng website Responsive/Hiểu được tư tưởng thiết kế với Grid system/Tự tay xây dựng được thư viện CSS Grid/Tự hiểu được Grid layout trong bootstrap')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (4, N'Kiến Thức Nhập Môn IT', CAST(N'2021-07-23T00:00:00.000' AS DateTime), 13, N'Backend', 15234, 0, N'https://files.fullstack.edu.vn/f8-prod/courses/7.png', 0, N'Giúp các có cái nhìn t?ng quan v? ngành IT - L?p trình web các b?n nên xem các videos t?i khóa này tru?c nhé.', N'Các kiến thức cơ bản, nền móng của ngành IT/Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng/Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng/Hiểu hơn về cách internet và máy vi tính hoạt động')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (5, N'Làm việc với Terminal & Ubuntu', CAST(N'2021-06-09T00:00:00.000' AS DateTime), 11, N'Backend', 9846, 0, N'https://files.fullstack.edu.vn/f8-prod/courses/14/624faac11d109.png', 0, N'Sở hữu một Terminal hiện đại, mạnh mẽ trong tùy biến và học cách làm việc với Ubuntu là một bước quan trọng trên con đường trở thành một Web Developer.', N'Biết cách cài đặt và tùy biến Windows Terminal/Biết sử dụng Windows Subsystem for Linux/Thành thạo sử dụng các lệnh Linux/Ubuntu/Biết cài đặt Node và tạo dự án ReactJS/ExpressJS/Biết cài đặt PHP 7.4 và MariaDB trên Ubuntu 20.04/Hiểu về Ubuntu và biết tự cài đặt các phần mềm khác')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (6, N'Node & ExpressJS', CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, N'Backend', 7896, 0, N'https://files.fullstack.edu.vn/f8-prod/courses/6.png', 0, N'Học Back-end với Node & ExpressJS framework, hiểu các khái niệm khi làm Back-end và xây dựng RESTful API cho trang web.', N'Nắm chắc lý thuyết chung trong việc xây dựng web/Biết cách làm việc với Mongoose, MongoDB trong NodeJS/Xây dựng web với Express bằng kiến thức thực tế/Biết cách xây dựng API theo chuẩn RESTful API/Nắm chắc lý thuyết về API và RESTful API/Được chia sẻ lại kinh nghiệm làm việc thực tế/Nắm chắc khái niệm về giao thức HTTP/Hiểu rõ tư tưởng và cách hoạt động của mô hình MVC/Học được cách tổ chức code trong thực tế/Biết cách deploy (triển khai) website lên internet')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (7, N'HTML CSS Pro', CAST(N'2022-07-20T00:00:00.000' AS DateTime), 4, N'Pro', 17628, 109000, N'https://files.fullstack.edu.vn/f8-prod/courses/2.png', 0, N'Trong khóa này chúng ta s? cùng nhau xây d?ng giao di?n 2 trang web là The Band & Shopee.', N'Biết cách xây dựng giao diện web với HTML, CSS/Biết cách phân tích giao diện website/Biết cách đặt tên class CSS theo chuẩn BEM/Biết cách làm giao diện web responsive/Làm chủ Flexbox khi dựng bố cục website/Sở hữu 2 giao diện web khi học xong khóa học/Biết cách tự tạo động lực cho bản thân/Biết cách tự học những kiến thức mới/Học được cách làm UI chỉn chu, kỹ tính/Nhận chứng chỉ khóa học do F8 cấp')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (8, N'JavaScript Pro', CAST(N'2022-06-17T00:00:00.000' AS DateTime), 12, N'Pro', 13768, 99000, N'https://files.fullstack.edu.vn/f8-prod/courses/1.png', 0, N'Học Javascript cơ bản phù hợp cho người chưa từng học lập trình. Với hơn 100 bài học và có bài tập thực hành sau mỗi bài học.', N'Hiểu chi tiết về các khái niệm cơ bản trong JS/Xây dựng được website đầu tiên kết hợp với JS/Tự tin khi phỏng vấn với kiến thức vững chắc/Có nền tảng để học các thư viện và framework JS/Nắm chắc các tính năng trong phiên bản ES6/Thành thạo DOM APIs để tương tác với trang web/Ghi nhớ các khái niệm nhờ bài tập trắc nghiệm/Nâng cao tư duy với các bài kiểm tra với testcases/Các bài thực hành như Tabs, Music Player/Nhận chứng chỉ khóa học do F8 cấp')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DateCreate], [AuthorID], [Category], [NumberEnrolled], [CoursePrice], [CourseImage], [isDisable], [Description], [Objectives]) VALUES (9, N'ReactJS Pro', CAST(N'2022-02-23T00:00:00.000' AS DateTime), 13, N'Pro', 9847, 99000, N'https://files.fullstack.edu.vn/f8-prod/courses/13/13.png', 0, N'Khóa học ReactJS từ cơ bản tới nâng cao, kết quả của khóa học này là bạn có thể làm hầu hết các dự án thường gặp với ReactJS. Cuối khóa học này bạn sẽ sở hữu một dự án giống Tiktok.com, bạn có thể tự tin đi xin việc khi nắm chắc các kiến thức được chia sẻ trong khóa học này.', N'Hiểu về khái niệm SPA/MPA/Hiểu về khái niệm hooks/Hiểu cách ReactJS hoạt động/Hiểu về function/class component/Biết cách tối ưu hiệu năng ứng dụng/Thành thạo làm việc với RESTful API/Hiểu rõ ràng Redux workflow/Thành thạo sử dụng Redux vào dự án/Biết sử dụng redux-thunk middleware/Xây dựng sản phẩm thực tế (clone Tiktok)/Triển khai dự án React ra Internet/Đủ hành trang tự tin apply đi xin việc/Biết cách Deploy lên Github,Gitlab page/Nhận chứng chỉ khóa học do F8 cấp')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Docs] ON 

INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (1, 8, N'NHỮNG TỐ CHẤT CẦN CÓ ĐỂ HỌC TỐT NGÀNH CÔNG NGHỆ THÔNG TIN
Sau khi tốt nghiệp THPT, để xác định bản thân có phù hợp với ngành Công nghệ thông tin hay không? Học ngành Công nghệ thông tin yêu cầu những kỹ năng gì? Để học ngành này cần những tố chất nào? là cơ sở để những bạn thí sinh yêu thích công nghệ, cụ thể là ngành công nghệ thông tin có cái nhìn đúng ngành nghề và gặt hái thành công trong lĩnh vực này.

học tốt ngành công nghệ thông tin
Kỹ sư ngành công nghệ thông tin
Những tố chất cần có để học tốt ngành công nghệ thông tin
Niềm đam mê công nghệ
Đây là một trong những tố chất quan trọng nhất để giúp bạn bước vào thế giới công nghệ. Với niềm yêu thích sẵn có, bạn sẽ có động lực để vượt qua áp lực căng thẳng và tính cạnh tranh gay gắt của công việc. Bạn sẽ không cảm thấy chán nản khi phải ngồi hàng giờ bên máy vi tính để viết một phần mềm, và càng không ngại ngần khi đầu tư hàng tháng trời để hoàn thành công trình nghiên cứu công nghệ.

Thông minh và có óc sáng tạo
Nếu bạn là người thông minh và có óc sáng tạo, bạn sẽ dễ dàng thành công hơn trong lĩnh vực Công nghệ thông tin. Với trí tuệ của mình, bạn có thể phân tích vấn đề sáng sủa và gãy gọn, tối ưu hóa một giải thuật, hay tìm ra giải pháp hữu hiệu để giảm chi phí và độ phức tạp, góp phần nâng cao hiệu quả của công việc.

Sự chính xác trong công việc
Tính chính xác là yêu cầu bắt buộc của mọi khoa học, cả khoa học về công nghệ máy tính. Trong quá trình xây dựng một ứng dụng, một phần mềm, nếu xảy ra một sai sót nhỏ, toàn bộ chương trình sẽ không thể vận hành như mong muốn.

Ham học hỏi, luôn cập nhật những kiến thức mới nhất
Thế giới công nghệ luôn không ngừng phát triển, những kiến thức bạn học được hôm nay có thể trở nên lỗi thời vào ngày mai. Do vậy, bạn phải liên tục tìm hiểu thông tin, cập nhật kiến thức để bắt kịp tốc độ phát triển tiến bộ khoa học công nghệ và đạt được thành công trong ngành Công nghệ thông tin

Thành thạo ngoại ngữ
Đây là ngành nghề mang tính toàn cầu do các sản phẩm công nghệ và internet có mặt trên khắp thế giới. Để trở thành một kỹ sư IT hàng đầu, thì bạn phải có kỹ năng đọc hiểu các vấn đề, thông số chuyên môn để tiếp cận, cập nhật thông tin công nghệ mới nhất.

Có khả năng làm việc theo nhóm (team-work)
Ngành Công nghệ thông tin là một ngành đặc biệt đề cao khả năng làm việc theo nhóm (team-work). Làm việc theo nhóm không những giúp bạn giảm bớt gánh nặng và độ phức tạp của công việc mà hơn thế, còn giúp bạn hoàn thành công việc nhanh hơn, hiệu quả hơn.

Khi đó các thành viên trong nhóm có thể bổ khuyết được cho nhau, mỗi cá nhân hạn chế được những nhược điểm của bản thân và phát huy tối đa năng lực sáng tạo của mình.

Trên đây chỉ là một số các tố chất cần thiết cho những bạn có ước mơ theo đuổi ngành Công nghệ thông tin. Để trở thành một kỹ sư IT hàng đầu, thì các bạn còn phải là người có kỹ năng làm việc theo nhóm; kỹ năng thuyết trình, tính kiên trì và nhẫn nại , có khả năng làm việc dưới áp lực cao …Khi theo học ngành Công nghệ thông tin tại trường Cao đẳng Công nghệ và Thương mại Hà Nội. Sinh viên sẽ được trang bị đầy đủ kiến thức, kỹ năng cần thiết để có thể trở thành kỹ sư hàng đầu trong lĩnh vực nghề nghiệp không ngừng phát triển này.')
INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (2, 12, N'NHỮNG TỐ CHẤT CẦN CÓ ĐỂ HỌC TỐT NGÀNH CÔNG NGHỆ THÔNG TIN
Sau khi tốt nghiệp THPT, để xác định bản thân có phù hợp với ngành Công nghệ thông tin hay không? Học ngành Công nghệ thông tin yêu cầu những kỹ năng gì? Để học ngành này cần những tố chất nào? là cơ sở để những bạn thí sinh yêu thích công nghệ, cụ thể là ngành công nghệ thông tin có cái nhìn đúng ngành nghề và gặt hái thành công trong lĩnh vực này.

học tốt ngành công nghệ thông tin
Kỹ sư ngành công nghệ thông tin
Những tố chất cần có để học tốt ngành công nghệ thông tin
Niềm đam mê công nghệ
Đây là một trong những tố chất quan trọng nhất để giúp bạn bước vào thế giới công nghệ. Với niềm yêu thích sẵn có, bạn sẽ có động lực để vượt qua áp lực căng thẳng và tính cạnh tranh gay gắt của công việc. Bạn sẽ không cảm thấy chán nản khi phải ngồi hàng giờ bên máy vi tính để viết một phần mềm, và càng không ngại ngần khi đầu tư hàng tháng trời để hoàn thành công trình nghiên cứu công nghệ.

Thông minh và có óc sáng tạo
Nếu bạn là người thông minh và có óc sáng tạo, bạn sẽ dễ dàng thành công hơn trong lĩnh vực Công nghệ thông tin. Với trí tuệ của mình, bạn có thể phân tích vấn đề sáng sủa và gãy gọn, tối ưu hóa một giải thuật, hay tìm ra giải pháp hữu hiệu để giảm chi phí và độ phức tạp, góp phần nâng cao hiệu quả của công việc.

Sự chính xác trong công việc
Tính chính xác là yêu cầu bắt buộc của mọi khoa học, cả khoa học về công nghệ máy tính. Trong quá trình xây dựng một ứng dụng, một phần mềm, nếu xảy ra một sai sót nhỏ, toàn bộ chương trình sẽ không thể vận hành như mong muốn.

Ham học hỏi, luôn cập nhật những kiến thức mới nhất
Thế giới công nghệ luôn không ngừng phát triển, những kiến thức bạn học được hôm nay có thể trở nên lỗi thời vào ngày mai. Do vậy, bạn phải liên tục tìm hiểu thông tin, cập nhật kiến thức để bắt kịp tốc độ phát triển tiến bộ khoa học công nghệ và đạt được thành công trong ngành Công nghệ thông tin

Thành thạo ngoại ngữ
Đây là ngành nghề mang tính toàn cầu do các sản phẩm công nghệ và internet có mặt trên khắp thế giới. Để trở thành một kỹ sư IT hàng đầu, thì bạn phải có kỹ năng đọc hiểu các vấn đề, thông số chuyên môn để tiếp cận, cập nhật thông tin công nghệ mới nhất.

Có khả năng làm việc theo nhóm (team-work)
Ngành Công nghệ thông tin là một ngành đặc biệt đề cao khả năng làm việc theo nhóm (team-work). Làm việc theo nhóm không những giúp bạn giảm bớt gánh nặng và độ phức tạp của công việc mà hơn thế, còn giúp bạn hoàn thành công việc nhanh hơn, hiệu quả hơn.

Khi đó các thành viên trong nhóm có thể bổ khuyết được cho nhau, mỗi cá nhân hạn chế được những nhược điểm của bản thân và phát huy tối đa năng lực sáng tạo của mình.

Trên đây chỉ là một số các tố chất cần thiết cho những bạn có ước mơ theo đuổi ngành Công nghệ thông tin. Để trở thành một kỹ sư IT hàng đầu, thì các bạn còn phải là người có kỹ năng làm việc theo nhóm; kỹ năng thuyết trình, tính kiên trì và nhẫn nại , có khả năng làm việc dưới áp lực cao …Khi theo học ngành Công nghệ thông tin tại trường Cao đẳng Công nghệ và Thương mại Hà Nội. Sinh viên sẽ được trang bị đầy đủ kiến thức, kỹ năng cần thiết để có thể trở thành kỹ sư hàng đầu trong lĩnh vực nghề nghiệp không ngừng phát triển này.')
INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (3, 14, N'Ubuntu là gì? 
Khái niệm Ubuntu
Ubuntu là một hệ điều hành mã nguồn mở, được phát triển bởi cộng đồng chung trên nền tảng Debian GNU/Linux. 

Được tài trợ bởi Canonical Ltd (chủ sở hữu là một người Nam Phi Mark Shuttleworth), Ubuntu cực kỳ lý tưởng cho máy tính để bàn, máy xách tay và máy chủ.  

Tại sao hệ điều hành này được đặt tên là Ubuntu?
Ubuntu la tên của bản phân phối – khởi nguồn từ quan điểm “Ubuntu” mang tính cộng đồng của người Nam Phi: “Con người hướng đến con người”. Ubuntu đã mang tinh thần của quan điểm đó vào thế giới công nghệ. 

ubuntu-la-gi
Ubuntu qua từng bước phát triển
Tháng 10 năm 2004, phiên bản chính thức đầu tiên của Ubuntu được ra mắt – phiên bản 4.1.0 – mang mã là “Warty Warthog” đã thu hút được sự quan tâm trên toàn cầu của hàng ngàn người yêu thích phần mềm miễn phí cùng với các chuyên gia, cùng tham gia cộng đồng Ubuntu.

Phiên bản thông thường
Các phiên bản Ubuntu được đặt tên theo dạng YY.MM (tên), trong đó Y tương ứng với năm phát hành, và MM tương ứng với tháng phát hành. Tên trong ngoặc là tên hiệu được đặt cho phiên bản trước khi phát hành chính thức.

Phiên bản Ubuntu chính thức mới nhất hiện tại là Ubuntu 18.10 (Cosmic Cuttlefish), phát hành tháng 10 năm 2018. Phiên bản Ubuntu 19.04 (Disco Dingo) dự kiến phát hành vào tháng 4 năm 2019

Phiên bản hỗ trợ lâu dài
Ubuntu cũng có những phiên bản hỗ trợ dài hạn “Long Term Support”, hỗ trợ trong vòng 3 năm đối với máy tính để bàn và 5 năm đối với máy chủ. Các phiên bản Long Term Support sẽ được ra mắt mỗi 2 năm một lần.

ubuntu-la-gi
Cài đặt Ubuntu có khó không?
Mỗi phiên bản phát hành có một đĩa chạy trực tiếp, cho phép người dùng xem xét phần cứng của họ có tương thích với hệ điều hành hay không trước khi cài đặt lên đĩa cứng bằng phần mềm Ubiquity. Tập tin ảnh đĩa có thể được tải về từ trang chủ Ubuntu, và các đĩa cài đặt có thể được cung cấp bởi bên thứ ba. Từ phiên bản Ubuntu 12.10, tập tin ảnh đĩa chỉ có thể được ghi lên đĩa DVD, USB, hoặc đĩa cứng, vì dung lượng của nó đã vượt quá giới hạn tối đa của đĩa CD.

Đĩa cài đặt Ubuntu yêu cầu máy tính có từ 256 MB RAM trở lên.

Bạn sẽ mất trung bình 20-30 phút cho một quá trình cài đặt Ubuntu sử dụng giao diện đồ họa, tốc độ cài đặt phụ thuộc vào cấu hình máy tính.

Ngoài ra, người dùng có thể cài đặt Ubuntu lên một đĩa ảo bên trong Windows bằng bộ cài đặt Wubi. Mặc dù tốc độ xử lý có thể bị giảm sút so với cài đặt đầy đủ, nhưng bù lại, cài đặt bên trong Windows không yêu cầu người dùng phải phân vùng lại đĩa cứng và có thể được gỡ bỏ dễ dàng từ ngay trong Windows.

Một quá trình cài đặt mặc định của Ubuntu sẽ bao gồm đa dạng các phần mềm như LibreOffice, Firefox, Thunderbird, Transmission, và một số tựa game nhẹ như Sudoku và cờ vua. Nhiều gói phần mềm mở rộng khác như Evolution, GIMP, Pidgin và Synaptic có thể được truy cập từ Ubuntu Software Center.

Ubuntu được vận hành dưới giấy phép vận hành chung GNU (GPL) và toàn bộ những ứng dụng được cài đặt mặc định đều là miễn phí. Ngoài ra, Ubuntu còn cài đặt một vài driver phần cứng chỉ có có sẵn dưới dạng nhị phân.

Ubuntu có ưu điểm và hạn chế gì?
Ưu điểm
Ubuntu hoàn toàn miễn phí
Với đặc trưng là một mã nguồn mở nên Ubuntu hoàn toàn miễn phí. Bạn có thể thoải mái tải về, sử dụng và chia sẻ mà không phải trả bất cứ chi phí nào. Không những thế, bạn có thể nghiên cứu cách chúng hoạt động, dựa vào đó để phát triển và phân phối chúng.

Đáp ứng nhu cầu của đa số người dùng
Ubuntu dành cho máy tính để bàn
Hệ điều hành máy tính để bàn Ubuntu nguồn mở hỗ trợ hàng triệu PC và máy tính xách tay trên khắp thế giới. Download tại đây

Cung cấp đủ chương trình cần thiết cho văn phòng

Tích hợp đa dạng các chương trình, phần mềm soạn thảo, nhận/gửi thư, phần mềm máy chủ web và lập trình, Ubuntu thuyết phục “dân văn phòng” khi có thể sử dụng được trên máy xách tay và máy chủ. 

Hỗ trợ và quản lý
Ubuntu Advantage là gói hỗ trợ chuyên nghiệp từ các chuyên gia của Canonical. Bạn sẽ được hỗ trợ 24/7 bởi các kỹ sư có kinh nghiệm trực tiếp về các vấn đề và khó khăn của bạn. Gói hỗ trợ này bao gồm Landscape, là một công cụ quản lý hệ thống Ubuntu, giúp theo dõi, quản lý, vá và tuân thủ báo cáo trên tất cả các máy tính để bàn Ubuntu.')
INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (4, 14, N'Ubuntu là gì? 
Khái niệm Ubuntu
Ubuntu là một hệ điều hành mã nguồn mở, được phát triển bởi cộng đồng chung trên nền tảng Debian GNU/Linux. 

Được tài trợ bởi Canonical Ltd (chủ sở hữu là một người Nam Phi Mark Shuttleworth), Ubuntu cực kỳ lý tưởng cho máy tính để bàn, máy xách tay và máy chủ.  

Tại sao hệ điều hành này được đặt tên là Ubuntu?
Ubuntu la tên của bản phân phối – khởi nguồn từ quan điểm “Ubuntu” mang tính cộng đồng của người Nam Phi: “Con người hướng đến con người”. Ubuntu đã mang tinh thần của quan điểm đó vào thế giới công nghệ. 

ubuntu-la-gi
Ubuntu qua từng bước phát triển
Tháng 10 năm 2004, phiên bản chính thức đầu tiên của Ubuntu được ra mắt – phiên bản 4.1.0 – mang mã là “Warty Warthog” đã thu hút được sự quan tâm trên toàn cầu của hàng ngàn người yêu thích phần mềm miễn phí cùng với các chuyên gia, cùng tham gia cộng đồng Ubuntu.

Phiên bản thông thường
Các phiên bản Ubuntu được đặt tên theo dạng YY.MM (tên), trong đó Y tương ứng với năm phát hành, và MM tương ứng với tháng phát hành. Tên trong ngoặc là tên hiệu được đặt cho phiên bản trước khi phát hành chính thức.

Phiên bản Ubuntu chính thức mới nhất hiện tại là Ubuntu 18.10 (Cosmic Cuttlefish), phát hành tháng 10 năm 2018. Phiên bản Ubuntu 19.04 (Disco Dingo) dự kiến phát hành vào tháng 4 năm 2019

Phiên bản hỗ trợ lâu dài
Ubuntu cũng có những phiên bản hỗ trợ dài hạn “Long Term Support”, hỗ trợ trong vòng 3 năm đối với máy tính để bàn và 5 năm đối với máy chủ. Các phiên bản Long Term Support sẽ được ra mắt mỗi 2 năm một lần.

ubuntu-la-gi
Cài đặt Ubuntu có khó không?
Mỗi phiên bản phát hành có một đĩa chạy trực tiếp, cho phép người dùng xem xét phần cứng của họ có tương thích với hệ điều hành hay không trước khi cài đặt lên đĩa cứng bằng phần mềm Ubiquity. Tập tin ảnh đĩa có thể được tải về từ trang chủ Ubuntu, và các đĩa cài đặt có thể được cung cấp bởi bên thứ ba. Từ phiên bản Ubuntu 12.10, tập tin ảnh đĩa chỉ có thể được ghi lên đĩa DVD, USB, hoặc đĩa cứng, vì dung lượng của nó đã vượt quá giới hạn tối đa của đĩa CD.

Đĩa cài đặt Ubuntu yêu cầu máy tính có từ 256 MB RAM trở lên.

Bạn sẽ mất trung bình 20-30 phút cho một quá trình cài đặt Ubuntu sử dụng giao diện đồ họa, tốc độ cài đặt phụ thuộc vào cấu hình máy tính.

Ngoài ra, người dùng có thể cài đặt Ubuntu lên một đĩa ảo bên trong Windows bằng bộ cài đặt Wubi. Mặc dù tốc độ xử lý có thể bị giảm sút so với cài đặt đầy đủ, nhưng bù lại, cài đặt bên trong Windows không yêu cầu người dùng phải phân vùng lại đĩa cứng và có thể được gỡ bỏ dễ dàng từ ngay trong Windows.

Một quá trình cài đặt mặc định của Ubuntu sẽ bao gồm đa dạng các phần mềm như LibreOffice, Firefox, Thunderbird, Transmission, và một số tựa game nhẹ như Sudoku và cờ vua. Nhiều gói phần mềm mở rộng khác như Evolution, GIMP, Pidgin và Synaptic có thể được truy cập từ Ubuntu Software Center.

Ubuntu được vận hành dưới giấy phép vận hành chung GNU (GPL) và toàn bộ những ứng dụng được cài đặt mặc định đều là miễn phí. Ngoài ra, Ubuntu còn cài đặt một vài driver phần cứng chỉ có có sẵn dưới dạng nhị phân.

Ubuntu có ưu điểm và hạn chế gì?
Ưu điểm
Ubuntu hoàn toàn miễn phí
Với đặc trưng là một mã nguồn mở nên Ubuntu hoàn toàn miễn phí. Bạn có thể thoải mái tải về, sử dụng và chia sẻ mà không phải trả bất cứ chi phí nào. Không những thế, bạn có thể nghiên cứu cách chúng hoạt động, dựa vào đó để phát triển và phân phối chúng.

Đáp ứng nhu cầu của đa số người dùng
Ubuntu dành cho máy tính để bàn
Hệ điều hành máy tính để bàn Ubuntu nguồn mở hỗ trợ hàng triệu PC và máy tính xách tay trên khắp thế giới. Download tại đây

Cung cấp đủ chương trình cần thiết cho văn phòng

Tích hợp đa dạng các chương trình, phần mềm soạn thảo, nhận/gửi thư, phần mềm máy chủ web và lập trình, Ubuntu thuyết phục “dân văn phòng” khi có thể sử dụng được trên máy xách tay và máy chủ. 

Hỗ trợ và quản lý
Ubuntu Advantage là gói hỗ trợ chuyên nghiệp từ các chuyên gia của Canonical. Bạn sẽ được hỗ trợ 24/7 bởi các kỹ sư có kinh nghiệm trực tiếp về các vấn đề và khó khăn của bạn. Gói hỗ trợ này bao gồm Landscape, là một công cụ quản lý hệ thống Ubuntu, giúp theo dõi, quản lý, vá và tuân thủ báo cáo trên tất cả các máy tính để bàn Ubuntu.')
INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (5, 14, N'Ubuntu là gì? 
Khái niệm Ubuntu
Ubuntu là một hệ điều hành mã nguồn mở, được phát triển bởi cộng đồng chung trên nền tảng Debian GNU/Linux. 

Được tài trợ bởi Canonical Ltd (chủ sở hữu là một người Nam Phi Mark Shuttleworth), Ubuntu cực kỳ lý tưởng cho máy tính để bàn, máy xách tay và máy chủ.  

Tại sao hệ điều hành này được đặt tên là Ubuntu?
Ubuntu la tên của bản phân phối – khởi nguồn từ quan điểm “Ubuntu” mang tính cộng đồng của người Nam Phi: “Con người hướng đến con người”. Ubuntu đã mang tinh thần của quan điểm đó vào thế giới công nghệ. 

ubuntu-la-gi
Ubuntu qua từng bước phát triển
Tháng 10 năm 2004, phiên bản chính thức đầu tiên của Ubuntu được ra mắt – phiên bản 4.1.0 – mang mã là “Warty Warthog” đã thu hút được sự quan tâm trên toàn cầu của hàng ngàn người yêu thích phần mềm miễn phí cùng với các chuyên gia, cùng tham gia cộng đồng Ubuntu.

Phiên bản thông thường
Các phiên bản Ubuntu được đặt tên theo dạng YY.MM (tên), trong đó Y tương ứng với năm phát hành, và MM tương ứng với tháng phát hành. Tên trong ngoặc là tên hiệu được đặt cho phiên bản trước khi phát hành chính thức.

Phiên bản Ubuntu chính thức mới nhất hiện tại là Ubuntu 18.10 (Cosmic Cuttlefish), phát hành tháng 10 năm 2018. Phiên bản Ubuntu 19.04 (Disco Dingo) dự kiến phát hành vào tháng 4 năm 2019

Phiên bản hỗ trợ lâu dài
Ubuntu cũng có những phiên bản hỗ trợ dài hạn “Long Term Support”, hỗ trợ trong vòng 3 năm đối với máy tính để bàn và 5 năm đối với máy chủ. Các phiên bản Long Term Support sẽ được ra mắt mỗi 2 năm một lần.

ubuntu-la-gi
Cài đặt Ubuntu có khó không?
Mỗi phiên bản phát hành có một đĩa chạy trực tiếp, cho phép người dùng xem xét phần cứng của họ có tương thích với hệ điều hành hay không trước khi cài đặt lên đĩa cứng bằng phần mềm Ubiquity. Tập tin ảnh đĩa có thể được tải về từ trang chủ Ubuntu, và các đĩa cài đặt có thể được cung cấp bởi bên thứ ba. Từ phiên bản Ubuntu 12.10, tập tin ảnh đĩa chỉ có thể được ghi lên đĩa DVD, USB, hoặc đĩa cứng, vì dung lượng của nó đã vượt quá giới hạn tối đa của đĩa CD.

Đĩa cài đặt Ubuntu yêu cầu máy tính có từ 256 MB RAM trở lên.

Bạn sẽ mất trung bình 20-30 phút cho một quá trình cài đặt Ubuntu sử dụng giao diện đồ họa, tốc độ cài đặt phụ thuộc vào cấu hình máy tính.

Ngoài ra, người dùng có thể cài đặt Ubuntu lên một đĩa ảo bên trong Windows bằng bộ cài đặt Wubi. Mặc dù tốc độ xử lý có thể bị giảm sút so với cài đặt đầy đủ, nhưng bù lại, cài đặt bên trong Windows không yêu cầu người dùng phải phân vùng lại đĩa cứng và có thể được gỡ bỏ dễ dàng từ ngay trong Windows.

Một quá trình cài đặt mặc định của Ubuntu sẽ bao gồm đa dạng các phần mềm như LibreOffice, Firefox, Thunderbird, Transmission, và một số tựa game nhẹ như Sudoku và cờ vua. Nhiều gói phần mềm mở rộng khác như Evolution, GIMP, Pidgin và Synaptic có thể được truy cập từ Ubuntu Software Center.

Ubuntu được vận hành dưới giấy phép vận hành chung GNU (GPL) và toàn bộ những ứng dụng được cài đặt mặc định đều là miễn phí. Ngoài ra, Ubuntu còn cài đặt một vài driver phần cứng chỉ có có sẵn dưới dạng nhị phân.

Ubuntu có ưu điểm và hạn chế gì?
Ưu điểm
Ubuntu hoàn toàn miễn phí
Với đặc trưng là một mã nguồn mở nên Ubuntu hoàn toàn miễn phí. Bạn có thể thoải mái tải về, sử dụng và chia sẻ mà không phải trả bất cứ chi phí nào. Không những thế, bạn có thể nghiên cứu cách chúng hoạt động, dựa vào đó để phát triển và phân phối chúng.

Đáp ứng nhu cầu của đa số người dùng
Ubuntu dành cho máy tính để bàn
Hệ điều hành máy tính để bàn Ubuntu nguồn mở hỗ trợ hàng triệu PC và máy tính xách tay trên khắp thế giới. Download tại đây

Cung cấp đủ chương trình cần thiết cho văn phòng

Tích hợp đa dạng các chương trình, phần mềm soạn thảo, nhận/gửi thư, phần mềm máy chủ web và lập trình, Ubuntu thuyết phục “dân văn phòng” khi có thể sử dụng được trên máy xách tay và máy chủ. 

Hỗ trợ và quản lý
Ubuntu Advantage là gói hỗ trợ chuyên nghiệp từ các chuyên gia của Canonical. Bạn sẽ được hỗ trợ 24/7 bởi các kỹ sư có kinh nghiệm trực tiếp về các vấn đề và khó khăn của bạn. Gói hỗ trợ này bao gồm Landscape, là một công cụ quản lý hệ thống Ubuntu, giúp theo dõi, quản lý, vá và tuân thủ báo cáo trên tất cả các máy tính để bàn Ubuntu.')
INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (6, 14, N'Ubuntu là gì? 
Khái niệm Ubuntu
Ubuntu là một hệ điều hành mã nguồn mở, được phát triển bởi cộng đồng chung trên nền tảng Debian GNU/Linux. 

Được tài trợ bởi Canonical Ltd (chủ sở hữu là một người Nam Phi Mark Shuttleworth), Ubuntu cực kỳ lý tưởng cho máy tính để bàn, máy xách tay và máy chủ.  

Tại sao hệ điều hành này được đặt tên là Ubuntu?
Ubuntu la tên của bản phân phối – khởi nguồn từ quan điểm “Ubuntu” mang tính cộng đồng của người Nam Phi: “Con người hướng đến con người”. Ubuntu đã mang tinh thần của quan điểm đó vào thế giới công nghệ. 

ubuntu-la-gi
Ubuntu qua từng bước phát triển
Tháng 10 năm 2004, phiên bản chính thức đầu tiên của Ubuntu được ra mắt – phiên bản 4.1.0 – mang mã là “Warty Warthog” đã thu hút được sự quan tâm trên toàn cầu của hàng ngàn người yêu thích phần mềm miễn phí cùng với các chuyên gia, cùng tham gia cộng đồng Ubuntu.

Phiên bản thông thường
Các phiên bản Ubuntu được đặt tên theo dạng YY.MM (tên), trong đó Y tương ứng với năm phát hành, và MM tương ứng với tháng phát hành. Tên trong ngoặc là tên hiệu được đặt cho phiên bản trước khi phát hành chính thức.
')
INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (7, 17, N'Danh sách các câu lệnh cơ bản trong Ubuntu
Các câu lệnh về thư mục và tập tin
pwd (path working directory)
In ra đường dẫn đến vị trí hiện tại bạn đang đứng.
ls (list)
Hiển thị danh sách các tập tin và thư mục trong thư mục hiện tại bạn đang đứng. Mặc định, lệnh này sẽ không in ra các file ẩn. Do đó, để in ra các file ẩn này, bạn sử dụng thêm tuỳ chọn -a.
Câu lệnh trở thành: ls -a
cd (change directory)
Thay đổi vị trí thư mục hiện tại - di chuyển đến vị trí thư mục khác. Một số cách khác nhau khi sử dụng lệnh cd là:
•	cd .: đứng nguyên ở thư mục hiện tại
•	cd ..: di chuyển đến thư mục cha của thư mục hiện tại
•	cd -: di chuyển đến thư mục trước khi di chuyển đến thư mục hiện tại
•	cd hoặc cd ~: di chuyển đến thư mục /home/username (ví dụ: /home/lampv). Đây là vị trí thư mục mặc định mỗi khi bạn mở Terminal. Và bạn có toàn quyền đối với thư mục này.
•	cd /: di chuyển đến thư mục root - thư mục gốc chứa mọi thư mục, trong đó có home/username
•	cd <tên thư mục con>: di chuyển đến thư mục con bên trong thư mục hiện tại
•	cd <đường dẫn đến thư mục>: di chuyển đến thư mục với đường dẫn là đường dẫn cứng. Đường dẫn cứng có thể ví dụ như: /home/lampv/Documents, ~/Documents/abc, ...
cp (copy)
Dùng để sao chép tập tin hay thư mục đến một thư mục khác.
•	cp <tên tập tin> <tên thư mục> : dùng để copy một tập tin vào một thư mục
•	cp -r <tên thư mục nguồn> <tên thư mục đích> : dùng để copy thư mục nguồn vào thư mục đích
mv (move)
Dùng để di chuyển tập tin đến một thư mục mới đồng thời đổi tên tập tin đó.
•	mv <tên tập tin cũ> <tên thư mục đích / tên tập tin mới>: di chuyển một tập tin đến thư mục mới đồng thời đổi tên tập tin.
•	mv <tên tập tin cũ> <tên thư mục đích>: di chuyển tập tin đến thư mục đích và không đổi tên.
rm (remove)
Dùng để xoá tập tin hay thư mục.
•	rm <tên tập tin>: dùng để xoá tập tin
•	rm <tên thư mục>: dùng để xoá một thư mục rỗng
•	rm -r <tên thư mục>: xoá bất kỳ thư mục nào
mkdir (make directory)
Dùng để tạo thư mục mới : mkdir <tên thư mục>
touch
Dùng để tạo file mới : touch <tên tập tin>
man
Dùng để hiển thị hướng dẫn các câu lệnh: man <tên câu lệnh>.
Ví dụ: man touch, man mkdir,...
Các câu lệnh về thông tin hệ thống
df
Hiển thị mức độ chiếm dụng không gian đĩa cứng của tập tin hệ thống ở tất cả các phân vùng được gắn kết. Đơn vị hiển thị là 1K.
Để hiển thị kết quả với đơn vị MB hay GB (dễ đọc hơn), bạn có thể dùng thêm tuỳ chọn -h (human-readable), câu lệnh thành df -h.
du
Hiển thị mức chiếm dụng không gian đĩa cứng ở thư mục hiện tại và các thư mục con. Có một số tuỳ chọn mà bạn có thể sử dụng:
•	-h: (human-readable) kết quả hiển thị sử dụng đơn vị là KB, MB hay GB
•	-s: (summary) hiển thị tổng dung lượng
free
Hiển thị dung lượng bộ nhớ RAM còn trống và đang được sử dụng với một số tuỳ chọn:
•	-h: (human-readable) hiển thị cách dễ đọc với con người
•	-g: hiển thị đơn vị dạng GB
•	-m: hiển thị đơn vị dạng MB
top
Hiển thị thông tin về hệ thống Linux của bạn, các tiến trình đang chạy và tài nguyên hệ thống, bao gồm: CPU, RAM, phân vùng Swap, và tổng số các tác vụ đang chạy.
uname -a
Hiển thị toàn bộ thông tin về tên máy tính, tên nhân kernel kèm theo số phiên bản và một vài chi tiết khác.
lsb_release -a
Hiển thị phiên bản linux đang dùng.
ifconfig
Hiển thị danh sách các thiết bị mạng trên máy tính. Qua đó, bạn có thể biết được địa chỉ IP hiện tại của máy.
adduser
Dùng để thêm một user mới cho máy: adduser <tên user mới>
passwd
Dùng để thêm password cho người dùng mới: passwd <tên user mới>
sudo
Nhiều câu lệnh trong Terminal cần phải có sudo phía trước. Khi dùng sudo, máy tính hiểu rằng bạn đang thực thi câu lệnh với quyền cao nhất, đó là quyền root.
Để thực thi được câu lệnh này, bạn bắt buộc phải nhập mật khẩu. Một số lệnh bắt buộc phải dùng sudo như:
•	sudo shutdown -h now: tắt máy tính ngay lập tức
•	sudo reboot: khởi động lại máy tính

')
INSERT [dbo].[Docs] ([DocsID], [LessonID], [Content]) VALUES (8, 18, N'II. VỚI FILE VÀ THƯ MỤC
Copy một file
cp ten_file.txt ten_file_new.txt
 Xóa toàn bộ file trong thư mục
rm -rf *
Tìm file có chứa nội dung “error”
find /home -type f -exec grep -l ''error'' {} \;
Tìm kiếm tên file + folder
find . error.log #tìm file có tên
find / -type d -name error #tìm thư muc có tên error
Tìm các file mới được chỉnh sửa
find / -mtime 50 #được chỉnh sửa trong 50 ngày
find / -mtime +50 –mtime -100 #được chỉnh sửa trong vòng 50 - 100 ngày
find ./ -cmin -60 #được tạo ra trong vòng 1 giờ
Tìm các file được phân quyền 444
find . -type f -perm 444
Gọp chung các file lại thành 1 file duy nhất
cat file_input1.txt file_input2.txt file_input3.txt > combined-file-output.txt
hoặc
cat *.txt > combined-file-output.txt
')
SET IDENTITY_INSERT [dbo].[Docs] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (5, 2, N'1. Mô hình Client-Server là gì ?', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (6, 2, N'2. Domain là gì? Tên miền là gì ?', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (8, 3, N'3. Học IT cần tố chất gì? Góc nhìn khác từ chiên gia định hướng giáo dục', 0, N'Docs')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (9, 3, N'4. Sinh viên IT đi thực tập tại doanh nghiệp cần biết những gì ?', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (10, 3, N'5. Trải nghiệm thực tế sau 2 tháng làm việc tại doanh nghiệp của học viên F8?', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (11, 4, N'6. Phương pháp học lập trình của Admin F8', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (12, 4, N'7.  Cách kiếm 1000$ lương 1 tháng', 0, N'Docs')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (13, 5, N'8. Hoàn thành khóa học', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (14, 12, N'1. Giới thiệu về Ubuntu', 0, N'Docs')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (15, 13, N'2. Cài đặt Windows Terminal', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (16, 13, N'3. Cài đặt Ubuntu với WSL 1', 0, N'Video')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (17, 14, N'4. Các lệnh cơ bản trong Ubuntu', 0, N'Docs')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (18, 14, N'5. Các lệnh nâng cao trong Ubuntu', 0, N'Docs')
INSERT [dbo].[Lesson] ([LessonID], [SectionID], [LessonName], [isDisable], [types]) VALUES (23, 2, N'HieuShin', 0, N'Video')
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (2, 1, N'1. Khái niệm kỹ thuật cần biết', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (3, 1, N'2. Môi trường, con người IT', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (4, 1, N'3. Phương pháp, định hướng', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (5, 1, N'4. Hoàn thành khóa học', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (6, 2, N'1. Bắt đầu', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (7, 2, N'2. Làm quen với HTML', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (8, 2, N'3. Làm quen với CSS', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (9, 2, N'4. Đệm, viền, khoảng lề', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (10, 2, N'5. Hoàn thành khóa học', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (12, 5, N'1. Giới thiệu', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (13, 5, N'2. Window terminal & WSL', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (14, 5, N'3. Các lệnh Linux cơ bản', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (15, 5, N'4. Chạy dự án React, Node, Laravel', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (16, 5, N'5. Deploy dự án với server thật', 0)
INSERT [dbo].[Section] ([SectionID], [CourseID], [SectionName], [isDisable]) VALUES (17, 5, N'6. Hoàn thành dự án', 0)
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (1, N'Nam', N'Ngô Hải', N'huongprowar@gmail.com', N'0364104616', N'Vietnam', N'Hanoi', N'Thach that, hoa lac', CAST(N'2002-12-25' AS Date), N'99999', 1.025E+07, NULL, N'huongprowar', N'cc7d8c88fe977b1a8d5d4182b79462a834965d7e445ffe948c67a5b813b8617b', N'Admin', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (2, N'Hùng', N'Vũ Mạnh', N'hungvmhe163268@fpt.edu.vn', N'0357079822', N'Vietnam', N'Halong', N'BaiChay', CAST(N'2002-06-16' AS Date), N'9999', 1000000, NULL, N'hungvmhe163268', N'93b6604a21552aeafebbc337ceb147cfd463ddeb62bd2dc6e151896360439f90', N'Admin', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (3, N'Hiếu', N'Nguyễn Văn', N'hieunvhe163104@fpt.edu.vn', N'0123456789', N'Vietnam', N'Bắc Giang', N'Bắc Giang', CAST(N'2002-07-28' AS Date), N'9999', 1000000, NULL, N'hieunvhe163104', N'b2cd77431c284d04160f1c92a615cd8c1177405fe9c94b86c0dfcb1d0b097979', N'Admin', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (4, N'Quang', N'Triệu Đình', N'quangtdhe163060@fpt.edu.vn', N'0123456789', N'Vietnam', N'Hạ Long', N'Hạ Long', CAST(N'2002-09-15' AS Date), N'9999', 500000, NULL, N'quangtdhe163060', N'165e30c5c0912b1e20c6934eb93d118dbd098dcab332dc02d7c7d01a7bea5af6', N'Mentor', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (5, N'Cường', N'Vàng Việt', N'cuongvvhe130951@fpt.edu.vn', N'0123456789', N'Việt Nam', N'Bắc Ninh', N'Bắc Ninh', CAST(N'2002-04-24' AS Date), N'9999', 100000, NULL, N'cuongvvhe130951', N'efe00d5ae94484ea71b939eb0c73f636ccf0a62afa4a4a07bf63bc900cdc0b6b', N'User', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (6, N'Hùng', N'Trần Mạnh', N'hungtmhe163407@fpt.edu.vn', N'0123456789', N'Việt Nam', N'Hạ Long', N'Hạ Long', CAST(N'2002-05-25' AS Date), N'9999', 123456, NULL, N'hungtmhe163407', N'9566f599cc9b7e2e67bb6fa7deeba93b46c0624cce916e96377682d9633de8ab', N'Admin', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (7, N'Dũng', N'Lê Đào Quang', N'dungldqhe161262@fpt.edu.vn', N'012345678', N'Việt Nam', N'Hà Nam', N'Hà Nam', CAST(N'2002-06-19' AS Date), N'1000', 733257, NULL, N'dungldqhe161262', N'5d54e7eae06a7686e1c1190bd021b3a3b22c9512834e598e0d68b9a5d5ca2763', N'Admin', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (8, N'Dương', N'Phạm Chu', N'duongpche163153@fpt.edu.vn', N'012345678', N'Việt Nam', N'Hà Tây', N'Hà Tây ', CAST(N'2002-07-18' AS Date), N'2222', 18492, NULL, N'duongpche163153', N'f5082b27da49a7d97b2dc1ea447a8aa88ce0ca37ca293022e4a65e3390b22d76', N'User', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (9, N'Quân', N'Lê Minh', N'quanlmhe163084@fpt.edu.vn', N'0123456789', N'Việt Nam', N'Quảng Bình', N'Quảng Bình', CAST(N'2002-03-24' AS Date), N'7673', 63728, NULL, N'quanlmhe163084', N'92a0ae5b8ea9f45a75c6496cc9e14d8ae1aed321942efa3f8fa5f82e6c6827b0', N'User', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (10, N'Quân', N'Nguyễn Bá', N'quannbhe163333@fpt.edu.vn', N'0123138575', N'Việt Nam', N'Hà Giang', N'Hà Giang', CAST(N'2002-02-07' AS Date), N'3333', 673852, NULL, N'quannbhe163333', N'3d566f94e17eaf0997ec38629187f5515512972c6679f97c2228d71b3b607f3a', N'User', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (11, N'Ánh', N'Khuất Thị Minh', N'anhktmhe163997@fpt.edu.vn', N'0123434657', N'Việt Nam', N'Bắc Ninh', N'Bắc Ninh', CAST(N'2002-04-27' AS Date), N'7736', 983495, NULL, N'anhktmhe163997', N'2278f720b17f0e6640bef93fc1b0ff2f9fa5f65b918c473f770ca330a3ab5d55', N'Mentor', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (12, N'Khải', N'Nguyễn Quang', N'khainqhe161218@fpt.edu.vn', N'0734824659', N'Việt Nam', N'Hà Tây', N'Hà Tây', CAST(N'2002-02-23' AS Date), N'1233', 312331, NULL, N'khainqhe161218', N'a526a4625b557acf9f4d3332c4e7ab1dfdba5fd20269847dc399be80eefdc5ad', N'Mentor', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (13, N'Hữu', N'Phạm Bằng', N'huupbhe160316@fpt.edu.vn', N'0539815724', N'Việt Nam', N'Hà Nội', N'Hà Nội', CAST(N'2002-11-23' AS Date), N'31223', 81233, NULL, N'huupbhe160316', N'e6810d714eabd3ee82f64b92dffd7da402cdef9f0123cbcba172c5f8d3047628', N'Mentor', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (14, N'Hiếu', N'Nguyễn', N'hieunvhe163104@fpt.edu.vn', N'0988561896', N'Việt Nam', N'Bắc Giang', N'Mỹ Thái, Lạng Giang, Bắc Giang', CAST(N'2002-11-07' AS Date), N'10001', 1000000, NULL, N'hieunv', N'Hieunguyen02@', N'User', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (15, N'Ngo Hai Nam', N'(K16_HL)', N'namnhhe163297@fpt.edu.vn', NULL, NULL, NULL, NULL, CAST(N'1970-01-01' AS Date), NULL, 0, N'https://lh3.googleusercontent.com/a-/ACNPEu_nAsTJRa8ej-iU_tAZdmLcsktjTwtUWp2hfL9t=s96-c', N'103895249849927586384', N'9fe163b873af57c01120f2714537f855a7ef08e8c228bfc937d6fedbf28f3922', N'User', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (16, N'Ngô Hải', N'Nam', N'maplestoryvn2002@gmail.com', NULL, NULL, NULL, NULL, CAST(N'1970-01-01' AS Date), NULL, 0, N'https://lh3.googleusercontent.com/a-/ACNPEu9Im8FqNAfn9fSj9Ma29A0JW3-f7xDOIpD2-ARs=s96-c', N'109757943649574234256', N'c2619fdca85fbb9090db842fdb239bc1d69e78e1b7f4c31ee7767a59af70ebea', N'User', NULL, NULL, 0)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Email], [PhoneNumber], [Country], [City], [Address], [DoB], [PostCode], [Balance], [Avatar], [Username], [Password], [Role], [BankNumber], [BankName], [isDisable]) VALUES (17, N'Nguyễn Văn', N'Hiếu', N'hieubglgmtcl02@gmail.com', NULL, NULL, NULL, NULL, CAST(N'2002-11-07' AS Date), NULL, 0, NULL, N'hieushin123', N'60a54089438a2665683c8638d51fb1e52ec574fc112038d102486dbaaade8d33', N'User', N'', N'', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (7, 1, 1, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (7, 2, 1, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (7, 3, 1, 5, N'Là một khóa học rất bổ ích', 100, NULL, 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (7, 7, 1, 5, N'Ðáng đồng tiền bát gạo', 100, CAST(N'2022-09-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (10, 3, 1, 4, N'Hơi khó để học', 97, NULL, 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (10, 8, 1, 4.3, N'Ðáng học', 69, CAST(N'2022-07-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (10, 9, 1, 3.7, N'Khó', 70, CAST(N'2022-06-27T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (11, 2, 1, 4.7, N'Game là dễ ', 100, NULL, 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (11, 3, 1, 4.8, N'Quá dễ hiểu', 100, NULL, 1)
INSERT [dbo].[User_Course] ([UserID], [CourseID], [isStudied], [CourseRating], [CourseFeedback], [Progress], [Paydate], [isFavourite]) VALUES (13, 7, 1, 3.9, N'Ðắt quá', 79.6, CAST(N'2022-08-28T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (1, 5, N'Mô hình Client-server', N'https://www.youtube.com/watch?v=zoELAirXMJY&ab_channel=F8Official')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (2, 6, N'Domain là gì? Bạn đã thật sự hiểu về Domain ?', N'https://www.youtube.com/watch?v=M62l1xA5Eu8&list=RDLVzoELAirXMJY&index=2&ab_channel=F8Official')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (3, 9, N'Sinh viên IT đi thực tập tại doanh nghiệp cần biết những gì ?', N'https://www.youtube.com/watch?v=YH-E4Y3EaT4&t=35s&ab_channel=F8Official')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (4, 10, N'Trải nghiệm thực tế sau 2 tháng làm việc', N'https://www.youtube.com/watch?v=2sg1yNl1WvE&ab_channel=F8Official')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (5, 11, N'Phương pháp học lập trình của Admin F8', N'https://www.youtube.com/watch?v=DpvYHLUiZpc&ab_channel=F8Official')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (6, 13, N'Hoàn thành khóa học', N'https://www.youtube.com/watch?v=hf1DkBQRQj4&ab_channel=ChowMains')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (7, 15, N'Cài đặt Windows Terminal', N'https://www.youtube.com/watch?v=egSxAF-Sak4&ab_channel=F8Official')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (8, 16, N'Cài đặt Ubuntu với WSL 1', N'https://www.youtube.com/watch?v=ypvjxw5qBK0&ab_channel=F8Official')
INSERT [dbo].[Video] ([VideoID], [LessonID], [VideoName], [VideoLink]) VALUES (13, 23, N'HieuShin', N'https://www.youtube.com/watch?v=Q3Itc2ytdVY')
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
/****** Object:  Index [Answer_AnswerID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Answer_AnswerID] ON [dbo].[Answer]
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Blog_BlogID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Blog_BlogID] ON [dbo].[Blog]
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Comment_CommentID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Comment_CommentID] ON [dbo].[Comment]
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CommentBlog_CommentID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [CommentBlog_CommentID] ON [dbo].[CommentBlog]
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Course_CourseID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Course_CourseID] ON [dbo].[Course]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Lesson_LessonID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Lesson_LessonID] ON [dbo].[Lesson]
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Notification_NoticeID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Notification_NoticeID] ON [dbo].[Notification]
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Question_QuestionID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Question_QuestionID] ON [dbo].[Question]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Quiz_QuizID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Quiz_QuizID] ON [dbo].[Quiz]
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Recharge_RechargeID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Recharge_RechargeID] ON [dbo].[Recharge]
(
	[RechargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Section_SectionID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Section_SectionID] ON [dbo].[Section]
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [User_UserID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [User_UserID] ON [dbo].[User]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Video_VideoID]    Script Date: 9/30/2022 11:41:02 PM ******/
CREATE NONCLUSTERED INDEX [Video_VideoID] ON [dbo].[Video]
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Lesson] ADD  CONSTRAINT [DF_User_Lesson_Checked]  DEFAULT ((0)) FOR [Checked]
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
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FKComment362035] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Video] ([VideoID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FKComment362035]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FKComment630592] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FKComment630592]
GO
ALTER TABLE [dbo].[CommentBlog]  WITH CHECK ADD  CONSTRAINT [FKCommentBlo644738] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogID])
GO
ALTER TABLE [dbo].[CommentBlog] CHECK CONSTRAINT [FKCommentBlo644738]
GO
ALTER TABLE [dbo].[Docs]  WITH CHECK ADD  CONSTRAINT [FKDocs909883] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Docs] CHECK CONSTRAINT [FKDocs909883]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FKLesson935170] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FKLesson935170]
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
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FKQuiz516641] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FKQuiz516641]
GO
ALTER TABLE [dbo].[Recharge]  WITH CHECK ADD  CONSTRAINT [FKRecharge738481] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Recharge] CHECK CONSTRAINT [FKRecharge738481]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FKSection763424] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FKSection763424]
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
ALTER TABLE [dbo].[User_Lesson]  WITH CHECK ADD  CONSTRAINT [FK_User_Lesson_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[User_Lesson] CHECK CONSTRAINT [FK_User_Lesson_Lesson]
GO
ALTER TABLE [dbo].[User_Lesson]  WITH CHECK ADD  CONSTRAINT [FK_User_Lesson_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Lesson] CHECK CONSTRAINT [FK_User_Lesson_User]
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
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FKVideo395243] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FKVideo395243]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [from_to] CHECK  (([from]<>[to]))
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [from_to]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_docs]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_create_docs]
	@SectionID	INT,
	@LessonName NVARCHAR(200),
	@Content NTEXT
AS BEGIN
	INSERT INTO [Lesson]([SectionID], [LessonName], [isDisable], [types])
	VALUES (@SectionID, @LessonName, 0, 'Docs');

	INSERT INTO [Docs]([LessonID], [Content])
	VALUES (
		(SELECT SCOPE_IDENTITY()),
		@Content
	);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_create_video]    Script Date: 9/30/2022 11:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_create_video]
	@SectionID	INT,
	@LessonName NVARCHAR(200),
	@VideoName NVARCHAR(200),
	@VideoLink VARCHAR(MAX)
AS BEGIN
	INSERT INTO [Lesson]([SectionID], [LessonName], [isDisable], [types])
	VALUES (@SectionID, @LessonName, 0, 'Video');

	INSERT INTO [Video]([LessonID], [VideoName], [VideoLink])
	VALUES (
		(SELECT SCOPE_IDENTITY()),
		@VideoName,
		@VideoLink
	);
END;
GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
