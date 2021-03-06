USE [master]
GO
/****** Object:  Database [TEST_MOI_DACS_SV5T]    Script Date: 6/11/2018 11:48:47 AM ******/
CREATE DATABASE [TEST_MOI_DACS_SV5T]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST_MOI_DACS_SV5T', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TEST_MOI_DACS_SV5T.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TEST_MOI_DACS_SV5T_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TEST_MOI_DACS_SV5T_log.ldf' , SIZE = 2624KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST_MOI_DACS_SV5T].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET  MULTI_USER 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET QUERY_STORE = OFF
GO
USE [TEST_MOI_DACS_SV5T]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TEST_MOI_DACS_SV5T]
GO
/****** Object:  Table [dbo].[CT_TEUCHI]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_TEUCHI](
	[ID_CTTCHI] [int] IDENTITY(1,1) NOT NULL,
	[ID_TCHI] [int] NOT NULL,
	[NOIDUNG] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CTTCHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIA]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIA](
	[ID_CAP] [int] NOT NULL,
	[ID_CTTCHI] [int] NOT NULL,
	[TCHUAN_HOCTAP] [float] NULL,
	[TCHUAN_HD] [bit] NULL,
	[ID_DANHGIA] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DANHGIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MINHCHUNG]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MINHCHUNG](
	[ID_SV] [int] NOT NULL,
	[ID_CTTCHI] [int] NOT NULL,
	[URL] [nvarchar](255) NULL,
	[DUYET] [bit] NULL,
	[MOTA] [nvarchar](255) NULL,
	[HINHANH] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SV] ASC,
	[ID_CTTCHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[QLMINHCHUNG]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[QLMINHCHUNG] AS
select a.ID_SV, a.ID_CTTCHI, b.ID_CAP, b.TCHUAN_HOCTAP, c.NOIDUNG, a.DUYET from MINHCHUNG a, DANHGIA b, CT_TEUCHI c
where a.ID_CTTCHI = c.ID_CTTCHI and b.ID_CTTCHI=c.ID_CTTCHI
GO
/****** Object:  Table [dbo].[CAP]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAP](
	[ID_CAP] [int] IDENTITY(1,1) NOT NULL,
	[TEN_CAP] [nvarchar](255) NULL,
	[NAM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CAP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DUYET_TC]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DUYET_TC](
	[ID_SV] [int] NOT NULL,
	[ID_DANHGIA] [int] NOT NULL,
	[DUYET] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SV] ASC,
	[ID_DANHGIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIOITHIEU]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIOITHIEU](
	[id_gt] [int] IDENTITY(1,1) NOT NULL,
	[aboutus] [ntext] NULL,
 CONSTRAINT [PK_GIOITHIEU] PRIMARY KEY CLUSTERED 
(
	[id_gt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOAVIEN]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOAVIEN](
	[ID_KV] [int] IDENTITY(1,1) NOT NULL,
	[TEN_KV] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_KV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICH_HOATDONG]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICH_HOATDONG](
	[ID_HD] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[DATEBEGIN] [smalldatetime] NULL,
	[ĐỊA ĐIỂM] [nvarchar](255) NULL,
	[ORDER] [int] NULL,
	[HIDE] [int] NULL,
 CONSTRAINT [PK_LICH_HOATDONG] PRIMARY KEY CLUSTERED 
(
	[ID_HD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAITIEUCHI]    Script Date: 6/11/2018 11:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAITIEUCHI](
	[ID_LTCHI] [int] IDENTITY(1,1) NOT NULL,
	[TEN_LTCHI] [nvarchar](255) NULL,
	[NAM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_LTCHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 6/11/2018 11:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[ID_MENU] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](50) NULL,
	[DATEBEGIN] [smalldatetime] NULL,
	[META] [varchar](255) NULL,
	[ORDER] [int] NULL,
	[LINK] [nvarchar](255) NULL,
	[HIDE] [int] NULL,
 CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED 
(
	[ID_MENU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 6/11/2018 11:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[ID_ND] [int] IDENTITY(1,1) NOT NULL,
	[TENDN] [varchar](255) NULL,
	[TENND] [nvarchar](255) NULL,
	[MK] [varchar](100) NULL,
	[PQ] [bit] NULL,
	[XNMK] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 6/11/2018 11:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[ID_SV] [int] IDENTITY(1,1) NOT NULL,
	[TEN_SV] [nvarchar](255) NULL,
	[LOP] [varchar](20) NULL,
	[DIACHI] [nvarchar](255) NULL,
	[EMAIL] [varchar](255) NULL,
	[SDT] [varchar](15) NULL,
	[ID_KV] [int] NOT NULL,
	[PASSWORD] [varchar](max) NULL,
	[MSSV] [int] NULL,
	[ID_CAP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 6/11/2018 11:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID_SLIDE] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](50) NULL,
	[IMG] [varchar](255) NULL,
	[DATEBEGIN] [smalldatetime] NULL,
	[META] [varchar](255) NULL,
	[ORDER] [int] NULL,
	[LINK] [nvarchar](255) NULL,
	[HIDE] [bit] NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[ID_SLIDE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIEUCHI]    Script Date: 6/11/2018 11:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIEUCHI](
	[ID_TCHI] [int] IDENTITY(1,1) NOT NULL,
	[TEN_TCHI] [nvarchar](255) NULL,
	[ID_LTCHI] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TCHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 6/11/2018 11:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[ID_TT] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[IMG] [varchar](255) NULL,
	[MOTA] [ntext] NULL,
	[DETAIL] [ntext] NULL,
	[DATEBEGIN] [smalldatetime] NULL,
	[META] [varchar](255) NULL,
	[ORDER] [int] NULL,
	[LINK] [nvarchar](255) NULL,
	[HIDE] [int] NULL,
 CONSTRAINT [PK_TINTUC] PRIMARY KEY CLUSTERED 
(
	[ID_TT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VANBAN]    Script Date: 6/11/2018 11:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VANBAN](
	[ID_VB] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[IMG] [varchar](255) NULL,
	[MOTA] [ntext] NULL,
	[DETAIL] [ntext] NULL,
	[DATEBEGIN] [smalldatetime] NULL,
	[META] [varchar](255) NULL,
	[ORDER] [int] NULL,
	[LINK] [nvarchar](255) NULL,
	[HIDE] [int] NULL,
 CONSTRAINT [PK_VANBAN] PRIMARY KEY CLUSTERED 
(
	[ID_VB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CAP] ON 

INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (1, N'Cấp Khoa', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (2, N'Cấp Trường', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (3, N'Cấp Thành', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (4, N'Trung Ương', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (5, N'Chưa Đạt', 2018)
SET IDENTITY_INSERT [dbo].[CAP] OFF
SET IDENTITY_INSERT [dbo].[CT_TEUCHI] ON 

INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (1, 1, N'Điểm trung bình năm học 2017 - 2018')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (4, 2, N'Tham gia ít nhất 01 hoạt động (hoặc Hội thảo) về Học thuật.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (5, 2, N'Có đề tài NCKH được Hội đồng các cấp đánh giá >= 8,0 điểm')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (6, 2, N'Có bài viết trên tạp chí các cấp.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (7, 2, N'Đạt giải trong các cuộc thi học thuật.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (8, 2, N'Có đề tài NCKH tham gia giải thưởng sinh viên NCKH Euréka hoặc tham gia giải thưởng NCKH cấp Thành/TW.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (9, 2, N'Đạt giải thưởng trong các cuộc thi ý tưởng sáng tạo từ cấp thành phố trở lên.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (10, 3, N'Đạt “Thanh niên khỏe”')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (11, 3, N'Tham gia hoạt động TDTT các cấp')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (12, 3, N'Đạt giải trong Hội thao các cấp')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (13, 3, N'Là thành viên trong các Đội tuyển.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (14, 3, N'Là thành viên đội tuyển cấp thành phố, quốc gia các môn TDTT. Ưu tiên những sinh viên là VĐV đạt huy chương trong các giải thi đấu cấp quốc gia, khu vực và quốc tế.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (15, 4, N'Đạt B1 Tiếng Anh hoặc N5 Tiếng Nhật ')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (16, 4, N'Đối với SV năm thứ 1: Điểm TB môn Ngoại ngữ năm học >= 3.0')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (17, 4, N'Ưu tiên: tham gia 01 hoạt động giao lưu quốc tế hoặc đạt giải trong cuộc thi về Ngoại ngữ các cấp ')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (18, 4, N'Tham gia ít nhất 01 hoạt động giao lưu quốc tế: Hội nghị, Hội thảo quốc tế, các chương trình gặp gỡ, giao lưu, hợp tác với thanh niên, sinh viên quốc tế trong và ngoài nước.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (19, 4, N'Tham gia và đạt giải ba trở lên các Cuộc thi kiến thức Ngoại ngữ (tìm hiểu ngoại ngữ hoặc sử dụng ngoại ngữ để trình bày) từ cấp trường trở lên.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (20, 5, N'Có tham gia hoạt động về Kỹ năng, Hội nhập, Giao lưu quốc tế')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (21, 5, N'Hoàn thành 01 khóa huấn luyện kỹ năng hoặc 03 buổi Hội thảo kỹ năng')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (22, 5, N'Tham gia và hoàn thành ít nhất 01 khóa trang bị Kỹ năng thực hành xã hội.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (23, 5, N'Được Đoàn TN - Hội SV từ cấp trường trở lên khen thưởng về thành tích xuất sắc trong công tác Đoàn và Hội.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (24, 7, N'Tham gia tích cực ít nhất 01 hoạt động về hội nhập do cấp trường trở lên tổ chức.')
SET IDENTITY_INSERT [dbo].[CT_TEUCHI] OFF
SET IDENTITY_INSERT [dbo].[DANHGIA] ON 

INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 1, 2.5, NULL, 1)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 4, 1, NULL, 2)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 5, NULL, NULL, 3)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 6, NULL, NULL, 4)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 7, NULL, NULL, 5)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 8, NULL, NULL, 6)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 9, NULL, NULL, 7)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 10, NULL, NULL, 8)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 11, NULL, NULL, 9)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 12, NULL, NULL, 10)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 13, NULL, NULL, 11)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 14, NULL, NULL, 12)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 15, NULL, NULL, 13)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 16, NULL, NULL, 14)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 17, NULL, NULL, 15)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 18, NULL, NULL, 16)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 19, NULL, NULL, 17)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 20, NULL, NULL, 18)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 21, NULL, NULL, 19)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 22, NULL, NULL, 20)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 23, NULL, NULL, 21)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (1, 24, NULL, NULL, 22)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 1, 3, NULL, 23)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 4, 1, NULL, 24)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 5, NULL, NULL, 25)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 6, NULL, NULL, 26)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 7, NULL, NULL, 27)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 8, NULL, NULL, 28)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 9, NULL, NULL, 29)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 10, NULL, NULL, 30)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 11, NULL, NULL, 31)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 12, NULL, NULL, 32)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 13, NULL, NULL, 33)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 14, NULL, NULL, 34)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 15, NULL, NULL, 35)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 16, NULL, NULL, 36)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 17, NULL, NULL, 37)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 18, NULL, NULL, 38)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 19, NULL, NULL, 39)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 20, NULL, NULL, 40)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 21, NULL, NULL, 41)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 22, NULL, NULL, 42)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 23, NULL, NULL, 43)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (2, 24, NULL, NULL, 44)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 1, 3.4, NULL, 45)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 4, 1, NULL, 46)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 5, NULL, NULL, 47)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 6, NULL, NULL, 48)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 7, NULL, NULL, 49)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 8, NULL, NULL, 50)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 9, NULL, NULL, 51)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 10, NULL, NULL, 52)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 11, NULL, NULL, 53)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 12, NULL, NULL, 54)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 13, NULL, NULL, 55)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 14, NULL, NULL, 56)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 15, NULL, NULL, 57)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 16, NULL, NULL, 58)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 17, NULL, NULL, 59)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 18, NULL, NULL, 60)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 19, NULL, NULL, 61)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 20, NULL, NULL, 62)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 21, NULL, NULL, 63)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 22, NULL, NULL, 64)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 23, NULL, NULL, 65)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (3, 24, NULL, NULL, 66)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 1, 3.4, NULL, 67)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 4, 1, NULL, 68)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 5, NULL, NULL, 69)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 6, NULL, NULL, 70)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 7, NULL, NULL, 71)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 8, NULL, NULL, 72)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 9, NULL, NULL, 73)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 10, NULL, NULL, 74)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 11, NULL, NULL, 75)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 12, NULL, NULL, 76)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 13, NULL, NULL, 77)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 14, NULL, NULL, 78)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 15, NULL, NULL, 79)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 16, NULL, NULL, 80)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 17, NULL, NULL, 81)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 18, NULL, NULL, 82)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 19, NULL, NULL, 83)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 20, NULL, NULL, 84)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 21, NULL, NULL, 85)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 22, NULL, NULL, 86)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 23, NULL, NULL, 87)
INSERT [dbo].[DANHGIA] ([ID_CAP], [ID_CTTCHI], [TCHUAN_HOCTAP], [TCHUAN_HD], [ID_DANHGIA]) VALUES (4, 24, NULL, NULL, 88)
SET IDENTITY_INSERT [dbo].[DANHGIA] OFF
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 1, 1)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 2, 1)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 3, 1)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 5, 1)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 12, NULL)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 13, 1)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 25, 1)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 47, 0)
INSERT [dbo].[DUYET_TC] ([ID_SV], [ID_DANHGIA], [DUYET]) VALUES (1, 69, 1)
SET IDENTITY_INSERT [dbo].[GIOITHIEU] ON 

INSERT [dbo].[GIOITHIEU] ([id_gt], [aboutus]) VALUES (1, N'<p><em>Tối ng&agrave;y 7/1 vừa qua, lễ kỷ niệm 68 năm Ng&agrave;y truyền thống Học sinh &ndash; Sinh vi&ecirc;n Việt Nam v&agrave; Hội Sinh vi&ecirc;n Việt Nam (9-1-1950 / 9-1-2018), tuy&ecirc;n dương sinh vi&ecirc;n đạt danh hiệu &ldquo;Sinh vi&ecirc;n 5 tốt&rdquo;, tập thể sinh vi&ecirc;n đạt danh hiệu &ldquo;Tập thể sinh vi&ecirc;n 5 tốt&rdquo; cấp Trung ương năm 2017, trao tặng Giải thưởng &ldquo;Sao Th&aacute;ng Gi&ecirc;ng&rdquo; đ&atilde; diễn ra tại Thủ đ&ocirc; H&agrave; Nội. Chương tr&igrave;nh do Trung ương Hội Sinh vi&ecirc;n Việt Nam tổ chức. V&agrave; 32 sinh vi&ecirc;n 5 tốt của Trường Đại học C&ocirc;ng nghệ TP.HCM (HUTECH) cũng đ&atilde; được vinh danh dịp n&agrave;y. </em></p>

<p style="text-align:center"><img alt="https://www.hutech.edu.vn/imgnews/homepage/stories/hinh207-faw/anh3-1515337194292-1515337308967.jpg" src="https://www.hutech.edu.vn/imgnews/homepage/stories/hinh207-faw/anh3-1515337194292-1515337308967.jpg" style="height:333px; width:500px" /></p>

<p>Đến tham dự buổi lễ, b&ecirc;n cạnh sự xuất hiện của Ph&oacute; thủ tướng Thường trực Trương H&ograve;a B&igrave;nh; Trưởng Ban Đối ngoại Trung ương Ho&agrave;ng B&igrave;nh Qu&acirc;n c&ograve;n c&oacute; đại diện c&aacute;c bộ, ban, ng&agrave;nh, đo&agrave;n thể Trung ương v&agrave; H&agrave; Nội, c&aacute;c thế hệ c&aacute;n bộ Hội Sinh vi&ecirc;n, sinh vi&ecirc;n ti&ecirc;u biểu v&agrave; tr&ecirc;n 500 sinh vi&ecirc;n th&agrave;nh phố H&agrave; Nội.<br />
<br />
Ph&aacute;t biểu tại buổi lễ, Ph&oacute; thủ tướng Thường trực Trương H&ograve;a B&igrave;nh nhấn mạnh: Trong bối cảnh thế giới đang bước v&agrave;o c&aacute;ch mạng c&ocirc;ng nghiệp lần thứ 4, Việt Nam đang hội nhập s&acirc;u rộng, đứng trước những thời cơ thuận lợi, to lớn nhưng cũng kh&ocirc;ng &iacute;t kh&oacute; khăn, th&aacute;ch thức. Hơn l&uacute;c n&agrave;o hết, vai tr&ograve; của học sinh, sinh vi&ecirc;n c&agrave;ng được khẳng định r&otilde; n&eacute;t tr&ecirc;n h&agrave;nh tr&igrave;nh s&aacute;ng tạo, đổi mới quốc gia bền vững. Với vai tr&ograve; l&agrave; lực lượng ưu t&uacute; trong giới trẻ, sinh vi&ecirc;n Việt Nam ch&iacute;nh l&agrave; nguồn nh&acirc;n lực chất lượng cao, lực lượng kế tục v&agrave; ph&aacute;t huy nguồn lực tr&iacute; tuệ dồi d&agrave;o của đất nước, đi đầu chiếm lĩnh những đỉnh cao khoa học, c&ocirc;ng nghệ, nắm bắt tri thức mới của nh&acirc;n loại trong h&agrave;nh tr&igrave;nh x&acirc;y dựng, bảo vệ Tổ quốc. Ph&oacute; thủ tướng tin tưởng rằng, phong tr&agrave;o &ldquo;Sinh vi&ecirc;n 5 tốt&rdquo; sẽ g&oacute;p phần x&acirc;y dựng nguồn nh&acirc;n lực chất lượng cao, phục vụ qu&aacute; tr&igrave;nh ph&aacute;t triển đất nước.</p>

<p style="text-align:center"><img alt="https://www.hutech.edu.vn/imgnews/homepage/stories/hinh207-faw/z873677349235_80f119388c1b6956fe671eda023bb212%20%281%29.jpg" src="https://www.hutech.edu.vn/imgnews/homepage/stories/hinh207-faw/z873677349235_80f119388c1b6956fe671eda023bb212%20%281%29.jpg" style="height:375px; width:500px" /></p>

<p>Được biết, 32 hồ sơ &ldquo;Sinh vi&ecirc;n 5 tốt&rdquo; của HUTECH đều được c&ocirc;ng nhận khi tham dự b&igrave;nh x&eacute;t &ldquo;Sinh vi&ecirc;n 5 tốt&rdquo; cấp Trung Ương. Nhiều năm qua, sự vượt bậc cả về số lượng lẫn chất lượng m&agrave; sinh vi&ecirc;n HUTECH đạt được đ&atilde; khẳng định truyền thống hoạt động v&agrave; học tập s&ocirc;i nổi ở nh&agrave; trường. Ch&iacute;nh danh hiệu n&agrave;y đ&atilde; tạo th&ecirc;m động lực để sinh vi&ecirc;n HUTECH r&egrave;n luyện v&agrave; phấn đấu nhiều hơn nữa, đem tri thức v&agrave; hiểu biết của m&igrave;nh cống hiến cho sự ph&aacute;t triển chung của x&atilde; hội, từ đ&oacute; th&agrave;nh c&ocirc;ng hơn trong qu&aacute; tr&igrave;nh lập th&acirc;n lập nghiệp.<br />
<br />
Một lần nữa, xin ch&uacute;c mừng 32 sinh vi&ecirc;n sau đ&atilde; xuất sắc đạt danh hiệu &ldquo;sinh vi&ecirc;n 5 tốt&rdquo; cấp Trung ương v&agrave; g&oacute;p phần l&agrave;m rạng danh HUTECH.</p>

<div class="youtube-embed-wrapper" style="height:0; overflow:hidden; padding-bottom:56.25%; padding-top:30px; position:relative"><iframe allowfullscreen="" frameborder="0" height="480" src="//www.youtube.com/embed/y-jJPDISGFs" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;" width="500"></iframe></div>

<p>&nbsp;</p>
')
SET IDENTITY_INSERT [dbo].[GIOITHIEU] OFF
SET IDENTITY_INSERT [dbo].[KHOAVIEN] ON 

INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (1, N'Khoa Công Nghệ Thông Tin')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (2, N'Viện Công Nghệ Cao')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (3, N'Viện Đào tạo quốc tế')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (4, N'Khoa Dược')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (5, N'Khoa Xây Dựng')
SET IDENTITY_INSERT [dbo].[KHOAVIEN] OFF
SET IDENTITY_INSERT [dbo].[LICH_HOATDONG] ON 

INSERT [dbo].[LICH_HOATDONG] ([ID_HD], [TITLE], [DATEBEGIN], [ĐỊA ĐIỂM], [ORDER], [HIDE]) VALUES (1, N'NGÀY HỘI SÁNG TẠO HUTECH 2018', CAST(N'2018-02-09T00:00:00' AS SmallDateTime), N'Trụ sở chính 475A Điện Biên Phủ', 1, 0)
INSERT [dbo].[LICH_HOATDONG] ([ID_HD], [TITLE], [DATEBEGIN], [ĐỊA ĐIỂM], [ORDER], [HIDE]) VALUES (2, N'NGÀY HỘI SÁNG TẠO HUTECH 2018', CAST(N'2018-02-09T00:00:00' AS SmallDateTime), N'Trụ sở chính 475A Điện Biên Phủ', 2, 0)
SET IDENTITY_INSERT [dbo].[LICH_HOATDONG] OFF
SET IDENTITY_INSERT [dbo].[LOAITIEUCHI] ON 

INSERT [dbo].[LOAITIEUCHI] ([ID_LTCHI], [TEN_LTCHI], [NAM]) VALUES (1, N'HỌC TẬP TỐT', 2018)
INSERT [dbo].[LOAITIEUCHI] ([ID_LTCHI], [TEN_LTCHI], [NAM]) VALUES (2, N'THỂ LỰC TỐT', 2018)
INSERT [dbo].[LOAITIEUCHI] ([ID_LTCHI], [TEN_LTCHI], [NAM]) VALUES (3, N'HỘI NHẬP TỐT', 2018)
INSERT [dbo].[LOAITIEUCHI] ([ID_LTCHI], [TEN_LTCHI], [NAM]) VALUES (4, N'TÌNH NGUYỆN TỐT', 2018)
INSERT [dbo].[LOAITIEUCHI] ([ID_LTCHI], [TEN_LTCHI], [NAM]) VALUES (5, N'ĐẠO ĐỨC TỐT', 2018)
INSERT [dbo].[LOAITIEUCHI] ([ID_LTCHI], [TEN_LTCHI], [NAM]) VALUES (6, N'ƯU TIÊN', 2018)
SET IDENTITY_INSERT [dbo].[LOAITIEUCHI] OFF
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([ID_MENU], [TITLE], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (1, N'Trang chủ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'trang-chu', 1, N'#', 0)
INSERT [dbo].[MENU] ([ID_MENU], [TITLE], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (2, N'Thông báo', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'thong-bao', 2, N'#', 0)
INSERT [dbo].[MENU] ([ID_MENU], [TITLE], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (3, N'Hoạt động', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'hoat-dong', 3, N'#', 0)
INSERT [dbo].[MENU] ([ID_MENU], [TITLE], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (4, N'Liên hệ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'lien-he', 4, N'#', 0)
INSERT [dbo].[MENU] ([ID_MENU], [TITLE], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (5, N'Tin tức', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'tin-tuc', 5, N'#', 1)
INSERT [dbo].[MENU] ([ID_MENU], [TITLE], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (6, N'Văn bản', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'van-ban', 6, N'#', 1)
INSERT [dbo].[MENU] ([ID_MENU], [TITLE], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (7, N'Giới thiệu', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'gioi-thieu', 7, N'#', 1)
SET IDENTITY_INSERT [dbo].[MENU] OFF
INSERT [dbo].[MINHCHUNG] ([ID_SV], [ID_CTTCHI], [URL], [DUYET], [MOTA], [HINHANH]) VALUES (1, 1, NULL, NULL, NULL, N'hutech_logo.png')
INSERT [dbo].[MINHCHUNG] ([ID_SV], [ID_CTTCHI], [URL], [DUYET], [MOTA], [HINHANH]) VALUES (1, 4, NULL, NULL, NULL, N'pic01.jpg')
INSERT [dbo].[MINHCHUNG] ([ID_SV], [ID_CTTCHI], [URL], [DUYET], [MOTA], [HINHANH]) VALUES (1, 5, NULL, NULL, NULL, N'hutech_logo.png')
INSERT [dbo].[MINHCHUNG] ([ID_SV], [ID_CTTCHI], [URL], [DUYET], [MOTA], [HINHANH]) VALUES (1, 6, NULL, NULL, NULL, N'hutech.jpg')
INSERT [dbo].[MINHCHUNG] ([ID_SV], [ID_CTTCHI], [URL], [DUYET], [MOTA], [HINHANH]) VALUES (1, 7, NULL, NULL, NULL, N'hutech_logo.png')
INSERT [dbo].[MINHCHUNG] ([ID_SV], [ID_CTTCHI], [URL], [DUYET], [MOTA], [HINHANH]) VALUES (1, 8, NULL, NULL, NULL, N'hutech_logo.png')
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] ON 

INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [TENND], [MK], [PQ], [XNMK]) VALUES (2, N'admin', N'Lâm Thành Long', N'a66abb5684c45962d887564f8346e8d', 1, NULL)
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [TENND], [MK], [PQ], [XNMK]) VALUES (4, N'thanhhuong', N'Thanh Hương', N'44132a20748afd93813dc4b0db9cb3', 0, NULL)
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [TENND], [MK], [PQ], [XNMK]) VALUES (5, N'hoangtien', N'Hoàng Tiến', N'44132a20748afd93813dc4b0db9cb3', 0, NULL)
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [TENND], [MK], [PQ], [XNMK]) VALUES (6, N'lamlong70', N'Lâm Thành', N'44132a20748afd93813dc4b0db9cb3', 0, NULL)
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] OFF
SET IDENTITY_INSERT [dbo].[SINHVIEN] ON 

INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (1, N'Lâm Thành Long', N'15DTH03', N'Long Khánh - Đồng Nai', N'lamthanhlong70@gmail.com', N'0966987120', 1, N'6ae2fed96f6541b760fd7cd1c383426', 1511060539, 1)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (4, N'Long Lam', N'15DTH04', N'Tp Hồ Chí Minh', N'lamthanhlong70@gmail.com', N'0966987121', 2, N'14c6bfa7b6872695914e888b5cca1951', 1511060540, 1)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (5, N'Phạm Võ Ngọc Thùy', N'15DTH04', N'Tp Hồ Chí Minh', N'ngocthuy@gmail.com', N'0125874956', 1, N'6ae2fed96f6541b760fd7cd1c383426', 1511062456, 5)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (6, N'Lầu Sẹc Dần', N'15DTH03', N'Đồng Nai', N'lausecdan@gmail.com', N'0135694821', 1, N'6ae2fed96f6541b760fd7cd1c383426', 1511020604, 5)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (7, N'Phạm Quốc Quân', N'15DTH03', N'Tp Hồ Chí Minh', N'quanpham@gmail.com', N'0125489632', 1, N'6ae2fed96f6541b760fd7cd1c383426', 1511012345, 5)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (8, N'Tạ Chống Long', N'15DTH06', N'Trảng Bom', N'longta@gmail.com', N'0956412589', 2, N'6ae2fed96f6541b760fd7cd1c383426', 1511023648, 3)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (9, N'Trần Quảng Phi', N'15DTH11', N'Tp Hồ Chí Minh', N'phiquang@gmail.com', N'0912356987', 3, N'6ae2fed96f6541b760fd7cd1c383426', 1511060532, 3)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (10, N'Võ Hồng Linh Ân', N'15DTH07', N'Tp Hồ Chí Minh', N'linhan@gmail.com', N'0145987621', 1, N'6ae2fed96f6541b760fd7cd1c383426', 1511060424, 2)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (11, N'Nguyễn Quốc Bình', N'15DTH05', N'Tp Hồ Chí Minh', N'nguyenquocbinh@gmail.com', N'0125965422', 3, N'6ae2fed96f6541b760fd7cd1c383426', 1511060171, 4)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (13, N'Thòng Chắn Pẩu', N'15DTH02', N'Trảng Bom', N'pau@gmail.com', N'0124562113', 2, N'6ae2fed96f6541b760fd7cd1c383426', 1511060242, 3)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (14, N'Trần Danh Đạt', N'15DTH11', N'Hà Tiên', N'datdanh@gmail.com', N'0985125623', 2, N'6ae2fed96f6541b760fd7cd1c383426', 1511060521, 2)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (15, N'Lê Phú Hưng', N'15DTH05', N'Móng Cái', N'hungphu@gmail.com', N'0152364893', 4, N'6ae2fed96f6541b760fd7cd1c383426', 1511020156, 1)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (16, N'Đinh Văn Dũng', N'15DTH07', N'Nghệ An', N'dungvan@gmail.com', N'0123546213', 4, N'6ae2fed96f6541b760fd7cd1c383426', 1511203682, 4)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (17, N'Trần Thanh Phong', N'15DTH06', N'Hà Nội', N'phongthanh@gmail.com', N'0124587152', 5, N'6ae2fed96f6541b760fd7cd1c383426', 1511021230, 1)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (18, N'Đào Duy Khánh', N'15DTH08', N'Lào Cai', N'khanhdao@gmail.com', N'0124589651', 5, N'6ae2fed96f6541b760fd7cd1c383426', 1511020630, 5)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (19, N'Ngô Thống Lĩnh', N'15DTH11', N'Cà Mau', N'linhngo@gmail.com', N'0954126523', 4, N'6ae2fed96f6541b760fd7cd1c383426', 1511020199, 5)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (20, N'Lê Thanh Hương', N'15DTH08', N'Hà Nội', N'huongthanh@gmail.com', N'0968453652', 5, N'6ae2fed96f6541b760fd7cd1c383426', 1511041892, 2)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (21, N'Nguyễn Văn Hào', N'15DTH03', N'Nghệ An', N'haovan@gmail.com', N'0123498265', 4, N'6ae2fed96f6541b760fd7cd1c383426', 1511020163, 3)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (22, N'Nguyễn Phúc Thịnh', N'15DTH05', N'Bình Dương', N'thinhphuc@gmail.com', N'0965236482', 2, N'6ae2fed96f6541b760fd7cd1c383426', 1511026982, 1)
INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (23, N'Nguyễn Ngọc Phúc', N'15DTH07', N'Đồng Nai', N'phucnguyen@gmail.com', N'0985623641', 1, N'6ae2fed96f6541b760fd7cd1c383426', 1511021694, 1)
SET IDENTITY_INSERT [dbo].[SINHVIEN] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([ID_SLIDE], [TITLE], [IMG], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (11, NULL, N'11-06-18-11-29-44banner_1.jpg', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Slider] ([ID_SLIDE], [TITLE], [IMG], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (12, NULL, N'banner_2.png', CAST(N'2018-06-11T00:00:00' AS SmallDateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Slider] ([ID_SLIDE], [TITLE], [IMG], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (13, NULL, N'banner_3.png', CAST(N'2018-06-11T00:00:00' AS SmallDateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[TIEUCHI] ON 

INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (1, N'Bắt buộc - Học Tập', 1)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (2, N'Yêu cầu khác', 1)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (3, N'Đạt 1 trong các tiêu chuẩn sau', 2)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (4, N'Về ngoại ngữ', 3)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (5, N'Về kỹ năng', 3)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (7, N'Về hoạt động hội nhập', 3)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (8, N'Đạt 1 trong các tiêu chuẩn sau', 4)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (9, N'Tiêu chuẩn bắt buộc (Cho cấp thành/trung ương)', 4)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (10, N'Bắt buộc', 5)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (11, N'Yêu cầu khác', 5)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (13, N'Các tiêu chuẩn sau', 6)
SET IDENTITY_INSERT [dbo].[TIEUCHI] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (1, N'Khóa học Kỹ năng SV5T - Danh sách và Thời khóa biểu', NULL, N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'<p>KH&Oacute;A HỌC &quot;KỸ NĂNG L&Agrave;M VIỆC NH&Oacute;M&quot;</p>

<p>Lớp 01 (danh s&aacute;ch đ&iacute;nh k&egrave;m):</p>

<p>- Giảng vi&ecirc;n: Chế Dạ Thảo- Thời gian học: 18g00 Thứ 3 (17/04) v&agrave; 07g00 Chủ nhật (22/04) tại B-12.02</p>

<p>Lớp 02 (danh s&aacute;ch đ&iacute;nh k&egrave;m):</p>

<p>- Giảng vi&ecirc;n: Đỗ Tất Thi&ecirc;n- Thời gian học: 18g00 Thứ 3 (17/04) v&agrave; 07g00 Chủ nhật (22/04) tại B-12.03</p>

<p>* Mọi chi tiết thắc mắc xin li&ecirc;n hệ:Đ.c Nguyễn Gia Huy - Ph&oacute; B&iacute; thư Đo&agrave;n trường (SĐT: 0918.953.840)</p>
', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'khoa-hoc-ky-nang-sv5t-danh-sach-va-thoi-khoa-bieu', 1, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (2, N'Sinh viên HUTECH chiến thắng cuộc thi “Công nghệ sinh học - Hành trình đến tương lai” lần III - 2018', N'2.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Kịch tính, hào hứng và quyết liệt - đó chính là những gì mà các ban giám khảo, các khách mời, các đội dự thi cũng như các cổ động viên nhận định về vòng Chung kết cuộc thi “Công nghệ sinh học - Hành trình đến tương lai” - lần III năm 2018 diễn ra sáng 22/04 vừa qua.', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'sinh-vien-hutech-chien-thang-cuoc-thi-cong-nghe-sinh-hoc-hanh-trinh-den-tuong-lai-lan-iii-2018', 2, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (3, N'Các bước triển khai một đề tài nghiên cứu khoa học', N'4.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Có thể hình dung một lộ trình thực hiện như sau:
1. Lựa chọn đề tài
2. Lập kế hoạch thực hiện
3. Đặt vấn đề, xây dựng giả thuyết
4. Thu thập số liệu, xử lí thông tin
5. Viết báo cáo kết quả nghiên cứu', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'cac-buoc-trien-khai-mot-de-tai-nghien-cuu-khoa-hoc-', 3, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (4, N'Những gương sáng Sinh viên trong Nghiên cứu khoa học', N'3.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'NULLDiễn ra từ ngày 15/10 đến ngày 26/10/2013, Vòng bán kết Giải thưởng sinh viên nghiên cứu Khoa học – Euréka 2013 đã chính thức công bố danh sách các đề tài xuất sắc nhất lọt vào Vòng chung kết của Euréka 2013. Theo đó, năm nay Đại học Công nghệ TP.HCM (HUTECH) đạt được thành tích đáng ghi nhận khi vượt qua hàng loạt các Đại học lớn của TP.HCM trở thành một trong 4 đại học có số lượng đề tài nhiều nhất vào Vòng Chung kết của sân chơi học thuật uy tín này. Sáng 17/11, các bạn đã có buổi báo cáo bảo vệ các công trình khoa học do mình thực hiện trước các chuyên gia đầu ngành của Thành phố.', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'nhung-guong-sang-sinh-vien-trong-nghien-cuu-khoa-hoc', 4, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (5, N'Sinh viên Luật Đại học HUTECH tìm hiểu về tranh chấp và giải quyết tranh chấp', N'5.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Sáng nay (03/05), tại Trụ sở Điện Biên Phủ trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã diễn ra Hội thảo khoa học “Tranh chấp và giải quyết các tranh chấp hành chính, dân sự, kinh tế” nhằm nâng cao hơn nữa hiệu quả tiếp thu kiến thức chuyên ngành cho các bạn sinh viên. ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'sinh-vien-luat-dai-hoc-hutech-tim-hieu-ve-tranh-chap-va-giai-quyet-tranh-chap', 5, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (6, N'Thời gian tổ chức Hội thi báo cáo mô hình, giải pháp thực hiện phần việc "Làm theo lời Bác"', N'6.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Đoàn trường ĐH Công Nghệ TP. HCM (HUTECH) thông báo đến các bạn đoàn viên, sinh viên LỊCH TỔ CHỨC & DANH SÁCH DỰ THI của Hội thi Báo cáo mô hình, giải pháp thực hiện phần việc "Làm theo lời Bác" năm học 2017 - 2018 theo file đính kèm bên dưới.
LƯU Ý:
- Địa điểm báo cáo: Phòng A04.30 (Cơ sở Điện Biên Phủ)
- Mỗi thí sinh dự thi có từ 4 - 5 phút để trình bày và trao đổi với Hội đồng thẩm định.
- Thí sinh dự thi vui lòng tự chuẩn bị 3 bản báo cáo để gửi Hội đồng thẩm định.
- Thí sinh có chuẩn bị slide trình chiếu vui lòng có mặt trước 15 phút và liên hệ với bộ phận Kỹ thuật - Âm thanh để được hỗ trợ.
Mọi vấn đề xin liên hệ trực tiếp: VĂN PHÒNG ĐOÀN THANH NIÊN - HỘI SINH VIÊN
Email: doanthanhnien@hutech.edu.vn
Mobile: (028) 3512.0293', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'thoi-gian-to-chuc-hoi-thi-bao-cao-mo-hinh-giai-phap-thuc-hien-phan-viec-lam-theo-loi-bac', 6, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (7, N'Thông báo V/v KIỂM TRA CÁC CƠ SỞ ĐOÀN NĂM HỌC 2017 - 2018 (cập nhật)', N'2.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Nhằm nắm bắt tình hình công tác Đoàn và phong trào thanh niên của các đơn vị Đoàn cơ sở trực thuộc Đoàn Trường và thực hiện tiền đề công tác Đánh giá xếp loại Cán bộ Đoàn trong năm học 2017 – 2018, qua đó kịp thời định hướng cho những hoạt động trong thời gian tới. Ủy Ban kiểm tra Đoàn trường thông báo Kiểm tra công tác các cơ sở Đoàn năm học 2017 – 2018:', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'thong-bao-doan-thanh-nien-nam-2017-2018/14569854-thong-bao-vv-kiem-tra-cac-co-so-doan-nam-hoc-2017-2018', 7, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (8, N'Lộ diện 4 đội xuất sắc tranh chung kết “Công nghệ sinh học - Hành trình đến tương lai” năm 2018', N'3.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Ngày 08/4, Viện Khoa học ứng dụng Trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã tổ chức vòng Bán kết cuộc thi học thuật “Công nghệ sinh học - Hành trình đến tương lai” lần III năm 2018 với sự góp mặt của 16 đội thi đến từ 6 trường Đại học ở khu vực phía Nam.

Tham dự chương trình có TS. Hồ Viết Thế - Trưởng ngành SĐH CNSH Trường ĐH Công nghiệp Thực phẩm TP.HCM, ThS. Lâm Vỹ Nguyên – Trưởng phòng Quản lý Khoa học – Hợp tác Quốc tế, Trung tâm CNSH TP.HCM, ThS. Lâm Vĩnh Sơn - Phó Viện trưởng Viện KHƯD HUTECH, TS. Nguyễn Hoài Hương - Chủ nhiệm ngành CNSH Viện KHƯD HUTECH, cùng rất đông thầy cô các phòng, ban, khoa viện các trường và hơn 200 sinh đến cổ vũ cho 16 đội thi.
 ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'lo-dien-4-doi-xuat-sac-tranh-chung-ket-cong-nghe-sinh-hoc-hanh-trinh-den-tuong-lai-nam-2018', 8, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (9, N'Đã tìm ra nhà vô địch của Cuộc thi Olympic Pháp luật lần III năm 2018', N'5.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Sáng 07/4, tại Hội trường A-08.20, Trường Đại học Công nghệ TP.HCM (Đại học HUTECH), Vòng chung kết của cuộc thi Olympic Pháp luật lần III năm 2018 do Khoa luật tổ chức đã diễn ra với những phần thi kịch tính và những tình huống pháp lý sinh động, mang tính thời sự mới mẻ. 

 
Đến tham dự chương trình có TS. Bành Quốc Tuấn - Phó Trưởng khoa Luật, ông Phạm Hồng Khải - Viện Kiểm sát Tòa án Nhân dân TP.HCM, ông Phan Huỳnh Hoàng Phương - Thẩm phán Tòa án Nhân dân quận Tân Phú. Ngoài ra, còn có quý thầy cô đến từ các trường và hơn 200 sinh viên đến cổ vũ cho các đội thi.
 ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'da-tim-ra-nha-vo-dich-cua-cuoc-thi-olympic-phap-luat-lan-iii-nam-2018', 9, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (10, N'Tưng bừng Ngày hội xuống nước của sinh viên khoa Dược', N'7.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Vừa qua, các bạn sinh viên khoa Dược - trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã có một buổi sinh hoạt ngoại khóa sôi nổi và thiết thực với Ngày hội xuống nước. 
 
Ngày hội do CLB Kỹ năng khoa Dược tổ chức tại Hồ bơi Yết Kiêu (Số 1 Nguyễn Thị Minh Khai, P. Bến Nghé, Q.1, TP.HCM). Đây là hoạt động truyền thống của CLB Kỹ năng Khoa Dược, hướng đến kiểm tra kỹ năng bơi lội, qua đó góp phần phòng chống đuối nước và khuyến khích tinh thần rèn luyện sức khỏe ở các Dược sĩ tương lai.
 ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'tung-bung-ngay-hoi-xuong-nuoc-cua-sinh-vien-khoa-duoc', 10, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (11, N'Thông báo tiếp nhận hồ sơ Học bổng "Thắp sáng ước mơ tuổi trẻ HUTECH" năm học 2017 - 2018', N'2.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Nhằm giúp đỡ, hỗ trợ và động viên tinh thần học tập cho các bạn đoàn viên, sinh viên có hoàn cảnh đặc biệt khó khăn và đạt thành tích tốt trong học tập và rèn luyện, Ban Thường vụ Đoàn trường ĐH Công Nghệ TP.HCM tổ chức trao Học bổng “Thắp sáng ước mơ tuổi trẻ HUTECH” năm học 2017 – 2018, cụ thể như sau:
1. Đối tượng – Tiêu chuẩn:
- Là sinh viên hệ chính quy trường ĐH Công Nghệ TP.HCM có hoàn cảnh gia đình khó khăn (gia đình thuộc diện hộ nghèo/cận nghèo, gia đình chính sách, mồ côi cha hoặc mẹ, …) 
- Điểm rèn luyện học kì gần nhất đạt từ 80 trở lên. Ưu tiên đoàn viên, sinh viên tham gia tích cực các hoạt động Đoàn – Hội.
- Điểm trung bình học kì 1 năm học 2017 – 2018 (hoặc điểm trung bình tích lũy) đạt từ 2.5/4 trở lên. 
- Chưa nhận học bổng xã hội trong năm 2017.
2. Hồ sơ học bổng bao gồm:
- Thư đề đạt nguyện vọng có xác nhận của Đoàn khoa/viện (hoặc Liên Chi hội khoa/viện) theo mẫu đính kèm..
- Giấy xác nhận gia đình khó khăn, gia đình chính sách, giấy chứng nhận hộ nghèo/cận nghèo (bản công chứng có xác nhận của địa phương). (Nếu có)
- Giấy chứng tử của cha mẹ hoặc đơn xác nhận mồ côi cha do chính quyền địa phương xác nhận. (Nếu có)
- Bản sao thẻ sinh viên và chứng minh nhân dân (không cần công chứng).
- Bảng điểm (do phòng Đào tạo – Khảo thí cấp).
3. Thời gian nộp hồ sơ: 
Từ ngày ra thông báo đến hết ngày 20/03/2018.
4. Nơi nộp hồ sơ và hỗ trợ tư vấn:
Văn phòng Đoàn Thanh niên – Hội Sinh viên trường
475A Điện Biên Phủ, phường 25, quận Bình Thạnh
Điện thoại: 028. 3512 0293', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'thong-bao-tiep-nhan-ho-so-hoc-bong-thap-sang-uoc-mo-tuoi-tre-hutech-nam-hoc-2017-2018', 11, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (12, N'Sinh viên Nhật Bản học – Đại học HUTECH tôn vinh nét đẹp phụ nữ Việt qua những nét vẽ', N'1.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'Sáng nay (07/3/2018), cộng đồng sinh viên Trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã có dịp chiêm ngưỡng 20 bức vẽ đẹp nhất về hình ảnh người phụ nữ Việt Nam do chính sinh viên Khoa Nhật Bản học của Trường thực hiện.', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'sinh-vien-nhat-ban-hoc-dai-hoc-hutech-ton-vinh-net-dep-phu-nu-viet-qua-nhung-net-ve', 12, N'#', 0)
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
SET IDENTITY_INSERT [dbo].[VANBAN] ON 

INSERT [dbo].[VANBAN] ([ID_VB], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (1, N'Phiếu đăng ký phong trào "Sinh Viên 5 Tốt" 2017 - 2018', N'7.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'<p>aaaaaaaaaaaaaaaa</p>
', CAST(N'2018-05-24T00:00:00' AS SmallDateTime), N'phieu-dang-ky-phong-trao-sinh-vien-5-tot-2017-2018', 1, N'#', 0)
INSERT [dbo].[VANBAN] ([ID_VB], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (2, N'[Mẫu] Khai Thành tích SINH VIÊN 5 TỐT Cấp Thành, Trung Ương', N'6.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'<p>HO&Agrave;N TH&Agrave;NH BỘ HỒ SƠ X&Eacute;T CHỌN: 1. Bảng Khai th&agrave;nh t&iacute;ch c&aacute; nh&acirc;n (file đ&iacute;nh k&egrave;m) 2. C&aacute;c Minh chứng k&egrave;m theo (t&iacute;nh đến thời điểm hiện tại) NỘP TRỰC TIẾP TẠI VĂN PH&Ograve;NG ĐO&Agrave;N TN - HỘI SV A. GIA HUY: 0918.953.840</p>
', CAST(N'2018-05-24T00:00:00' AS SmallDateTime), N'mau-khai-thanh-tich-sinh-vien-5-tot-cap-thanh-trung-uong', 2, N'#', 0)
INSERT [dbo].[VANBAN] ([ID_VB], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (3, N'Khóa học Kỹ năng SV5T - Danh sách và Thời khóa biểu', N'2.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'HOÀN THÀNH BỘ HỒ SƠ XÉKHÓA HỌC "KỸ NĂNG LÀM VIỆC NHÓM"
Lớp 01 (danh sách đính kèm):
- Giảng viên: Chế Dạ Thảo
- Thời gian học: 18g00 Thứ 3 (17/04) và 07g00 Chủ nhật (22/04) tại B-12.02
Lớp 02 (danh sách đính kèm):
- Giảng viên: Đỗ Tất Thiên
- Thời gian học: 18g00 Thứ 3 (17/04) và 07g00 Chủ nhật (22/04) tại B-12.03
* Mọi chi tiết thắc mắc xin liên hệ:
Đ.c Nguyễn Gia Huy - Phó Bí thư Đoàn trường (SĐT: 0918.953.840)T CHỌN:', CAST(N'2018-05-24T00:00:00' AS SmallDateTime), N'khoa-hoc-ky-nang-sv5t-danh-sach-va-thoi-khoa-bieu', 3, N'#', 0)
INSERT [dbo].[VANBAN] ([ID_VB], [TITLE], [IMG], [MOTA], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (4, N'Tiêu chuẩn xét chọn danh hiệu "Sinh viên 5 tốt" Cấp Trường - Thành - TW', N'3.jpg', N'Hội đồng tuyển sinh Trường Đại học Công nghệ TP.HCM (HUTECH) ', N'MỌI CHI TIẾT THẮC MẮC XIN LIÊN HỆ:
* Đ/c Nguyễn Gia Huy - Phó Bí thư Đoàn trường (0918.953.840)', CAST(N'2018-05-24T00:00:00' AS SmallDateTime), N'tieu-chuan-xet-chon-danh-hieu-sinh-vien-5-tot-cap-truong-thanh-tw', 4, N'#', 0)
SET IDENTITY_INSERT [dbo].[VANBAN] OFF
ALTER TABLE [dbo].[CT_TEUCHI]  WITH CHECK ADD FOREIGN KEY([ID_TCHI])
REFERENCES [dbo].[TIEUCHI] ([ID_TCHI])
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD FOREIGN KEY([ID_CAP])
REFERENCES [dbo].[CAP] ([ID_CAP])
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD FOREIGN KEY([ID_CTTCHI])
REFERENCES [dbo].[CT_TEUCHI] ([ID_CTTCHI])
GO
ALTER TABLE [dbo].[DUYET_TC]  WITH CHECK ADD  CONSTRAINT [FK_DUYET_TC_DANHGIA] FOREIGN KEY([ID_DANHGIA])
REFERENCES [dbo].[DANHGIA] ([ID_DANHGIA])
GO
ALTER TABLE [dbo].[DUYET_TC] CHECK CONSTRAINT [FK_DUYET_TC_DANHGIA]
GO
ALTER TABLE [dbo].[DUYET_TC]  WITH CHECK ADD  CONSTRAINT [FK_DUYET_TC_SINHVIEN] FOREIGN KEY([ID_SV])
REFERENCES [dbo].[SINHVIEN] ([ID_SV])
GO
ALTER TABLE [dbo].[DUYET_TC] CHECK CONSTRAINT [FK_DUYET_TC_SINHVIEN]
GO
ALTER TABLE [dbo].[MINHCHUNG]  WITH CHECK ADD FOREIGN KEY([ID_CTTCHI])
REFERENCES [dbo].[CT_TEUCHI] ([ID_CTTCHI])
GO
ALTER TABLE [dbo].[MINHCHUNG]  WITH CHECK ADD FOREIGN KEY([ID_SV])
REFERENCES [dbo].[SINHVIEN] ([ID_SV])
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD FOREIGN KEY([ID_KV])
REFERENCES [dbo].[KHOAVIEN] ([ID_KV])
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_CAP] FOREIGN KEY([ID_CAP])
REFERENCES [dbo].[CAP] ([ID_CAP])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_CAP]
GO
ALTER TABLE [dbo].[TIEUCHI]  WITH CHECK ADD FOREIGN KEY([ID_LTCHI])
REFERENCES [dbo].[LOAITIEUCHI] ([ID_LTCHI])
GO
USE [master]
GO
ALTER DATABASE [TEST_MOI_DACS_SV5T] SET  READ_WRITE 
GO
