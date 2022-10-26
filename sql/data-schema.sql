USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 10/26/2022 10:30:37 AM ******/
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
	[ParentID] [int] NULL,
	[isDisable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentBlog]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 10/26/2022 10:30:37 AM ******/
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
	[Status] [nchar](10) NOT NULL,
	[Description] [ntext] NULL,
	[Objectives] [ntext] NULL,
	[Difficulty] [nchar](10) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docs]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Lesson]    Script Date: 10/26/2022 10:30:37 AM ******/
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
	[Time] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NoticeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NoticeContent] [ntext] NULL,
	[NoticeDate] [datetime] NULL,
	[isSeen] [bit] NOT NULL,
	[Action] [nvarchar](50) NULL,
 CONSTRAINT [PK__Notifica__CE83CB8594AD468F] PRIMARY KEY CLUSTERED 
(
	[NoticeID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Quiz]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[Recharge]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recharge](
	[RechargeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RechargeDate] [datetime] NULL,
	[Amount] [int] NULL,
	[Status] [int] NOT NULL,
	[Method] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](50) NULL,
 CONSTRAINT [PK__Recharge__C5894516ACF264DD] PRIMARY KEY CLUSTERED 
(
	[RechargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CommentID] [int] NOT NULL,
	[ReportContent] [nvarchar](50) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC,
	[UserID] ASC,
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/26/2022 10:30:37 AM ******/
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
	[Balance] [int] NULL,
	[Avatar] [text] NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[BankNumber] [varchar](20) NULL,
	[BankName] [nvarchar](50) NULL,
	[isDisable] [bit] NOT NULL,
 CONSTRAINT [PK__User__1788CCACC5C4F906] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Comment]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Comment](
	[CommentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[isLiked] [bit] NULL,
 CONSTRAINT [PK_User_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Course]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Course](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[isStudied] [bit] NOT NULL,
	[CourseRating] [int] NULL,
	[CourseFeedback] [ntext] NULL,
	[Progress] [real] NULL,
	[Paydate] [datetime] NULL,
	[isFavourite] [bit] NULL,
 CONSTRAINT [PK__User_Cou__7B1A1BB4D6DDFF75] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Lesson]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Lesson](
	[UserID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_User_Lesson] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Question]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Question](
	[UserID] [int] NOT NULL,
	[AnswerID] [int] NOT NULL,
 CONSTRAINT [PK_User_Question] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Quiz]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Quiz](
	[UserID] [int] NOT NULL,
	[ChooseID] [int] NOT NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_User_Quiz] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ChooseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 10/26/2022 10:30:37 AM ******/
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
/****** Object:  Index [Answer_AnswerID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Answer_AnswerID] ON [dbo].[Answer]
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Blog_BlogID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Blog_BlogID] ON [dbo].[Blog]
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Comment_CommentID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Comment_CommentID] ON [dbo].[Comment]
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CommentBlog_CommentID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [CommentBlog_CommentID] ON [dbo].[CommentBlog]
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Course_CourseID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Course_CourseID] ON [dbo].[Course]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Lesson_LessonID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Lesson_LessonID] ON [dbo].[Lesson]
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Notification_NoticeID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Notification_NoticeID] ON [dbo].[Notification]
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Question_QuestionID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Question_QuestionID] ON [dbo].[Question]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Quiz_QuizID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Quiz_QuizID] ON [dbo].[Quiz]
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Recharge_RechargeID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Recharge_RechargeID] ON [dbo].[Recharge]
(
	[RechargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Section_SectionID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Section_SectionID] ON [dbo].[Section]
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [User_UserID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [User_UserID] ON [dbo].[User]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Video_VideoID]    Script Date: 10/26/2022 10:30:37 AM ******/
CREATE NONCLUSTERED INDEX [Video_VideoID] ON [dbo].[Video]
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Lesson] ADD  CONSTRAINT [DF_User_Lesson_Checked]  DEFAULT ((0)) FOR [Status]
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
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_User] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_User]
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
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
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
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Comment]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Course]
GO
ALTER TABLE [dbo].[User_Comment]  WITH CHECK ADD  CONSTRAINT [FK_User_Comment_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[User_Comment] CHECK CONSTRAINT [FK_User_Comment_Comment]
GO
ALTER TABLE [dbo].[User_Comment]  WITH CHECK ADD  CONSTRAINT [FK_User_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Comment] CHECK CONSTRAINT [FK_User_Comment_User]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FK_User_Course_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FK_User_Course_Course]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FKUser_Cours401962] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FKUser_Cours401962]
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
ALTER TABLE [dbo].[User_Question]  WITH CHECK ADD  CONSTRAINT [FK_User_Question_Answer] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answer] ([AnswerID])
GO
ALTER TABLE [dbo].[User_Question] CHECK CONSTRAINT [FK_User_Question_Answer]
GO
ALTER TABLE [dbo].[User_Question]  WITH CHECK ADD  CONSTRAINT [FK_User_Question_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Question] CHECK CONSTRAINT [FK_User_Question_User]
GO
ALTER TABLE [dbo].[User_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_User_Quiz_Answer] FOREIGN KEY([ChooseID])
REFERENCES [dbo].[Answer] ([AnswerID])
GO
ALTER TABLE [dbo].[User_Quiz] CHECK CONSTRAINT [FK_User_Quiz_Answer]
GO
ALTER TABLE [dbo].[User_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_User_Quiz_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Quiz] CHECK CONSTRAINT [FK_User_Quiz_User]
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
/****** Object:  StoredProcedure [dbo].[sp_create_docs]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_create_docs]
	@SectionID	INT,
	@LessonName NVARCHAR(200),
	@Time int,
	@Content NTEXT
AS BEGIN
	INSERT INTO [Lesson]([SectionID], [LessonName], [isDisable], [types], [Time])
	VALUES (@SectionID, @LessonName, 0, 'Docs', @Time);

	INSERT INTO [Docs]([LessonID], [Content])
	VALUES (
		(SELECT SCOPE_IDENTITY()),
		@Content
	);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_create_video]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_create_video]
	@SectionID	INT,
	@LessonName NVARCHAR(200),
	@VideoName NVARCHAR(200),
	@VideoLink VARCHAR(MAX),
	@Time INT
AS BEGIN
	INSERT INTO [Lesson]([SectionID], [LessonName], [isDisable], [types], [Time])
	VALUES (@SectionID, @LessonName, 0, 'Video', @Time);

	INSERT INTO [Video]([LessonID], [VideoName], [VideoLink])
	VALUES (
		(SELECT SCOPE_IDENTITY()),
		@VideoName,
		@VideoLink
	);
END;

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[sp_update_progress]    Script Date: 10/26/2022 10:30:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[sp_update_progress]
	@CourseID INT,
	@UserID INT
AS BEGIN
	WITH T AS (
		SELECT [UL].[Status]
		FROM [User_Lesson] AS UL, [Lesson] AS L, [Section] AS S 
		WHERE [UL].[UserID] = @UserID AND S.[CourseID] = @CourseID AND [UL].[LessonID] = [L].[LessonID] AND [L].[SectionID] = [S].[SectionID]
	) 
	UPDATE [User_Course] 
	SET [Progress] = CAST((SELECT COUNT(0) FROM T WHERE T.[Status] = 'Done') AS REAL) * 100 / (select count(0) from Lesson l
		inner join Section s on l.SectionID = s.SectionID
		where s.CourseID = @CourseID)
	WHERE [UserID] = @UserID AND [CourseID] = @CourseID
END

GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
