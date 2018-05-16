USE [master]
GO
/****** Object:  Database [TEST_MOI_DACS_SV5T]    Script Date: 5/16/2018 12:06:07 PM ******/
CREATE DATABASE [TEST_MOI_DACS_SV5T]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST_MOI_DACS_SV5T', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TEST_MOI_DACS_SV5T.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[CAP]    Script Date: 5/16/2018 12:06:07 PM ******/
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
/****** Object:  Table [dbo].[CT_TEUCHI]    Script Date: 5/16/2018 12:06:07 PM ******/
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
/****** Object:  Table [dbo].[DANHGIA]    Script Date: 5/16/2018 12:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIA](
	[ID_CAP] [int] NOT NULL,
	[ID_CTTCHI] [int] NOT NULL,
	[TCHUAN_HOCTAP] [float] NULL,
	[TCHUAN_HD] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CAP] ASC,
	[ID_CTTCHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOAVIEN]    Script Date: 5/16/2018 12:06:08 PM ******/
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
/****** Object:  Table [dbo].[LOAITIEUCHI]    Script Date: 5/16/2018 12:06:08 PM ******/
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
/****** Object:  Table [dbo].[MENU]    Script Date: 5/16/2018 12:06:08 PM ******/
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
/****** Object:  Table [dbo].[MINHCHUNG]    Script Date: 5/16/2018 12:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MINHCHUNG](
	[ID_SV] [int] NOT NULL,
	[ID_CTTCHI] [int] NOT NULL,
	[TCHUAN_HOCTAP] [float] NULL,
	[TCHUAN_HD] [bit] NULL,
	[URL] [nvarchar](255) NULL,
	[DUYET] [bit] NULL,
	[MOTA] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SV] ASC,
	[ID_CTTCHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 5/16/2018 12:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[ID_ND] [int] IDENTITY(1,1) NOT NULL,
	[TENDN] [varchar](255) NULL,
	[MK] [varchar](20) NULL,
	[TENND] [nvarchar](255) NULL,
	[PQ] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 5/16/2018 12:06:08 PM ******/
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
/****** Object:  Table [dbo].[TIEUCHI]    Script Date: 5/16/2018 12:06:08 PM ******/
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
/****** Object:  Table [dbo].[TINTUC]    Script Date: 5/16/2018 12:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[ID_TT] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](255) NULL,
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
SET IDENTITY_INSERT [dbo].[CAP] ON 

INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (1, N'Cấp KHOA/VIỆN', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (2, N'Cấp TRƯỜNG', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (3, N'Cấp THÀNH ', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (4, N'Cấp TRUNG ƯƠNG', 2018)
INSERT [dbo].[CAP] ([ID_CAP], [TEN_CAP], [NAM]) VALUES (5, N'Chưa Đạt', 2018)
SET IDENTITY_INSERT [dbo].[CAP] OFF
SET IDENTITY_INSERT [dbo].[CT_TEUCHI] ON 

INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (1, 1, N'Điểm năm học >=2.5/4 hoặc >=6.3/10')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (2, 1, N'Điểm năm học >=3.0/4 hoặc >=7.5/10 ')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (3, 1, N'Điểm trung bình cả năm học >=8,5/10 (niên chế) hoặc >= 3,4/4 (tín chỉ). ')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (4, 1, N'Tham gia ít nhất 01 hoạt động (hoặc Hội thảo) về Học thuật.')
INSERT [dbo].[CT_TEUCHI] ([ID_CTTCHI], [ID_TCHI], [NOIDUNG]) VALUES (5, 1, N'Có đề tài NCKH được Hội đồng các cấp đánh giá >= 8,0 điểm')
SET IDENTITY_INSERT [dbo].[CT_TEUCHI] OFF
SET IDENTITY_INSERT [dbo].[KHOAVIEN] ON 

INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (1, N'Khoa Công Nghệ Thông Tin')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (2, N'Viện Công Nghệ Cao')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (3, N'Viện Đào tạo quốc tế')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (4, N'Khoa Dược')
INSERT [dbo].[KHOAVIEN] ([ID_KV], [TEN_KV]) VALUES (5, N'Khoa Xây Dựng')
SET IDENTITY_INSERT [dbo].[KHOAVIEN] OFF
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
SET IDENTITY_INSERT [dbo].[MENU] OFF
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] ON 

INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [MK], [TENND], [PQ]) VALUES (1, N'root', N'123456', N'root', 1)
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [MK], [TENND], [PQ]) VALUES (2, N'admin', N'123456', N'admin', 1)
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [MK], [TENND], [PQ]) VALUES (3, N'ngocthuy', N'123456', N'Ngọc Thuỳ', 2)
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [MK], [TENND], [PQ]) VALUES (4, N'thanhhuong', N'123456', N'Thanh Hương', 2)
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [TENDN], [MK], [TENND], [PQ]) VALUES (5, N'hoangtien', N'123456', N'Hoàng Tiến', 2)
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] OFF
SET IDENTITY_INSERT [dbo].[SINHVIEN] ON 

INSERT [dbo].[SINHVIEN] ([ID_SV], [TEN_SV], [LOP], [DIACHI], [EMAIL], [SDT], [ID_KV], [PASSWORD], [MSSV], [ID_CAP]) VALUES (1, N'Lâm Thành Long', N'15DTH03', N'Long Khánh - Đồng Nai', N'lamthanhlong70@gmail.com', N'0966987120', 1, N'19a04e1cc4d7c87f6595b3761b64a14f', 1511060539, 5)
SET IDENTITY_INSERT [dbo].[SINHVIEN] OFF
SET IDENTITY_INSERT [dbo].[TIEUCHI] ON 

INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (1, N'Điểm học tập', 1)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (2, N'Yêu cầu khác', 1)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (3, N'Thanh niên khỏe', 2)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (4, N'Thể dục thể thao', 2)
INSERT [dbo].[TIEUCHI] ([ID_TCHI], [TEN_TCHI], [ID_LTCHI]) VALUES (5, N'Đội tuyển', 2)
SET IDENTITY_INSERT [dbo].[TIEUCHI] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (1, N'Khóa học Kỹ năng SV5T - Danh sách và Thời khóa biểu', N'KHÓA HỌC "KỸ NĂNG LÀM VIỆC NHÓM"
Lớp 01 (danh sách đính kèm):
- Giảng viên: Chế Dạ Thảo
- Thời gian học: 18g00 Thứ 3 (17/04) và 07g00 Chủ nhật (22/04) tại B-12.02
Lớp 02 (danh sách đính kèm):
- Giảng viên: Đỗ Tất Thiên
- Thời gian học: 18g00 Thứ 3 (17/04) và 07g00 Chủ nhật (22/04) tại B-12.03
* Mọi chi tiết thắc mắc xin liên hệ:
Đ.c Nguyễn Gia Huy - Phó Bí thư Đoàn trường (SĐT: 0918.953.840)', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'khoa-hoc-ky-nang-sv5t-danh-sach-va-thoi-khoa-bieu', 1, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (2, N'Sinh viên HUTECH chiến thắng cuộc thi “Công nghệ sinh học - Hành trình đến tương lai” lần III - 2018', N'Kịch tính, hào hứng và quyết liệt - đó chính là những gì mà các ban giám khảo, các khách mời, các đội dự thi cũng như các cổ động viên nhận định về vòng Chung kết cuộc thi “Công nghệ sinh học - Hành trình đến tương lai” - lần III năm 2018 diễn ra sáng 22/04 vừa qua.', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'sinh-vien-hutech-chien-thang-cuoc-thi-cong-nghe-sinh-hoc-hanh-trinh-den-tuong-lai-lan-iii-2018', 2, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (3, N'Các bước triển khai một đề tài nghiên cứu khoa học', N'Có thể hình dung một lộ trình thực hiện như sau:
1. Lựa chọn đề tài
2. Lập kế hoạch thực hiện
3. Đặt vấn đề, xây dựng giả thuyết
4. Thu thập số liệu, xử lí thông tin
5. Viết báo cáo kết quả nghiên cứu', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'cac-buoc-trien-khai-mot-de-tai-nghien-cuu-khoa-hoc-', 3, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (4, N'Những gương sáng Sinh viên trong Nghiên cứu khoa học', N'NULLDiễn ra từ ngày 15/10 đến ngày 26/10/2013, Vòng bán kết Giải thưởng sinh viên nghiên cứu Khoa học – Euréka 2013 đã chính thức công bố danh sách các đề tài xuất sắc nhất lọt vào Vòng chung kết của Euréka 2013. Theo đó, năm nay Đại học Công nghệ TP.HCM (HUTECH) đạt được thành tích đáng ghi nhận khi vượt qua hàng loạt các Đại học lớn của TP.HCM trở thành một trong 4 đại học có số lượng đề tài nhiều nhất vào Vòng Chung kết của sân chơi học thuật uy tín này. Sáng 17/11, các bạn đã có buổi báo cáo bảo vệ các công trình khoa học do mình thực hiện trước các chuyên gia đầu ngành của Thành phố.', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'nhung-guong-sang-sinh-vien-trong-nghien-cuu-khoa-hoc', 4, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (5, N'Sinh viên Luật Đại học HUTECH tìm hiểu về tranh chấp và giải quyết tranh chấp', N'Sáng nay (03/05), tại Trụ sở Điện Biên Phủ trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã diễn ra Hội thảo khoa học “Tranh chấp và giải quyết các tranh chấp hành chính, dân sự, kinh tế” nhằm nâng cao hơn nữa hiệu quả tiếp thu kiến thức chuyên ngành cho các bạn sinh viên. ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'sinh-vien-luat-dai-hoc-hutech-tim-hieu-ve-tranh-chap-va-giai-quyet-tranh-chap', 5, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (6, N'Thời gian tổ chức Hội thi báo cáo mô hình, giải pháp thực hiện phần việc "Làm theo lời Bác"', N'Đoàn trường ĐH Công Nghệ TP. HCM (HUTECH) thông báo đến các bạn đoàn viên, sinh viên LỊCH TỔ CHỨC & DANH SÁCH DỰ THI của Hội thi Báo cáo mô hình, giải pháp thực hiện phần việc "Làm theo lời Bác" năm học 2017 - 2018 theo file đính kèm bên dưới.
LƯU Ý:
- Địa điểm báo cáo: Phòng A04.30 (Cơ sở Điện Biên Phủ)
- Mỗi thí sinh dự thi có từ 4 - 5 phút để trình bày và trao đổi với Hội đồng thẩm định.
- Thí sinh dự thi vui lòng tự chuẩn bị 3 bản báo cáo để gửi Hội đồng thẩm định.
- Thí sinh có chuẩn bị slide trình chiếu vui lòng có mặt trước 15 phút và liên hệ với bộ phận Kỹ thuật - Âm thanh để được hỗ trợ.
Mọi vấn đề xin liên hệ trực tiếp: VĂN PHÒNG ĐOÀN THANH NIÊN - HỘI SINH VIÊN
Email: doanthanhnien@hutech.edu.vn
Mobile: (028) 3512.0293', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'thoi-gian-to-chuc-hoi-thi-bao-cao-mo-hinh-giai-phap-thuc-hien-phan-viec-lam-theo-loi-bac', 6, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (7, N'Thông báo V/v KIỂM TRA CÁC CƠ SỞ ĐOÀN NĂM HỌC 2017 - 2018 (cập nhật)', N'Nhằm nắm bắt tình hình công tác Đoàn và phong trào thanh niên của các đơn vị Đoàn cơ sở trực thuộc Đoàn Trường và thực hiện tiền đề công tác Đánh giá xếp loại Cán bộ Đoàn trong năm học 2017 – 2018, qua đó kịp thời định hướng cho những hoạt động trong thời gian tới. Ủy Ban kiểm tra Đoàn trường thông báo Kiểm tra công tác các cơ sở Đoàn năm học 2017 – 2018:', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'thong-bao-doan-thanh-nien-nam-2017-2018/14569854-thong-bao-vv-kiem-tra-cac-co-so-doan-nam-hoc-2017-2018', 7, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (8, N'Lộ diện 4 đội xuất sắc tranh chung kết “Công nghệ sinh học - Hành trình đến tương lai” năm 2018', N'Ngày 08/4, Viện Khoa học ứng dụng Trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã tổ chức vòng Bán kết cuộc thi học thuật “Công nghệ sinh học - Hành trình đến tương lai” lần III năm 2018 với sự góp mặt của 16 đội thi đến từ 6 trường Đại học ở khu vực phía Nam.

Tham dự chương trình có TS. Hồ Viết Thế - Trưởng ngành SĐH CNSH Trường ĐH Công nghiệp Thực phẩm TP.HCM, ThS. Lâm Vỹ Nguyên – Trưởng phòng Quản lý Khoa học – Hợp tác Quốc tế, Trung tâm CNSH TP.HCM, ThS. Lâm Vĩnh Sơn - Phó Viện trưởng Viện KHƯD HUTECH, TS. Nguyễn Hoài Hương - Chủ nhiệm ngành CNSH Viện KHƯD HUTECH, cùng rất đông thầy cô các phòng, ban, khoa viện các trường và hơn 200 sinh đến cổ vũ cho 16 đội thi.
 ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'lo-dien-4-doi-xuat-sac-tranh-chung-ket-cong-nghe-sinh-hoc-hanh-trinh-den-tuong-lai-nam-2018', 8, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (9, N'Đã tìm ra nhà vô địch của Cuộc thi Olympic Pháp luật lần III năm 2018', N'Sáng 07/4, tại Hội trường A-08.20, Trường Đại học Công nghệ TP.HCM (Đại học HUTECH), Vòng chung kết của cuộc thi Olympic Pháp luật lần III năm 2018 do Khoa luật tổ chức đã diễn ra với những phần thi kịch tính và những tình huống pháp lý sinh động, mang tính thời sự mới mẻ. 

 
Đến tham dự chương trình có TS. Bành Quốc Tuấn - Phó Trưởng khoa Luật, ông Phạm Hồng Khải - Viện Kiểm sát Tòa án Nhân dân TP.HCM, ông Phan Huỳnh Hoàng Phương - Thẩm phán Tòa án Nhân dân quận Tân Phú. Ngoài ra, còn có quý thầy cô đến từ các trường và hơn 200 sinh viên đến cổ vũ cho các đội thi.
 ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'da-tim-ra-nha-vo-dich-cua-cuoc-thi-olympic-phap-luat-lan-iii-nam-2018', 9, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (10, N'Tưng bừng Ngày hội xuống nước của sinh viên khoa Dược', N'Vừa qua, các bạn sinh viên khoa Dược - trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã có một buổi sinh hoạt ngoại khóa sôi nổi và thiết thực với Ngày hội xuống nước. 
 
Ngày hội do CLB Kỹ năng khoa Dược tổ chức tại Hồ bơi Yết Kiêu (Số 1 Nguyễn Thị Minh Khai, P. Bến Nghé, Q.1, TP.HCM). Đây là hoạt động truyền thống của CLB Kỹ năng Khoa Dược, hướng đến kiểm tra kỹ năng bơi lội, qua đó góp phần phòng chống đuối nước và khuyến khích tinh thần rèn luyện sức khỏe ở các Dược sĩ tương lai.
 ', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'tung-bung-ngay-hoi-xuong-nuoc-cua-sinh-vien-khoa-duoc', 10, N'#', 0)
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (11, N'Thông báo tiếp nhận hồ sơ Học bổng "Thắp sáng ước mơ tuổi trẻ HUTECH" năm học 2017 - 2018', N'Nhằm giúp đỡ, hỗ trợ và động viên tinh thần học tập cho các bạn đoàn viên, sinh viên có hoàn cảnh đặc biệt khó khăn và đạt thành tích tốt trong học tập và rèn luyện, Ban Thường vụ Đoàn trường ĐH Công Nghệ TP.HCM tổ chức trao Học bổng “Thắp sáng ước mơ tuổi trẻ HUTECH” năm học 2017 – 2018, cụ thể như sau:
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
INSERT [dbo].[TINTUC] ([ID_TT], [TITLE], [DETAIL], [DATEBEGIN], [META], [ORDER], [LINK], [HIDE]) VALUES (12, N'Sinh viên Nhật Bản học – Đại học HUTECH tôn vinh nét đẹp phụ nữ Việt qua những nét vẽ', N'Sáng nay (07/3/2018), cộng đồng sinh viên Trường Đại học Công nghệ TP.HCM (Đại học HUTECH) đã có dịp chiêm ngưỡng 20 bức vẽ đẹp nhất về hình ảnh người phụ nữ Việt Nam do chính sinh viên Khoa Nhật Bản học của Trường thực hiện.', CAST(N'2018-05-11T00:00:00' AS SmallDateTime), N'sinh-vien-nhat-ban-hoc-dai-hoc-hutech-ton-vinh-net-dep-phu-nu-viet-qua-nhung-net-ve', 12, N'#', 0)
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
ALTER TABLE [dbo].[CT_TEUCHI]  WITH CHECK ADD FOREIGN KEY([ID_TCHI])
REFERENCES [dbo].[TIEUCHI] ([ID_TCHI])
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD FOREIGN KEY([ID_CAP])
REFERENCES [dbo].[CAP] ([ID_CAP])
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD FOREIGN KEY([ID_CTTCHI])
REFERENCES [dbo].[CT_TEUCHI] ([ID_CTTCHI])
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
