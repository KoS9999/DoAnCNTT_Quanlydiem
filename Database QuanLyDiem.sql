USE [master]
GO
/****** Object:  Database [QuanLyDiem]    Script Date: 12/4/2023 8:18:21 PM ******/
CREATE DATABASE [QuanLyDiem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDiem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyDiem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyDiem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyDiem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyDiem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDiem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDiem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDiem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDiem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDiem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDiem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDiem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDiem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDiem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDiem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDiem] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyDiem] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDiem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDiem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDiem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDiem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyDiem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyDiem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyDiem', N'ON'
GO
ALTER DATABASE [QuanLyDiem] SET QUERY_STORE = OFF
GO
USE [QuanLyDiem]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 12/4/2023 8:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[UserName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiemHP]    Script Date: 12/4/2023 8:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemHP](
	[MaSV] [nvarchar](50) NOT NULL,
	[MaMon] [nvarchar](50) NOT NULL,
	[DiemQuaTrinh] [float] NULL,
	[DiemThi] [float] NULL,
	[DiemTongKet]  AS (([DiemQuaTrinh]+[DiemThi])/(2.0)) PERSISTED
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 12/4/2023 8:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[MaHK] [nvarchar](50) NOT NULL,
	[TenHK] [nvarchar](100) NULL,
 CONSTRAINT [PK_HocKy] PRIMARY KEY CLUSTERED 
(
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 12/4/2023 8:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[MaLop] [nvarchar](50) NOT NULL,
	[TenLop] [nvarchar](100) NULL,
 CONSTRAINT [PK_LopHoc] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/4/2023 8:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMon] [nvarchar](50) NOT NULL,
	[TenMon] [nvarchar](100) NULL,
	[SoTinChi] [int] NULL,
	[MaHK] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/4/2023 8:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [int] NULL,
	[DanToc] [nvarchar](100) NULL,
	[NoiSinh] [nvarchar](100) NULL,
	[MaLop] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTin]    Script Date: 12/4/2023 8:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTin](
	[Tinh] [nvarchar](100) NULL,
	[DonViChuQuan] [nvarchar](100) NULL,
	[TenTruong] [nvarchar](100) NULL,
	[KhoaHoc] [nvarchar](100) NULL,
	[NganhHoc] [nvarchar](100) NULL,
	[ChuyenNganh] [nvarchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[DangNhap] ([UserName], [PassWord]) VALUES (N'admin', N'123456')
INSERT [dbo].[DangNhap] ([UserName], [PassWord]) VALUES (N'ADMIN1', N'ADMIN2')
GO
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'OOP', 8, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'TC2', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'AI', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'TRR', 6.5, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'CT', 8, 9.3)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'TC2', 9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'TA1', 10, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'OOP', 10, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'TRR', 2, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'MMT', 6.8, 9.3)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'HCSDL', 7.9, 8.9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'LTW', 6.9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'AI', 7.8, 9.8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'TRR', 9.5, 9.2)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'CT', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'MMT', 8.2, 8.7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'TA1', 9, 9.2)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'OOP', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'HCSDL', 8, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'TA1', 4.5, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'LTW', 10, 9.1)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'OOP', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'TRR', 7.5, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'CT', 10, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'MMT', 8, 8.1)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'TC2', 5, 5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'OOP', 10, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'TRR', 8, 8.6)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'CT', 9, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'MMT', 10, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'LTW', 10, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'AI', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'TRR', 7, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'HCSDL', 7, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'TC2', 9, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'OOP', 8.5, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'AI', 5.6, 9.6)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'TRR', 4.2, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'TC2', 10, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'LTW', 10, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'AI', 8.5, 8.1)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'TRR', 8.4, 8.9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'TC2', 10, 8.7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'TA1', 9.6, 9.1)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'LTW', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'OOP', 2, 1)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'TC2', NULL, NULL)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'AI', 8, 9.2)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'TRR', 7, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'TC2', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'HCSDL', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'OOP', 7, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'AI', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'TRR', 9.5, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'MMT', 8.2, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'TC2', 4.5, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'TRR', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'AI', 7, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'TC2', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'CT', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'OOP', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'TRR', 7.9, 8.7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'AI', 8.8, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'MMT', 9, 9.2)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'TA1', 9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'OOP', 10, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'AI', 8, 8.9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'TRR', 9, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'MMT', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'HCSDL', 9, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'OOP', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'AI', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'TRR', 9, 9.6)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'CT', 8, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'TA1', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'LTW', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'OOP', 9, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'TRR', 8.5, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'AI', 7.5, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'MMT', 7, 7.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'TC2', 7, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'LTW', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'OOP', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'TRR', 7.5, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'AI', 8.5, 7.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'TC2', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'CT', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'LTW', 8, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'TA1', 9, 8.6)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'OOP', 8, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'AI', 6, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'TRR', 8, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'MMT', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'HCSDL', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'LTW', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'OOP', 9.5, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'AI', 8.5, 8.6)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'TRR', 9.6, 8.4)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'TC2', 8.5, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'MMT', 8, 9)
GO
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'CT', 9, 9.3)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'LTW', 8, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'AI', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'TRR', 9, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'TA1', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'CT', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'AI', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'TRR', 8.5, 8.1)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'MMT', 7, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'HCSDL', 8, 9.1)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'TA1', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'AI', 9, 8.8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'AI', 7, NULL)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'AI', 5, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'AI', 10, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'CT', 5.5, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'CT', 9.5, 7.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'CT', 7.5, 6.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'CT', 8, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'CT', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'CT', 7, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'CT', 5, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'CT', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'CT', 6, 7)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'CT', 7, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'CT', 9, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'CT', 7.5, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'HCSDL', 5.5, 5.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'HCSDL', 10, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'HCSDL', 10, 5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'HCSDL', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'HCSDL', 10, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'HCSDL', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'HCSDL', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'HCSDL', 8, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'HCSDL', 8, 7.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'HCSDL', 8, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'HCSDL', 5, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'HCSDL', 6, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'HCSDL', 9, 9.25)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'HCSDL', 9, 9.25)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'LTW', 9, 8.25)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'LTW', 8, 8.25)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'LTW', 7, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'LTW', 10, 8.25)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'LTW', 9, 8.25)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'LTW', 9, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'LTW', 9, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'LTW', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'LTW', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'LTW', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'LTW', 8.5, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110100', N'MMT', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'MMT', 8, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'MMT', 10, 6)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'MMT', 6, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'MMT', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'MMT', 6, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'MMT', 5, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'MMT', 8.5, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110116', N'MMT', 8, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'MMT', 9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'OOP', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'OOP', 8, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110108', N'OOP', 8, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'OOP', 8, 8.25)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110119', N'OOP', 8, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'OOP', 9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110101', N'TA1', 9, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110104', N'TA1', 8, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'TA1', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110106', N'TA1', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110107', N'TA1', 9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110109', N'TA1', 9, 9.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110110', N'TA1', 8, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110111', N'TA1', 7, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'TA1', 8, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110115', N'TA1', 9, 9)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'TA1', 9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110118', N'TA1', 9, 10)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110102', N'TC2', 7, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'TC2', 7, 8)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110105', N'TC2', 6, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110112', N'TC2', 7, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110113', N'TC2', 6.5, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110114', N'TC2', 6.5, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110117', N'TC2', 7, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110120', N'TC2', 7, 8.5)
INSERT [dbo].[DiemHP] ([MaSV], [MaMon], [DiemQuaTrinh], [DiemThi]) VALUES (N'21110103', N'TRR', 7, 8)
GO
INSERT [dbo].[HocKy] ([MaHK], [TenHK]) VALUES (N'N2324K1', N'Học kì 1 năm 2023 - 2024')
INSERT [dbo].[HocKy] ([MaHK], [TenHK]) VALUES (N'N2324K2', N'Học kì 2 năm 2023 - 2024')
INSERT [dbo].[HocKy] ([MaHK], [TenHK]) VALUES (N'N2324K3', N'Học kì 3 năm 2023 - 2024')
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop]) VALUES (N'21110CL1', N'Công nghệ thông tin 1')
INSERT [dbo].[LopHoc] ([MaLop], [TenLop]) VALUES (N'21110CL2', N'Công nghệ thông tin 2')
INSERT [dbo].[LopHoc] ([MaLop], [TenLop]) VALUES (N'21110CL3', N'Công nghệ thông tin 3')
GO
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'AI', N'Lập trình trí tuệ nhân tạo', 3, N'N2324K1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'CT', N'Lịch sử Đảng', 2, N'N2324K2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'HCSDL', N'Hệ cơ sở dữ liệu', 3, N'N2324K2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'LTW', N'Lập trình Windows', 3, N'N2324K3')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'MMT', N'Mạng máy tính', 3, N'N2324K2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'OOP', N'Lập trình hướng đối tượng', 3, N'N2324K1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'TA1', N'Tiếng Anh 1', 3, N'N2324K3')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'TC2', N'Thể chất 2', 1, N'N2324K2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTinChi], [MaHK]) VALUES (N'TRR', N'Toán rời rạc', 3, N'N2324K1')
GO
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110100', N'Nguyễn Thúy Kiều', CAST(N'2003-03-01T00:00:00.000' AS DateTime), 0, N'Kinh', N'TPHCM', N'21110CL1')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110101', N'Trần Quốc Cảnh', CAST(N'2003-12-05T00:00:00.000' AS DateTime), 1, N'Kinh', N'Hà Nội', N'21110CL1')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110102', N'Lý Hoảng Huy', CAST(N'2003-11-03T00:00:00.000' AS DateTime), 1, N'Hoa', N'TPHCM', N'21110CL1')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110103', N'Ngô Nguyễn Phú', CAST(N'2003-08-07T00:00:00.000' AS DateTime), 1, N'Kinh', N'TPHCM', N'21110CL1')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110104', N'Nguyễn Thị Hoa', CAST(N'2003-05-05T00:00:00.000' AS DateTime), 0, N'Kinh', N'TPHCM', N'21110CL1')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110105', N'Nguyễn Tuấn Anh', CAST(N'2003-05-07T00:00:00.000' AS DateTime), 1, N'Kinh', N'Bến Tre', N'21110CL2')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110106', N'Phạm Tuấn Vỉ', CAST(N'2003-10-04T00:00:00.000' AS DateTime), 1, N'Kinh', N'Bình Dương', N'21110CL2')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110107', N'Phan Tấn Trung', CAST(N'2003-02-26T00:00:00.000' AS DateTime), 1, N'Kinh', N'Đồng Tháp', N'21110CL2')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110108', N'Huỳnh Chí Anh Tuấn', CAST(N'2003-10-22T00:00:00.000' AS DateTime), 1, N'Kinh', N'Bến Tre', N'21110CL2')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110109', N'Văn Hữu Bảo', CAST(N'2003-04-30T00:00:00.000' AS DateTime), 1, N'Kinh', N'Gia Lai', N'21110CL2')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110110', N'Phạm Ngọc Huyền Trâm', CAST(N'2003-09-13T00:00:00.000' AS DateTime), 0, N'Kinh', N'TPHCM', N'21110CL2')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110111', N'Võ Huỳnh Quang Huy', CAST(N'2003-06-22T00:00:00.000' AS DateTime), 1, N'Kinh', N'Phú Yên', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110112', N'Nguyễn Phước Long Hiệp', CAST(N'2003-03-24T00:00:00.000' AS DateTime), 1, N'Kinh', N'TPHCM', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110113', N' Nguyễn Khánh Tâm', CAST(N'2003-12-12T00:00:00.000' AS DateTime), 0, N'Kinh', N'TPHCM', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110114', N'Nguyễn Ngọc Anh Tuấn', CAST(N'2003-05-06T00:00:00.000' AS DateTime), 1, N'Kinh', N'TPHCM', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110115', N'Lê Tùng Huy', CAST(N'2003-08-09T00:00:00.000' AS DateTime), 1, N'Kinh', N'Long An', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110116', N'Nguyễn Văn Ổi', CAST(N'2003-07-15T00:00:00.000' AS DateTime), 1, N'Kinh', N'Khánh Hòa', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110117', N'Lê Duy Khánh', CAST(N'2003-04-26T00:00:00.000' AS DateTime), 1, N'Kinh', N'TPHCM', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110118', N'Phạm Thanh Hằng', CAST(N'2003-02-07T00:00:00.000' AS DateTime), 0, N'Kinh', N'Bắc Ninh', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110119', N'Lê Ngọc Nga', CAST(N'2003-02-08T00:00:00.000' AS DateTime), 0, N'Kinh', N'An Giang', N'21110CL3')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [NoiSinh], [MaLop]) VALUES (N'21110120', N'Lý Ngọc Thảo', CAST(N'2003-06-05T00:00:00.000' AS DateTime), 0, N'Kinh', N'Long An', N'21110CL3')
GO
INSERT [dbo].[ThongTin] ([Tinh], [DonViChuQuan], [TenTruong], [KhoaHoc], [NganhHoc], [ChuyenNganh]) VALUES (N'TP. Hồ Chí Minh', N'Bộ Giáo dục và Đào tạo', N'Trường Đại học Sư phạm Kỹ thuật TPHCM', N'2021-2025', N'Công nghệ thông tin', N'Công nghệ phần mềm')
GO
ALTER TABLE [dbo].[DiemHP]  WITH CHECK ADD  CONSTRAINT [FK_DiemHP_MonHoc] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonHoc] ([MaMon])
GO
ALTER TABLE [dbo].[DiemHP] CHECK CONSTRAINT [FK_DiemHP_MonHoc]
GO
ALTER TABLE [dbo].[DiemHP]  WITH CHECK ADD  CONSTRAINT [FK_DiemHP_SinhVien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[DiemHP] CHECK CONSTRAINT [FK_DiemHP_SinhVien]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc_HocKy] FOREIGN KEY([MaHK])
REFERENCES [dbo].[HocKy] ([MaHK])
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [FK_MonHoc_HocKy]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_LopHoc] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHoc] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_LopHoc]
GO
/****** Object:  StoredProcedure [dbo].[BangDiemHP]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BangDiemHP](
	@MaLop nvarchar (50),
	@MaMon nvarchar (50)
)
AS 
BEGIN
	SELECT SinhVien.MaSV, SinhVien.HoTen, SinhVien.NgaySinh,
	DiemHP.DiemQuaTrinh, DiemHP.DiemThi
	FROM SinhVien INNER JOIN DiemHP ON SinhVien.MaSV = DiemHP.MaSV
	WHERE SinhVien.MaLop = @MaLop AND DiemHP.MaMon=@MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[DangNhap_Login]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DangNhap_Login]
    @UserName NVARCHAR(100),
    @PassWord NVARCHAR(100)
AS
BEGIN
    BEGIN TRY
        -- Thực hiện truy vấn
        SELECT UserName
        FROM dbo.DangNhap
        WHERE UserName = @UserName AND PassWord = @PassWord
    END TRY
    BEGIN CATCH
        -- Trả về thông báo lỗi nếu có
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DangNhap_Update]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DangNhap_Update](
    @UserName NVARCHAR(100),
    @NewPassword NVARCHAR(100)
)
AS
BEGIN
    UPDATE DangNhap
    SET PassWord = @NewPassword
    WHERE UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[DiemHP_Insert]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DiemHP_Insert](
	@MaMon nvarchar (50),
	@MaSV nvarchar (50)
)
AS
BEGIN
	INSERT INTO DiemHP (MaMon, MaSV) VALUES (@MaMon, @MaSV)
END
GO
/****** Object:  StoredProcedure [dbo].[DiemHP_Search]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DiemHP_Search](
	@MaMon nvarchar (50),
	@MaSV nvarchar (50)
)
AS
BEGIN
	SELECT * FROM DiemHP WHERE MaMon=@MaMon AND MaSV=@MaSV
END
GO
/****** Object:  StoredProcedure [dbo].[DiemHP_UpdateLan1]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DiemHP_UpdateLan1](
	@DiemQuaTrinh float,
	@MaMon nvarchar (50),
	@MaSV nvarchar (50)
)
AS 
BEGIN
	UPDATE DiemHP SET DiemQuaTrinh=@DiemQuaTrinh WHERE MaMon=@MaMon AND MaSV=@MaSV 
END
GO
/****** Object:  StoredProcedure [dbo].[DiemHP_UpdateLan2]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DiemHP_UpdateLan2](
	@DiemThi float,
	@MaMon nvarchar (50),
	@MaSV nvarchar (50)
)
AS 
BEGIN
	UPDATE DiemHP SET DiemThi=@DiemThi WHERE MaMon=@MaMon AND MaSV=@MaSV 
END
GO
/****** Object:  StoredProcedure [dbo].[HocKy_Delete]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HocKy_Delete](
	@MaHK nvarchar(50)
)
AS
BEGIN
	DELETE FROM HocKy WHERE MaHK=@MaHK
END
GO
/****** Object:  StoredProcedure [dbo].[HocKy_Insert]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HocKy_Insert](
	@MaHK nvarchar(50),
	@TenHK nvarchar(100)
)
AS
BEGIN
	INSERT INTO HocKy VALUES (@MaHK, @TenHK)
END
GO
/****** Object:  StoredProcedure [dbo].[HocKy_SelectAll]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HocKy_SelectAll]
AS
BEGIN
	SELECT * FROM HocKy
END
GO
/****** Object:  StoredProcedure [dbo].[HocKy_Update]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HocKy_Update](
	@MaHK nvarchar(50),
	@TenHK nvarchar(100)
)
AS
BEGIN
	UPDATE HocKy SET TenHK=@TenHK WHERE MaHK=@MaHK
END
GO
/****** Object:  StoredProcedure [dbo].[LopHoc_Delete]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LopHoc_Delete](
	@MaLop nvarchar(50)
)
AS
BEGIN
	DELETE FROM LopHoc WHERE MaLop=@MaLop
END
GO
/****** Object:  StoredProcedure [dbo].[LopHoc_Insert]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LopHoc_Insert](
	@MaLop nvarchar(50),
	@TenLop nvarchar(100)
)
AS
BEGIN
	INSERT INTO LopHoc VALUES (@MaLop, @TenLop)
END
GO
/****** Object:  StoredProcedure [dbo].[LopHoc_SelectAll]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LopHoc_SelectAll]
AS
BEGIN
	SELECT * FROM LopHoc
END
GO
/****** Object:  StoredProcedure [dbo].[LopHoc_Update]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LopHoc_Update](
	@MaLop nvarchar(50),
	@TenLop nvarchar(100)
)
AS
BEGIN
	UPDATE LopHoc SET TenLop=@TenLop WHERE MaLop=@MaLop
END
GO
/****** Object:  StoredProcedure [dbo].[MonHoc_Delete]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MonHoc_Delete](
	@MaMon nvarchar (50)
)
AS
BEGIN
	DELETE FROM DiemHP WHERE MaMon = @MaMon;
	DELETE FROM MonHoc WHERE MaMon=@MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[MonHoc_Insert]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MonHoc_Insert](
	@MaMon nvarchar (50),
	@TenMon nvarchar (100),
	@SoTinChi int,
	@MaHK nvarchar (50)
)
AS
BEGIN
	INSERT INTO MonHoc VALUES (@MaMon, @TenMon, @SoTinChi, @MaHK)
END
GO
/****** Object:  StoredProcedure [dbo].[MonHoc_SelectAll]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MonHoc_SelectAll]
AS
BEGIN
	SELECT * FROM MonHoc
END
GO
/****** Object:  StoredProcedure [dbo].[MonHoc_SelectMaHK]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MonHoc_SelectMaHK](
	@MaHK nvarchar(50)
)
AS
BEGIN
	SELECT * FROM MonHoc WHERE MaHK=@MaHK
END
GO
/****** Object:  StoredProcedure [dbo].[MonHoc_Update]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MonHoc_Update](
	@MaMon nvarchar (50),
	@TenMon nvarchar (100),
	@SoTinChi int
)
AS
BEGIN
	UPDATE MonHoc SET TenMon=@TenMon, SoTinChi=@SoTinChi WHERE MaMon=@MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Delete]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_Delete](
	@MaSV nvarchar(50)
)
AS
BEGIN
	DELETE FROM SinhVien 
	WHERE MaSV=@MaSV
END
GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Insert]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_Insert](
	@MaSV nvarchar(50),
	@HoTen nvarchar(100),
	@NgaySinh datetime,
	@GioiTinh int,
	@DanToc nvarchar(100),
	@NoiSinh nvarchar(100),
	@MaLop nvarchar(50)
)
AS
BEGIN
	INSERT INTO SinhVien
	VALUES (@MaSV, @HoTen, @NgaySinh, @GioiTinh, @DanToc, @NoiSinh, @MaLop)
END
GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Search]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_Search](
	@HoTen nvarchar(100),
	@MaLop nvarchar(50)
)
AS
BEGIN
	SELECT * FROM SinhVien WHERE HoTen LIKE '%'+@HoTen+'%' AND MaLop=@MaLop
END
GO
/****** Object:  StoredProcedure [dbo].[SinhVien_SelectAll]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_SelectAll]
AS
BEGIN
	SELECT * FROM SinhVien
END
GO
/****** Object:  StoredProcedure [dbo].[SinhVien_SelectID]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_SelectID]
	@MaSV nvarchar(50)

AS 
BEGIN
	SELECT * FROM SinhVien WHERE MaSV=@MaSV
END
GO
/****** Object:  StoredProcedure [dbo].[SinhVien_SelectMaLop]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_SelectMaLop](
	@MaLop nvarchar(50)
)
AS
BEGIN
	SELECT * FROM SinhVien WHERE MaLop=@MaLop
END
GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Update]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_Update](
	@MaSV nvarchar(50),
	@HoTen nvarchar(100),
	@NgaySinh datetime,
	@GioiTinh int,
	@DanToc nvarchar(100),
	@NoiSinh nvarchar(100)
)
AS
BEGIN
	UPDATE SinhVien SET HoTEN=@HoTen, NgaySinh=@NgaySinh, GioiTinh=@GioiTinh, DanToc=@DanToc, NoiSinh=@NoiSinh
	WHERE MaSV=@MaSV
END
GO
/****** Object:  StoredProcedure [dbo].[ThongTin_SelectAll]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongTin_SelectAll]

AS 
BEGIN
	SELECT * FROM ThongTin
END
GO
/****** Object:  StoredProcedure [dbo].[ThongTin_Update]    Script Date: 12/4/2023 8:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongTin_Update](
	@Tinh nvarchar (100),
	@DonViChuQuan nvarchar (100),
	@TenTruong nvarchar (100),
	@KhoaHoc nvarchar(100),
	@NganhHoc nvarchar(100),
	@ChuyenNganh nvarchar (100)
)	
AS 
BEGIN
	UPDATE ThongTin SET Tinh=@Tinh, DonViChuQuan=@DonViChuQuan,
	TenTruong=@TenTruong, KhoaHoc=@KhoaHoc, NganhHoc=@NganhHoc,
	ChuyenNganh=@ChuyenNganh
END
GO
USE [master]
GO
ALTER DATABASE [QuanLyDiem] SET  READ_WRITE 
GO
