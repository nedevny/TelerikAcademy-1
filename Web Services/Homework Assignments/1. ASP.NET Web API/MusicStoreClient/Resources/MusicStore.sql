USE [master]
GO
/****** Object:  Database [MusicStore]    Script Date: 8/10/2013 2:44:12 PM ******/
CREATE DATABASE [MusicStore]
GO
ALTER DATABASE [MusicStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MusicStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicStore] SET RECOVERY FULL 
GO
ALTER DATABASE [MusicStore] SET  MULTI_USER 
GO
ALTER DATABASE [MusicStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MusicStore', N'ON'
GO
USE [MusicStore]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 8/10/2013 2:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[AlbumTitle] [nvarchar](50) NOT NULL,
	[AlbumYear] [int] NULL,
	[Producer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArtistAlbums]    Script Date: 8/10/2013 2:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistAlbums](
	[ArtistId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
 CONSTRAINT [PK_ArtistAlbums] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC,
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Artists]    Script Date: 8/10/2013 2:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Songs]    Script Date: 8/10/2013 2:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[SongId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistId] [int] NULL,
	[AlbumId] [int] NULL,
	[SongTitle] [nvarchar](50) NOT NULL,
	[SongYear] [int] NULL,
	[Genre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([AlbumId], [AlbumTitle], [AlbumYear], [Producer]) VALUES (1, N'Eros', 1997, N'BMG')
INSERT [dbo].[Albums] ([AlbumId], [AlbumTitle], [AlbumYear], [Producer]) VALUES (2, N'Unchain My Heart', 1987, N'EMI')
INSERT [dbo].[Albums] ([AlbumId], [AlbumTitle], [AlbumYear], [Producer]) VALUES (3, N'One Night Only', 1998, N'Polydor')
INSERT [dbo].[Albums] ([AlbumId], [AlbumTitle], [AlbumYear], [Producer]) VALUES (4, N'Maggie May', 1990, N'Pickwick')
INSERT [dbo].[Albums] ([AlbumId], [AlbumTitle], [AlbumYear], [Producer]) VALUES (8, N'Romanza', 1996, N'Polydor')
SET IDENTITY_INSERT [dbo].[Albums] OFF
INSERT [dbo].[ArtistAlbums] ([ArtistId], [AlbumId]) VALUES (1, 1)
INSERT [dbo].[ArtistAlbums] ([ArtistId], [AlbumId]) VALUES (2, 4)
INSERT [dbo].[ArtistAlbums] ([ArtistId], [AlbumId]) VALUES (3, 2)
INSERT [dbo].[ArtistAlbums] ([ArtistId], [AlbumId]) VALUES (5, 3)
INSERT [dbo].[ArtistAlbums] ([ArtistId], [AlbumId]) VALUES (7, 8)
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (1, N'Eros Ramazzotti', N'Italy', CAST(0x00005B0E00000000 AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (2, N'Rod Stewart', N'USA', CAST(0x0000403D00000000 AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (3, N'Joe Cocker', N'USA', CAST(0x00003F5200000000 AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (4, N'Tina Turner', N'USA', CAST(0x000038ED00000000 AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (5, N'Bee Gees', N'Australia', CAST(0x000053C000000000 AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (7, N'Andrea Bocelli', N'Italy', CAST(0x000053C800000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Artists] OFF
SET IDENTITY_INSERT [dbo].[Songs] ON 

INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (1, 1, 1, N'Terra promessa', 1997, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (2, 1, 1, N'Una storia importante', 1997, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (3, 1, 1, N'Adesso tu', 1997, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (4, 1, 1, N'Ma che bello questo amore', 1997, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (5, 1, 1, N'Musica è', 1997, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (8, 2, 4, N'Maggie May', 1990, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (9, 3, 2, N'Unchain My Heart', 1987, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (10, 3, 2, N'Two Wrongs', 1987, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (11, 3, 2, N'I Stand In Wonder', 1987, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (12, 3, 2, N'The River''s Rising', 1987, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (13, 3, 2, N'Isolation', 1987, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (14, 3, 2, N'All Our Tomorrows', 1987, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (15, 3, 2, N'A Woman Loves a Man', 1987, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (19, 7, 8, N'Con te partirò', 1996, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (20, 7, 8, N'Vivere', 1996, N'Pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [AlbumId], [SongTitle], [SongYear], [Genre]) VALUES (21, 7, 8, N'Per Amore', 1996, N'Pop')
SET IDENTITY_INSERT [dbo].[Songs] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Artists_ArtistName]    Script Date: 8/10/2013 2:44:13 PM ******/
ALTER TABLE [dbo].[Artists] ADD  CONSTRAINT [UK_Artists_ArtistName] UNIQUE NONCLUSTERED 
(
	[ArtistName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtistAlbums]  WITH CHECK ADD  CONSTRAINT [FK_ArtistAlbums_Albums] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
ALTER TABLE [dbo].[ArtistAlbums] CHECK CONSTRAINT [FK_ArtistAlbums_Albums]
GO
ALTER TABLE [dbo].[ArtistAlbums]  WITH CHECK ADD  CONSTRAINT [FK_ArtistAlbums_Artists] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[ArtistAlbums] CHECK CONSTRAINT [FK_ArtistAlbums_Artists]
GO
ALTER TABLE [dbo].[Songs]  WITH CHECK ADD  CONSTRAINT [FK_Songs_Albums] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
ALTER TABLE [dbo].[Songs] CHECK CONSTRAINT [FK_Songs_Albums]
GO
ALTER TABLE [dbo].[Songs]  WITH CHECK ADD  CONSTRAINT [FK_Songs_Artists] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[Songs] CHECK CONSTRAINT [FK_Songs_Artists]
GO
USE [master]
GO
ALTER DATABASE [MusicStore] SET  READ_WRITE 
GO
