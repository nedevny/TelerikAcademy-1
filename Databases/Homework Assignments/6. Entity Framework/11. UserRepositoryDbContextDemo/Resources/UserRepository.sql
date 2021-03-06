USE [master]
GO
/****** Object:  Database [UserRepository]    Script Date: 7/16/2013 12:06:00 AM ******/
CREATE DATABASE [UserRepository]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserRepository', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UserRepository.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UserRepository_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UserRepository_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UserRepository] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserRepository].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserRepository] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserRepository] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserRepository] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserRepository] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserRepository] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserRepository] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserRepository] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UserRepository] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserRepository] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserRepository] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserRepository] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserRepository] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserRepository] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserRepository] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserRepository] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserRepository] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserRepository] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserRepository] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserRepository] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserRepository] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserRepository] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserRepository] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserRepository] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserRepository] SET RECOVERY FULL 
GO
ALTER DATABASE [UserRepository] SET  MULTI_USER 
GO
ALTER DATABASE [UserRepository] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserRepository] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserRepository] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserRepository] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UserRepository', N'ON'
GO
USE [UserRepository]
GO
/****** Object:  User [logteam]    Script Date: 7/16/2013 12:06:00 AM ******/
CREATE USER [logteam] FOR LOGIN [logteam] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 7/16/2013 12:06:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/16/2013 12:06:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[UserFirstName] [nvarchar](50) NOT NULL,
	[UserLastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([GroupId], [GroupName]) VALUES (5, N'Admins')
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [GroupId], [Username], [Password], [UserFirstName], [UserLastName]) VALUES (1, NULL, N'student', N'student', N'Salman', N'Khan')
INSERT [dbo].[Users] ([UserId], [GroupId], [Username], [Password], [UserFirstName], [UserLastName]) VALUES (6, 5, N'salman', N's3cr3t', N'Salman', N'Khan')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_Users]    Script Date: 7/16/2013 12:06:00 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UC_Users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Groups]
GO
USE [master]
GO
ALTER DATABASE [UserRepository] SET  READ_WRITE 
GO
