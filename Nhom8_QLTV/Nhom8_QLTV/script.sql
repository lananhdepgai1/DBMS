USE [Nhom8_QLTV]
GO
/****** Object:  User [LanAnh]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [LanAnh] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [N000]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [N000] FOR LOGIN [N000] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV01]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV01] FOR LOGIN [NV01] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV02]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV02] FOR LOGIN [NV02] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV03]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV03] FOR LOGIN [NV03] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV06]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV06] FOR LOGIN [NV06] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV07]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV07] FOR LOGIN [NV07] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV08]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV08] FOR LOGIN [NV08] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV09]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV09] FOR LOGIN [NV09] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NV20]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE USER [NV20] FOR LOGIN [NV20] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [r_staff]    Script Date: 11/24/2023 9:58:45 PM ******/
CREATE ROLE [r_staff]
GO
ALTER ROLE [r_staff] ADD MEMBER [N000]
GO
ALTER ROLE [r_staff] ADD MEMBER [NV02]
GO
ALTER ROLE [r_staff] ADD MEMBER [NV03]
GO
ALTER ROLE [r_staff] ADD MEMBER [NV06]
GO
ALTER ROLE [r_staff] ADD MEMBER [NV07]
GO
ALTER ROLE [r_staff] ADD MEMBER [NV08]
GO
ALTER ROLE [r_staff] ADD MEMBER [NV09]
GO
ALTER ROLE [r_staff] ADD MEMBER [NV20]
GO
/****** Object:  Table [dbo].[NXB]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB](
	[MaNXB] [nvarchar](10) NOT NULL,
	[TenNXB] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [nvarchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [nvarchar](10) NOT NULL,
	[TenTacGia] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DauSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauSach](
	[MaSach] [nvarchar](10) NOT NULL,
	[TenSach] [nvarchar](100) NOT NULL,
	[MaTacGia] [nvarchar](10) NULL,
	[MaNXB] [nvarchar](10) NULL,
	[MaTheLoai] [nvarchar](10) NULL,
	[Gia] [money] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_CTThongTinSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 1. Xem chi tiết thông tin sách

CREATE   VIEW [dbo].[view_CTThongTinSach] AS
SELECT
    DS.MaSach AS MaSach,
    DS.TenSach AS TenSach,
    TG.TenTacGia AS TenTacGia,
    NXB.TenNXB AS TenNXB,
    TL.TenTheLoai AS TenTheLoai,
    DS.Gia AS Gia,
    DS.SoLuong AS SoLuong,
	TG.MaTacGia AS MaTacGia,
	NXB.MaNXB AS MaNXB,
	TL.MaTheLoai AS MaTheLoai
FROM DauSach DS
JOIN TacGia TG ON DS.MaTacGia = TG.MaTacGia
JOIN NXB ON DS.MaNXB = NXB.MaNXB
JOIN TheLoai TL ON DS.MaTheLoai = TL.MaTheLoai
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimSachTenTheLoai]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func3 Tìm sách theo thể loại
CREATE   FUNCTION [dbo].[func_TimSachTenTheLoai]
	(@TenTheLoai nvarchar(100))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM view_CTThongTinSach
    WHERE TenTheLoai LIKE N'%'+@TenTheLoai+'%'
)
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDocGia] [nvarchar](10) NOT NULL,
	[TenDocGia] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[CCCD] [nvarchar](12) NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimDocGiaTheoMa]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- func4 Tìm độc giả theo mã
CREATE   FUNCTION [dbo].[func_TimDocGiaTheoMa]
    (@MaDocGia NVARCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM DocGia
    WHERE MaDocGia = @MaDocGia
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimDocGiaTheoTen]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--func5 Tìm độc giả theo tên
CREATE   FUNCTION [dbo].[func_TimDocGiaTheoTen]
    (@TenDocGia NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM DocGia
    WHERE TenDocGia LIKE '%' + @TenDocGia + '%'
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimDocGiaTheoSDT]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- func6 Tìm độc giả theo SĐT
CREATE   FUNCTION [dbo].[func_TimDocGiaTheoSDT]
    (@SDT NVARCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM DocGia
    WHERE SDT = @SDT
)
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [nvarchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[CCCD] [nvarchar](12) NULL,
	[SDT] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuonTra]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuonTra](
	[MaPhieu] [nvarchar](10) NOT NULL,
	[MaDocGia] [nvarchar](10) NULL,
	[MaNhanVien] [nvarchar](10) NULL,
	[NgayMuon] [date] NOT NULL,
	[NgayHetHan]  AS (dateadd(day,(30),[NgayMuon])),
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_ThongTinPhieuMuon]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--4. Xem chi tiết thông tin phiếu mượn
CREATE   VIEW [dbo].[view_ThongTinPhieuMuon] AS
SELECT
    PMT.MaPhieu AS MaPhieu,
    PMT.MaDocGia AS MaDocGia,
    DG.TenDocGia AS TenDocGia,
    PMT.MaNhanVien AS MaNhanVien,
    NV.HoTen AS TenNhanVien,
    PMT.NgayMuon AS NgayMuon,
    PMT.NgayHetHan AS NgayHetHan
FROM PhieuMuonTra PMT
JOIN DocGia DG ON PMT.MaDocGia = DG.MaDocGia
JOIN NhanVien NV ON PMT.MaNhanVien = NV.MaNhanVien;
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimPhieuMuonTheoMaPhieu]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_TimPhieuMuonTheoMaPhieu] 
	(@MaPhieu NVARCHAR(10))
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM view_ThongTinPhieuMuon
	WHERE MaPhieu = @MaPhieu
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimPhieuMuonTheoTenDocGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func8 Tìm phiếu mượn theo tên độc giả
CREATE FUNCTION [dbo].[func_TimPhieuMuonTheoTenDocGia]
	(@TenDocGia NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM view_ThongTinPhieuMuon
	WHERE TenDocGia LIKE N'%'+@TenDocGia+'%'
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimPhieuMuonTheoTenNhanVien]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func8 Tìm phiếu mượn theo tên nhân viên
CREATE FUNCTION [dbo].[func_TimPhieuMuonTheoTenNhanVien]
	(@TenNhanVien NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM view_ThongTinPhieuMuon
	WHERE TenNhanVien LIKE N'%'+@TenNhanVien+'%'
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimPhieuMuonTheoNgayMuon]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func10 Tìm phiếu mượn theo ngày mượn
CREATE FUNCTION [dbo].[func_TimPhieuMuonTheoNgayMuon]
	(@NgayMuon DATE)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM view_ThongTinPhieuMuon
	WHERE NgayMuon = @NgayMuon
)
GO
/****** Object:  Table [dbo].[CT_MuonTra]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_MuonTra](
	[MaCuon] [nvarchar](10) NOT NULL,
	[MaPhieu] [nvarchar](10) NULL,
	[NgayTra] [date] NULL,
	[TinhTrang] [nvarchar](4) NULL,
	[SoNgayQuaHan] [int] NULL,
	[GhiChu] [nvarchar](200) NULL,
	[TienPhat] [money] NULL,
	[ThanhToan] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimPhieuTraTheoMaCuon]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- func11 Tìm phiếu trả theo mã cuốn
CREATE FUNCTION [dbo].[func_TimPhieuTraTheoMaCuon]
	(@MaCuon NVARCHAR(10))
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM CT_MuonTra
	WHERE MaCuon = @MaCuon
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimPhieuTraTheoMaPhieu]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func12 Tìm phiếu trả theo mã phiếu
CREATE FUNCTION [dbo].[func_TimPhieuTraTheoMaPhieu]
	(@MaPhieu NVARCHAR(10))
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM CT_MuonTra
	WHERE MaPhieu = @MaPhieu
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimNhanVienTheoMa]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func13 Tìm nhân viên theo mã
CREATE   FUNCTION [dbo].[func_TimNhanVienTheoMa]
    (@MaNhanVien NVARCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM NhanVien
    WHERE MaNhanVien = @MaNhanVien
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimNhanVienTheoTen]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- fun14 Tìm nhân viên theo tên
CREATE   FUNCTION [dbo].[func_TimNhanVienTheoTen]
    (@HoTen NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM NhanVien
    WHERE HoTen LIKE '%' + @HoTen + '%'
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimNhanVienTheoSDT]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- fun15 Tìm nhân viên theo SĐT
CREATE   FUNCTION [dbo].[func_TimNhanVienTheoSDT]
    (@SDT NVARCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM NhanVien
    WHERE SDT = @SDT
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_ThongKeDocGiaTraSachTreHan]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func18 Thống kê độc giả trả sách quá hạn
CREATE   FUNCTION [dbo].[func_ThongKeDocGiaTraSachTreHan]()
RETURNS TABLE
AS
RETURN (
    SELECT
        DG.MaDocGia,
        DG.TenDocGia,
		CTMT.MaCuon,
		CTMT.SoNgayQuaHan
    FROM DocGia DG
    INNER JOIN PhieuMuonTra PMT ON DG.MaDocGia = PMT.MaDocGia
    INNER JOIN CT_MuonTra CTMT ON PMT.MaPhieu = CTMT.MaPhieu
    WHERE CTMT.SoNgayQuaHan > 0 
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_ThongKeDocGiaLamHuSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- func18 Thống kê độc giả làm hư sách
CREATE   FUNCTION [dbo].[func_ThongKeDocGiaLamHuSach]()
RETURNS TABLE
AS
RETURN (
    SELECT
        DG.MaDocGia,
        DG.TenDocGia,
		CTMT.MaCuon,
        CTMT.TinhTrang,
        CTMT.GhiChu
    FROM DocGia DG
    INNER JOIN PhieuMuonTra PMT ON DG.MaDocGia = PMT.MaDocGia
    INNER JOIN CT_MuonTra CTMT ON PMT.MaPhieu = CTMT.MaPhieu
    WHERE (CTMT.TinhTrang = N'Hư')
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_ThongKeDocGiaLamMatSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func17 Thống kê độc giả làm mất sách
CREATE   FUNCTION [dbo].[func_ThongKeDocGiaLamMatSach]()
RETURNS TABLE
AS
RETURN (
    SELECT
        DG.MaDocGia,
        DG.TenDocGia,
		CTMT.MaCuon,
        CTMT.TinhTrang,
        CTMT.GhiChu
    FROM DocGia DG
    INNER JOIN PhieuMuonTra PMT ON DG.MaDocGia = PMT.MaDocGia
    INNER JOIN CT_MuonTra CTMT ON PMT.MaPhieu = CTMT.MaPhieu
    WHERE  ( CTMT.TinhTrang = N'Mất')
)
GO
/****** Object:  View [dbo].[view_CTThongTinDocGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 2. Xem chi tiết thông tin Độc giả
CREATE   VIEW [dbo].[view_CTThongTinDocGia] AS
SELECT
    DG.MaDocGia AS MaDocGia,
    DG.TenDocGia AS TenDocGia,
    DG.GioiTinh AS GioiTinh,
    DG.CCCD AS CCCD,
    DG.DiaChi AS DiaChi,
    DG.SDT AS SDT,
    DG.Email AS Email
FROM DocGia DG
GO
/****** Object:  View [dbo].[view_CTThongTinNV]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 3. Xem chi tiết thông tin Nhân Viên
CREATE   VIEW [dbo].[view_CTThongTinNV] AS
SELECT
    NV.MaNhanVien AS MaNhanVien,
    NV.HoTen AS HoTen,
    NV.CCCD AS CCCD,
    NV.SDT AS SDT,
    NV.DiaChi AS DiaChi,
    NV.Email AS Email
FROM NhanVien NV
GO
/****** Object:  View [dbo].[view_XemPhieuTra]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--5. Xem chi tiết thông tin phiếu trả (CT_MuonTra)
CREATE VIEW [dbo].[view_XemPhieuTra]
AS SELECT * FROM CT_MuonTra
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimSachTheoTenSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func1 Tìm sách theo tên sách
CREATE   FUNCTION [dbo].[func_TimSachTheoTenSach]
	(@MaSach nvarchar(100))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM view_CTThongTinSach
    WHERE TenSach LIKE N'%'+@MaSach+'%'
)
GO
/****** Object:  UserDefinedFunction [dbo].[func_TimSachTheoTenTacGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- func2 Tìm sách theo tác giả
CREATE   FUNCTION [dbo].[func_TimSachTheoTenTacGia]
	(@TenTacGia nvarchar(100))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM view_CTThongTinSach
    WHERE TenTacGia LIKE N'%'+@TenTacGia+'%'
)
GO
/****** Object:  Table [dbo].[CuonSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuonSach](
	[MaCuon] [nvarchar](10) NOT NULL,
	[MaSach] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](10) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DauSach_TheLoai]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauSach_TheLoai](
	[MaSach] [nvarchar](10) NOT NULL,
	[MaTheLoai] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SangTac]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SangTac](
	[MaSach] [nvarchar](10) NOT NULL,
	[MaTacGia] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS01C0001', N'PMT01', CAST(N'2023-01-20' AS Date), N'BT', 0, N'', 0.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS02C0002', N'PMT02', CAST(N'2023-02-15' AS Date), N'Hư', 14, N'', 89000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS03C0003', N'PMT02', CAST(N'2023-02-01' AS Date), N'Mất', 0, N'', 270000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS04C0004', N'PMT03', CAST(N'2023-02-03' AS Date), N'BT', 1, N'', 1000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS05C0005', N'PMT03', CAST(N'2023-01-31' AS Date), N'Hư', 0, N'', 55000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS06C0006', N'PMT03', CAST(N'2023-02-07' AS Date), N'Mất', 5, N'', 290000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS16C0006', N'PMT06', CAST(N'2023-03-10' AS Date), N'BT', 2, N'', 2000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS17C0007', N'PMT07', CAST(N'2023-03-09' AS Date), N'Hư', 0, N'', 44000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS18C0008', N'PMT07', CAST(N'2023-03-05' AS Date), N'Mất', 0, N'', 240000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS19C0009', N'PMT08', CAST(N'2023-03-06' AS Date), N'BT', 0, N'', 0.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS20C0010', N'PMT08', CAST(N'2023-03-07' AS Date), N'Hư', 0, N'', 46500.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS20C0012', N'PMT12', CAST(N'2023-04-18' AS Date), N'Mất', 7, N'', 286000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS21C0004', N'PMT08', CAST(N'2023-03-13' AS Date), N'Mất', 3, N'', 258000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS22C0005', N'PMT09', CAST(N'2023-03-11' AS Date), N'BT', 0, N'', 0.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS23C0006', N'PMT09', CAST(N'2023-03-11' AS Date), N'Hư', 0, N'', 55000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS24C0007', N'PMT09', CAST(N'2023-03-11' AS Date), N'Mất', 0, N'', 294000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS25C0008', N'PMT09', CAST(N'2023-03-11' AS Date), N'BT', 0, N'', 0.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS27C0009', N'PMT11', CAST(N'2023-04-09' AS Date), N'Mất', 0, N'', 270000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS28C0010', N'PMT11', CAST(N'2023-04-09' AS Date), N'BT', 0, N'', 0.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS29C0011', N'PMT12', CAST(N'2023-04-09' AS Date), N'Hư', 0, N'', 55000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS31C0013', N'PMT12', CAST(N'2023-04-18' AS Date), N'BT', 7, N'', 7000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS32C0014', N'PMT13', CAST(N'2023-04-12' AS Date), N'Hư', 0, N'', 48500.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS38C0005', N'PMT16', CAST(N'2023-05-15' AS Date), N'Hư', 0, N'', 47500.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS39C0006', N'PMT17', CAST(N'2023-05-12' AS Date), N'BT', 0, N'', 0.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS40C0007', N'PMT17', CAST(N'2023-05-12' AS Date), N'Hư', 0, N'', 42500.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS41C0008', N'PMT18', CAST(N'2023-05-25' AS Date), N'Mất', 7, N'', 283000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS42C0009', N'PMT18', CAST(N'2023-05-25' AS Date), N'BT', 7, N'', 7000.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS43C0010', N'PMT18', CAST(N'2023-05-25' AS Date), N'Hư', 7, N'', 51000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS44C0001', N'PMT19', CAST(N'2023-05-19' AS Date), N'Mất', 0, N'', 294000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS45C0002', N'PMT19', CAST(N'2023-05-11' AS Date), N'BT', 0, N'', 0.0000, N'CT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS46C0003', N'PMT19', CAST(N'2023-05-19' AS Date), N'Hư', 0, N'', 55000.0000, N'ĐT')
INSERT [dbo].[CT_MuonTra] ([MaCuon], [MaPhieu], [NgayTra], [TinhTrang], [SoNgayQuaHan], [GhiChu], [TienPhat], [ThanhToan]) VALUES (N'DS47C0004', N'PMT19', CAST(N'2023-05-20' AS Date), N'Mất', 1, N'', 376000.0000, N'ĐT')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0001', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0002', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0003', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0004', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0005', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0006', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0007', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0008', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0009', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS01C0010', N'DS01')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0001', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0002', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0003', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0004', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0005', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0006', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0007', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0008', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0009', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0010', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS02C0011', N'DS02')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0001', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0002', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0003', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0004', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0005', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0006', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0007', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0008', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0009', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0010', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0011', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS03C0012', N'DS03')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0001', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0002', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0003', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0004', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0005', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0006', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0007', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0008', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0009', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0010', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0011', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0012', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS04C0013', N'DS04')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0001', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0002', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0003', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0004', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0005', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0006', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0007', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0008', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0009', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0010', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0011', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0012', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0013', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS05C0014', N'DS05')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0001', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0002', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0003', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0004', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0005', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0006', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0007', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0008', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0009', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0010', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0011', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0012', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0013', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0014', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS06C0015', N'DS06')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0001', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0002', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0003', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0004', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0005', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0006', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0007', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0008', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0009', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0010', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0011', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0012', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0013', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0014', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0015', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS07C0016', N'DS07')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0001', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0002', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0003', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0004', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0005', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0006', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0007', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0008', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0009', N'DS08')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0010', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0011', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0012', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0013', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0014', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0015', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0016', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS08C0017', N'DS08')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0001', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0002', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0003', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0004', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0005', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0006', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0007', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0008', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0009', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0010', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0011', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0012', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0013', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0014', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0015', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0016', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0017', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS09C0018', N'DS09')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0001', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0002', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0003', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0004', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0005', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0006', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0007', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0008', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0009', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0010', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0011', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0012', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0013', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0014', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0015', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0016', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0017', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0018', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS10C0019', N'DS10')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0001', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0002', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0003', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0004', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0005', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0006', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0007', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0008', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0009', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0010', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0011', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0012', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0013', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0014', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0015', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0016', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0017', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0018', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0019', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS11C0020', N'DS11')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0001', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0002', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0003', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0004', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0005', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0006', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0007', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0008', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0009', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS12C0010', N'DS12')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0001', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0002', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0003', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0004', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0005', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0006', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0007', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0008', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0009', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0010', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS13C0011', N'DS13')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0001', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0002', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0003', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0004', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0005', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0006', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0007', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0008', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0009', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0010', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0011', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS14C0012', N'DS14')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0001', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0002', N'DS15')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0003', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0004', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0005', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0006', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0007', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0008', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0009', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0010', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0011', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0012', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS15C0013', N'DS15')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0001', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0002', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0003', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0004', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0005', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0006', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0007', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0008', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0009', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0010', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0011', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0012', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0013', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS16C0014', N'DS16')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0001', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0002', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0003', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0004', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0005', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0006', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0007', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0008', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0009', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0010', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0011', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0012', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0013', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0014', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS17C0015', N'DS17')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0001', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0002', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0003', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0004', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0005', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0006', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0007', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0008', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0009', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0010', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0011', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0012', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0013', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0014', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0015', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS18C0016', N'DS18')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0001', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0002', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0003', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0004', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0005', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0006', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0007', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0008', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0009', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0010', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0011', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0012', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0013', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0014', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0015', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0016', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS19C0017', N'DS19')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0001', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0002', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0003', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0004', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0005', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0006', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0007', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0008', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0009', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0010', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0011', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0012', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0013', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0014', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0015', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0016', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0017', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS20C0018', N'DS20')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0001', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0002', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0003', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0004', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0005', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0006', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0007', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0008', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0009', N'DS21')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0010', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0011', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0012', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0013', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0014', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0015', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0016', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0017', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0018', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS21C0019', N'DS21')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0001', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0002', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0003', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0004', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0005', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0006', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0007', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0008', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0009', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0010', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0011', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0012', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0013', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0014', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0015', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0016', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0017', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0018', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0019', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS22C0020', N'DS22')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0001', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0002', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0003', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0004', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0005', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0006', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0007', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0008', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0009', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS23C0010', N'DS23')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0001', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0002', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0003', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0004', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0005', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0006', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0007', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0008', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0009', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0010', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS24C0011', N'DS24')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0001', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0002', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0003', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0004', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0005', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0006', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0007', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0008', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0009', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0010', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0011', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS25C0012', N'DS25')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0001', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0002', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0003', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0004', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0005', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0006', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0007', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0008', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0009', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0010', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0011', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0012', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS26C0013', N'DS26')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0001', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0002', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0003', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0004', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0005', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0006', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0007', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0008', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0009', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0010', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0011', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0012', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0013', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS27C0014', N'DS27')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0001', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0002', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0003', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0004', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0005', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0006', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0007', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0008', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0009', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0010', N'DS28')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0011', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0012', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0013', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0014', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS28C0015', N'DS28')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0001', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0002', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0003', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0004', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0005', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0006', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0007', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0008', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0009', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0010', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0011', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0012', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0013', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0014', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0015', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS29C0016', N'DS29')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0001', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0002', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0003', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0004', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0005', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0006', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0007', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0008', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0009', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0010', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0011', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0012', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0013', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0014', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0015', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0016', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS30C0017', N'DS30')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0001', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0002', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0003', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0004', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0005', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0006', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0007', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0008', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0009', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0010', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0011', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0012', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0013', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0014', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0015', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0016', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0017', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS31C0018', N'DS31')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0001', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0002', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0003', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0004', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0005', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0006', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0007', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0008', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0009', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0010', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0011', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0012', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0013', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0014', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0015', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0016', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0017', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0018', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS32C0019', N'DS32')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0001', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0002', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0003', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0004', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0005', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0006', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0007', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0008', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0009', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0010', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0011', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0012', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0013', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0014', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0015', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0016', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0017', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0018', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0019', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS33C0020', N'DS33')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0001', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0002', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0003', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0004', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0005', N'DS34')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0006', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0007', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0008', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0009', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS34C0010', N'DS34')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0001', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0002', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0003', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0004', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0005', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0006', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0007', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0008', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0009', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0010', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS35C0011', N'DS35')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0001', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0002', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0003', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0004', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0005', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0006', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0007', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0008', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0009', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0010', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0011', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS36C0012', N'DS36')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0001', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0002', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0003', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0004', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0005', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0006', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0007', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0008', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0009', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0010', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0011', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0012', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS37C0013', N'DS37')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0001', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0002', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0003', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0004', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0005', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0006', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0007', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0008', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0009', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0010', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0011', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0012', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0013', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS38C0014', N'DS38')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0001', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0002', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0003', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0004', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0005', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0006', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0007', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0008', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0009', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0010', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0011', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0012', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0013', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0014', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS39C0015', N'DS39')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0001', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0002', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0003', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0004', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0005', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0006', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0007', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0008', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0009', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0010', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0011', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0012', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0013', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0014', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0015', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS40C0016', N'DS40')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0001', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0002', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0003', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0004', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0005', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0006', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0007', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0008', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0009', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0010', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0011', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0012', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0013', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0014', N'DS41')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0015', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0016', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS41C0017', N'DS41')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0001', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0002', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0003', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0004', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0005', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0006', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0007', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0008', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0009', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0010', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0011', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0012', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0013', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0014', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0015', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0016', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0017', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS42C0018', N'DS42')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0001', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0002', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0003', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0004', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0005', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0006', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0007', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0008', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0009', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0010', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0011', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0012', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0013', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0014', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0015', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0016', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0017', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0018', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS43C0019', N'DS43')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0001', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0002', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0003', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0004', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0005', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0006', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0007', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0008', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0009', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0010', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0011', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0012', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0013', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0014', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0015', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0016', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0017', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0018', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0019', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS44C0020', N'DS44')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0001', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0002', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0003', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0004', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0005', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0006', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0007', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0008', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0009', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS45C0010', N'DS45')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0001', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0002', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0003', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0004', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0005', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0006', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0007', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0008', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0009', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0010', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS46C0011', N'DS46')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0001', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0002', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0003', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0004', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0005', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0006', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0007', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0008', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0009', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0010', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0011', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS47C0012', N'DS47')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0001', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0002', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0003', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0004', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0005', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0006', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0007', N'DS48')
GO
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0008', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0009', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0010', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0011', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0012', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS48C0013', N'DS48')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0001', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0002', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0003', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0004', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0005', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0006', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0007', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0008', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0009', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0010', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0011', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0012', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0013', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS49C0014', N'DS49')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0001', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0002', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0003', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0004', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0005', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0006', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0007', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0008', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0009', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0010', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0011', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0012', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0013', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0014', N'DS50')
INSERT [dbo].[CuonSach] ([MaCuon], [MaSach]) VALUES (N'DS50C0015', N'DS50')
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'N000', N'N000')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV01', N'NV01')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV02', N'12345')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV03', N'NV03')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV06', N'12345')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV07', N'NV07')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV08', N'NV08')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV09', N'NV09')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'NV20', N'12345')
GO
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS01', N'Số đỏ', N'TG01', N'NXB01', N'TL01', 120000.0000, 10)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS02', N'Đắc nhân tâm', N'TG02', N'NXB02', N'TL02', 150000.0000, 11)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS03', N'Tiếng chuông nguyện hồn', N'TG03', N'NXB03', N'TL03', 90000.0000, 12)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS04', N'Chúng ta', N'TG04', N'NXB04', N'TL04', 80000.0000, 13)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS05', N'Nhà giả kim', N'TG05', N'NXB05', N'TL05', 110000.0000, 14)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS06', N'Quốc gia chủ nghĩa và bản chất của chủ nghĩa quốc gia', N'TG06', N'NXB06', N'TL06', 95000.0000, 15)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS07', N'Tiếng anh giao tiếp', N'TG07', N'NXB07', N'TL07', 75000.0000, 16)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS08', N'Thần thoại Hy Lạp', N'TG08', N'NXB08', N'TL08', 85000.0000, 17)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS09', N'Chuyện xưa Kinh Kịch', N'TG09', N'NXB09', N'TL09', 92000.0000, 18)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS10', N'Lập trình C++ cơ bản', N'TG10', N'NXB10', N'TL10', 105000.0000, 19)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS11', N'Dấu chân trên cát', N'TG11', N'NXB11', N'TL11', 88000.0000, 20)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS12', N'Những bí mật của cơ thể', N'TG12', N'NXB12', N'TL12', 98000.0000, 10)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS13', N'Bí mật của tôi', N'TG13', N'NXB13', N'TL13', 75000.0000, 11)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS14', N'Đại học tư duy', N'TG14', N'NXB14', N'TL14', 110000.0000, 12)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS15', N'Tiếng hàn cho người mới bắt đầu', N'TG15', N'NXB15', N'TL15', 125000.0000, 13)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS16', N'Tiếng Nhật cho mọi người', N'TG16', N'NXB16', N'TL16', 97000.0000, 14)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS17', N'Bí mật của trí tuệ', N'TG17', N'NXB17', N'TL17', 88000.0000, 15)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS18', N'Tâm hồn người lái xe', N'TG18', N'NXB18', N'TL18', 80000.0000, 16)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS19', N'Những bí mật của bóng đá', N'TG19', N'NXB19', N'TL19', 102000.0000, 17)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS20', N'Tâm hồn nấu ăn', N'TG20', N'NXB20', N'TL20', 93000.0000, 18)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS21', N'Tâm hồn văn chương', N'TG21', N'NXB21', N'TL21', 85000.0000, 19)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS22', N'Tâm hồn lịch sử', N'TG22', N'NXB22', N'TL22', 92000.0000, 20)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS23', N'Tâm hồn nghệ thuật', N'TG23', N'NXB23', N'TL23', 110000.0000, 10)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS24', N'Tâm hồn tri thức', N'TG24', N'NXB24', N'TL24', 98000.0000, 11)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS25', N'Tâm hồn trinh thám', N'TG25', N'NXB25', N'TL25', 105000.0000, 12)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS26', N'Tâm hồn thủ công mỹ nghệ', N'TG26', N'NXB26', N'TL26', 120000.0000, 13)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS27', N'Tâm hồn kỹ thuật', N'TG27', N'NXB27', N'TL27', 90000.0000, 14)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS28', N'Tâm hồn văn bản học', N'TG28', N'NXB28', N'TL28', 98000.0000, 15)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS29', N'Tâm hồn phong cách sống', N'TG29', N'NXB29', N'TL29', 110000.0000, 16)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS30', N'Tâm hồn tình cảm', N'TG30', N'NXB30', N'TL30', 92000.0000, 17)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS31', N'Tâm hồn nông nghiệp', N'TG30', N'NXB30', N'TL30', 88000.0000, 18)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS32', N'Tâm hồn phụ nữ thành phố Hồ Chí Minh', N'TG30', N'NXB30', N'TL30', 97000.0000, 19)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS33', N'Muôn kiếp nhân sinh', N'TG01', N'NXB01', N'TL01', 125000.0000, 20)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS34', N'Bí mật tư duy triệu phú', N'TG02', N'NXB02', N'TL02', 98000.0000, 10)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS35', N'Tiếng gọi nơi hoang dã', N'TG03', N'NXB03', N'TL03', 90000.0000, 11)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS36', N'Nghìn lẻ một đêm', N'TG04', N'NXB04', N'TL04', 80000.0000, 12)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS37', N'Một lít nước mắt', N'TG05', N'NXB05', N'TL05', 110000.0000, 13)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS38', N'Tin tức thời sự', N'TG06', N'NXB06', N'TL06', 95000.0000, 14)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS39', N'Chúng ta là những loài lớn', N'TG07', N'NXB07', N'TL07', 75000.0000, 15)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS40', N'Tiếng chuông nguyện hồn', N'TG08', N'NXB08', N'TL08', 85000.0000, 16)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS41', N'Bí mật của trí tuệ', N'TG09', N'NXB09', N'TL09', 92000.0000, 17)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS42', N'Dạy con làm giàu', N'TG10', N'NXB10', N'TL10', 105000.0000, 18)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS43', N'Cây lúa hạt vàng', N'TG11', N'NXB11', N'TL11', 88000.0000, 19)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS44', N'Những bí mật của bóng đá', N'TG12', N'NXB12', N'TL12', 98000.0000, 20)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS45', N'Hồn ma tốt bụng', N'TG13', N'NXB13', N'TL13', 75000.0000, 10)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS46', N'Bí mật của tôi', N'TG14', N'NXB14', N'TL14', 110000.0000, 11)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS47', N'Lập trình C++ nâng cao', N'TG15', N'NXB15', N'TL15', 125000.0000, 12)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS48', N'Tiếng Nhật cho mọi người', N'TG16', N'NXB16', N'TL16', 97000.0000, 13)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS49', N'Chúng ta là những loài nhỏ bé', N'TG17', N'NXB17', N'TL17', 88000.0000, 14)
INSERT [dbo].[DauSach] ([MaSach], [TenSach], [MaTacGia], [MaNXB], [MaTheLoai], [Gia], [SoLuong]) VALUES (N'DS50', N'Tâm hồn người lái xe', N'TG18', N'NXB18', N'TL18', 80000.0000, 15)
GO
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG01', N'Nguyễn Văn An', N'Nam', N'123453789032', N'123 Đường ABC, Quận XYZ', N'0123456789', N'nguyenvanan@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG02', N'Nguyễn Thị Bảo Ngọc', N'Nữ', N'987654321012', N'456 Đường XYZ, Quận ABC', N'0987654321', N'nguyenthibaongoc@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG03', N'Trần Văn Hường', N'Nam', N'345678931234', N'789 Đường LMN, Quận PQR', N'0123456789', N'tranvancuong@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG04', N'Lê Thị Diệu Linh', N'Nữ', N'562890123456', N'012 Đường XYZ, Quận ABC', N'0987654321', N'lethidieulinh@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG05', N'Phạm Văn Dương', N'Nam', N'782012345678', N'456 Đường ABC, Quận XYZ', N'0123456789', N'phamvanduong@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG06', N'Nguyễn Thị Hương', N'Nữ', N'901214567890', N'789 Đường XYZ, Quận ABC', N'0987654321', N'nguyenthihuong@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG07', N'Vũ Văn Khánh', N'Nam', N'123456782012', N'123 Đường PQR, Quận XYZ', N'0123456789', N'vuvankhanh@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG08', N'Hồ Thị Lan Anh', N'Nữ', N'345678501234', N'456 Đường XYZ, Quận ABC', N'0987654321', N'hothilanh@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG09', N'Mai Văn Minh', N'Nam', N'567890523456', N'789 Đường ABC, Quận XYZ', N'0123456789', N'maivanminh@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG10', N'Nguyễn Thị Ngọc', N'Nữ', N'789012395678', N'012 Đường XYZ, Quận ABC', N'0987654321', N'nguyenthingoc@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG11', N'Lê Văn Quân', N'Nam', N'901224567890', N'789 Đường XYZ, Quận ABC', N'0123456789', N'levanquan@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG12', N'Mai Thị Quỳnh', N'Nữ', N'123456489012', N'123 Đường PQR, Quận XYZ', N'0987654321', N'maithiquynh@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG13', N'Phạm Thị Thu', N'Nữ', N'345678903234', N'456 Đường XYZ, Quận ABC', N'0123456789', N'phamthithu@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG14', N'Đỗ Văn Tân', N'Nam', N'567870123456', N'789 Đường ABC, Quận XYZ', N'0987654321', N'dovantan@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG15', N'Nguyễn Thị Uyên', N'Nữ', N'789012375678', N'012 Đường XYZ, Quận ABC', N'0123456789', N'nguyenthigiau@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG16', N'Võ Thị Vân', N'Nữ', N'901234563890', N'789 Đường XYZ, Quận ABC', N'0987654321', N'vothivan@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG17', N'Lê Văn Vinh', N'Nam', N'123434789012', N'123 Đường PQR, Quận XYZ', N'0123456789', N'levanvinh@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG18', N'Trần Thị Trang', N'Nữ', N'345678911234', N'456 Đường XYZ, Quận ABC', N'0987654321', N'tranthitrang@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG19', N'Phạm Văn Phú', N'Nam', N'567890123956', N'789 Đường ABC, Quận XYZ', N'0123456789', N'phamvanphu@gmail.com')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [GioiTinh], [CCCD], [DiaChi], [SDT], [Email]) VALUES (N'DG20', N'Nguyễn Thị Phương', N'Nữ', N'789512345678', N'012 Đường XYZ, Quận ABC', N'0987654321', N'nguyenthiphuong@gmail.com')
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'N000', N'Lan ANh', N'134511890123', N'0123456783', N'456 Đường STU, Quận XYZ', N'lethiquynh@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV01', N'Trần Văn Đại', N'456789012345', N'0123456789', N'789 Đường XYZ, Quận ABC', N'tranvandai@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV02', N'Nguyễn Thị My', N'567890123456', N'0987654321', N'012 Đường ABC, Quận XYZ', N'nguyenthiha@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV03', N'Lê Văn Khôi', N'678901234567', N'0123456780', N'234 Đường XYZ, Quận DEF', N'levankhoi@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV06', N'Trần Đức Minh', N'901234567890', N'0987654323', N'890 Đường JKL, Quận MNO', N'tranducminh@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV07', N'Nguyễn Thị Ngọc', N'012345678901', N'0123456782', N'012 Đường MNO, Quận PQR', N'nguyenthingoc@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV08', N'Đỗ Văn Phúc', N'123456789012', N'0987654324', N'234 Đường PQR, Quận STU', N'dovanphuc@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV09', N'Lê Thị Quỳnh', N'234567890123', N'0123456783', N'456 Đường STU, Quận XYZ', N'lethiquynh@gmail.com')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [CCCD], [SDT], [DiaChi], [Email]) VALUES (N'NV20', N'hihi', N'234511890123', N'0123456783', N'456 Đường STU, Quận XYZ', N'lethiquynh@gmail.com')
GO
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB01', N'Kim Đồng')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB02', N'Trẻ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB03', N'Dân Trí')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB04', N'Lao Động')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB05', N'Hội Nhà Văn')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB06', N'Giáo dục Việt Nam')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB07', N'Tổng hợp TP.HCM')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB08', N'Văn hóa - Thông tin')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB09', N'Lao động - Xã hội')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB10', N'Đại học Quốc gia Hà Nội')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB11', N'Hồng Đức')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB12', N'Văn Hóa - Thông Tin')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB13', N'Nhã Nam')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB14', N'Tổng Hợp')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB15', N'Kim Đồng')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB16', N'Chính trị quốc gia sự thật')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB17', N'Tư Pháp')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB18', N'Đại Học Quốc Gia TP.HCM')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB19', N'Phụ Nữ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB20', N'Đông A')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB21', N'Văn Nghệ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB22', N'Phan Huy')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB23', N'Sài Gòn')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB24', N'Tân Văn')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB25', N'Hải Dương')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB26', N'Công An Nhân Dân')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB27', N'Y Học')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB28', N'Đà Nẵng')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB29', N'Lịch Sử')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB]) VALUES (N'NXB30', N'Văn Hoá Đọc')
GO
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT01', N'DG01', N'NV01', CAST(N'2023-01-01' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT02', N'DG02', N'NV02', CAST(N'2023-01-02' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT03', N'DG03', N'NV03', CAST(N'2023-01-03' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT06', N'DG06', N'NV06', CAST(N'2023-02-06' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT07', N'DG07', N'NV07', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT08', N'DG08', N'NV08', CAST(N'2023-02-08' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT09', N'DG09', N'NV09', CAST(N'2023-02-09' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT11', N'DG11', N'NV01', CAST(N'2023-03-11' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT12', N'DG12', N'NV02', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT13', N'DG13', N'NV03', CAST(N'2023-03-13' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT16', N'DG16', N'NV06', CAST(N'2023-04-16' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT17', N'DG17', N'NV07', CAST(N'2023-04-17' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT18', N'DG18', N'NV08', CAST(N'2023-04-18' AS Date))
INSERT [dbo].[PhieuMuonTra] ([MaPhieu], [MaDocGia], [MaNhanVien], [NgayMuon]) VALUES (N'PMT19', N'DG19', N'NV09', CAST(N'2023-04-19' AS Date))
GO
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG01', N'Nguyễn Nhật Ánh')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG02', N'Trí tuệ Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG03', N'Tạ Chí Đại Trường')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG04', N'Nguyễn Xuân Khánh')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG05', N'Trần Trung Đạo')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG06', N'Lê Thị Thu Hiền')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG07', N'Phạm Minh Hiền')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG08', N'Nguyễn Minh Châu')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG09', N'Vũ Văn Hiền')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG10', N'Lê Thị Thu Phương')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG11', N'Phạm Hoàng Sơn')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG12', N'Trần Hải Đăng')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG13', N'Đoàn Minh Hương')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG14', N'Nguyễn Anh Tuấn')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG15', N'Vũ Ngọc Phượng')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG16', N'Nguyễn Thị Lan Anh')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG17', N'Nguyễn Thị Huyền')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG18', N'Đỗ Thị Hà')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG19', N'Lê Thị Thúy Anh')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG20', N'Nguyễn Văn Tèo')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG21', N'Phạm Thị Đỏ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG22', N'Hoàng Minh Tiến')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG23', N'Trần Đức Việt')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG24', N'Nguyễn Thị Kim Anh')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG25', N'Trương Đình Luyện')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG26', N'Vũ Ngọc Hiếu')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG27', N'Nguyễn Thị Thanh Tâm')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG28', N'Đỗ Minh Quân')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG29', N'Phan Thị Hương')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia]) VALUES (N'TG30', N'Lê Thị Mai')
GO
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL01', N'Tiểu thuyết')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL02', N'Kinh tế')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL03', N'Sách khoa học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL04', N'Truyện ngắn')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL05', N'Sách thiếu nhi')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL06', N'Tâm lý học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL07', N'Chính trị')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL08', N'Sách văn hóa')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL09', N'Thơ')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL10', N'Kiến thức tổng hợp')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL11', N'Thương mại')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL12', N'Lịch sử')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL13', N'Sách giáo trình')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL14', N'Du lịch')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL15', N'Nghệ thuật')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL16', N'Khoa học viễn tưởng')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL17', N'Thể dục thể thao')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL18', N'Sách kỹ năng sống')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL19', N'Tự truyện')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL20', N'Sách tôn giáo')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL21', N'Thực phẩm - Nấu ăn')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL22', N'Dinh dưỡng')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL23', N'Sách nghệ thuật sống')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL24', N'Sách nấu ăn')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL25', N'Sách trinh thám')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL26', N'Thủ công mỹ nghệ')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL27', N'Kỹ thuật')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL28', N'Sách văn bản học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL29', N'Phong cách sống')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL30', N'Sách tình cảm')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__DocGia__A955A0AAE85704D5]    Script Date: 11/24/2023 9:58:45 PM ******/
ALTER TABLE [dbo].[DocGia] ADD UNIQUE NONCLUSTERED 
(
	[CCCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__A955A0AAC17E4741]    Script Date: 11/24/2023 9:58:45 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[CCCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_MuonTra] ADD  DEFAULT ((0)) FOR [SoNgayQuaHan]
GO
ALTER TABLE [dbo].[CT_MuonTra]  WITH CHECK ADD FOREIGN KEY([MaCuon])
REFERENCES [dbo].[CuonSach] ([MaCuon])
GO
ALTER TABLE [dbo].[CT_MuonTra]  WITH CHECK ADD FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuMuonTra] ([MaPhieu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CuonSach]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[DauSach] ([MaSach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangNhap]  WITH CHECK ADD FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[DangNhap]  WITH CHECK ADD  CONSTRAINT [FK_DangNhap_NhanVien] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangNhap] CHECK CONSTRAINT [FK_DangNhap_NhanVien]
GO
ALTER TABLE [dbo].[DauSach]  WITH CHECK ADD FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NXB] ([MaNXB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DauSach]  WITH CHECK ADD FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DauSach]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DauSach_TheLoai]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[DauSach] ([MaSach])
GO
ALTER TABLE [dbo].[DauSach_TheLoai]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[PhieuMuonTra]  WITH CHECK ADD FOREIGN KEY([MaDocGia])
REFERENCES [dbo].[DocGia] ([MaDocGia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuMuonTra]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SangTac]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[DauSach] ([MaSach])
GO
ALTER TABLE [dbo].[SangTac]  WITH CHECK ADD FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
GO
ALTER TABLE [dbo].[CT_MuonTra]  WITH CHECK ADD CHECK  (([ThanhToan]=N'CT' OR [ThanhToan]=N'ĐT'))
GO
ALTER TABLE [dbo].[CT_MuonTra]  WITH CHECK ADD CHECK  (([TienPhat]>=(0)))
GO
ALTER TABLE [dbo].[CT_MuonTra]  WITH CHECK ADD CHECK  (([TinhTrang]=N'Mất' OR [TinhTrang]=N'Hư' OR [TinhTrang]=N'BT'))
GO
ALTER TABLE [dbo].[DauSach]  WITH CHECK ADD CHECK  (([Gia]>=(0)))
GO
ALTER TABLE [dbo].[DauSach]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[DocGia]  WITH CHECK ADD CHECK  ((len([CCCD])=(12)))
GO
ALTER TABLE [dbo].[DocGia]  WITH CHECK ADD CHECK  (([Email] like '%_@_%._%'))
GO
ALTER TABLE [dbo].[DocGia]  WITH CHECK ADD CHECK  (([GioiTinh]=N'Nữ' OR [GioiTinh]=N'Nam'))
GO
ALTER TABLE [dbo].[DocGia]  WITH CHECK ADD CHECK  ((len([SDT])=(10)))
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD CHECK  ((len([CCCD])=(12)))
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD CHECK  ((len([SDT])=(10)))
GO
/****** Object:  StoredProcedure [dbo].[proc_SuaDocGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc5 Sửa thông tin độc giả--
CREATE   PROCEDURE [dbo].[proc_SuaDocGia]
    @MaDocGia NVARCHAR(10),
    @TenDocGia NVARCHAR(50),
    @GioiTinh NVARCHAR(4),
    @CCCD NVARCHAR(12),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(10),
    @Email NVARCHAR(50)
AS
BEGIN
    UPDATE DocGia
    SET TenDocGia = @TenDocGia,
        GioiTinh = @GioiTinh,
        CCCD = @CCCD,
        DiaChi = @DiaChi,
        SDT = @SDT,
        Email = @Email
    WHERE MaDocGia = @MaDocGia;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SuaNhanVien]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- proc13 Sửa nhân viên
CREATE   PROCEDURE [dbo].[proc_SuaNhanVien]
    @MaNhanVien NVARCHAR(10),
    @HoTen NVARCHAR(50),
    @CCCD NVARCHAR(12),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(10),
    @Email NVARCHAR(50)
AS
BEGIN
    UPDATE NhanVien
    SET HoTen = @HoTen,
        CCCD = @CCCD,
        DiaChi = @DiaChi,
        SDT = @SDT,
        Email = @Email
    WHERE MaNhanVien = @MaNhanVien;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SuaPhieuMuon]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- proc8 Cập nhật phiếu mượn
CREATE   PROCEDURE [dbo].[proc_SuaPhieuMuon]
	@MaPhieu nvarchar(1000),
	@MaDocGia nvarchar(1000),
	@MaNhanVien nvarchar(1000),
	@NgayMuon date
AS
	BEGIN
		UPDATE PhieuMuonTra SET	
		MaPhieu = @MaPhieu, 
		MaDocGia = @MaDocGia, 
		MaNhanVien = @MaNhanVien, 
		NgayMuon = @NgayMuon
		WHERE MaPhieu = @MaPhieu
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SuaPhieuTra]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- pro10 Sửa phiếu trả
CREATE   PROCEDURE [dbo].[proc_SuaPhieuTra]
(
    @MaCuon NVARCHAR(10),
	@MaPhieu NVARCHAR(10),
    @NgayTra DATE,
    @TinhTrang NVARCHAR(10),
    @GhiChu NVARCHAR(200),
    @ThanhToan NVARCHAR(2)
)
AS
BEGIN
    UPDATE CT_MuonTra
    SET
		MaCuon = @MaCuon,
		MaPhieu = @MaPhieu,
        NgayTra = @NgayTra,
        TinhTrang = @TinhTrang,
        GhiChu = @GhiChu,
        ThanhToan = @ThanhToan
    WHERE
		MaCuon = @MaCuon
    RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SuaSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_SuaSach]
(
  @MaSach   nvarchar(10),
  @TenSach  nvarchar(100),
  @MaTacGia nvarchar(10),
  @NXB      nvarchar(10),
  @TheLoai  nvarchar(10),
  @DonGia   money,
  @SoLuong  int
)
AS
BEGIN
  UPDATE DauSach
  SET TenSach = @TenSach,
      MaTacGia = @MaTacGia,
      MaNXB = @NXB,
      MaTheLoai = @TheLoai,
      Gia = @DonGia,
      SoLuong = @SoLuong
  WHERE MaSach = @MaSach
  SELECT COUNT(*) AS SoLuong
  FROM DauSach
  WHERE MaSach = @MaSach
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ThayDoiMatKhau]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Trigger thay đổi mật khẩu
CREATE   PROC [dbo].[proc_ThayDoiMatKhau]
@TenDangNhap VARCHAR(10),
@MatKhau VARCHAR(20)
AS 
BEGIN
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @user NVARCHAR(10);
	DECLARE @newPassword NVARCHAR(20);
	SET @user = LTRIM(RTRIM(@TenDangNhap));
	SET @newPassword = LTRIM(RTRIM(@MatKhau));
	BEGIN TRANSACTION;
	BEGIN TRY
		SET @sql = 'ALTER LOGIN [' + @user + '] WITH PASSWORD = ''' + @newPassword + '''';
		EXEC(@sql);
		UPDATE DangNhap SET MatKhau = @newPassword WHERE TenDangNhap = @user;
	END TRY
	BEGIN CATCH
		DECLARE @err NVARCHAR(MAX);
		SET @err ='Không cập nhập được mật khẩu mới!';
		RAISERROR(@err, 16, 1);
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH;
	COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_ThemDocGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ĐỘC GIẢ--
-- proc4 Thêm độc giả
CREATE   PROCEDURE [dbo].[proc_ThemDocGia]
    @MaDocGia NVARCHAR(10),
    @TenDocGia NVARCHAR(50),
    @GioiTinh NVARCHAR(4),
    @CCCD NVARCHAR(12),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(10),
    @Email NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM DocGia WHERE MaDocGia = @MaDocGia)
    BEGIN
        RAISERROR(N'Mã độc giả đã tồn tại!', 16, 1);
        RETURN;
    END
	INSERT INTO DocGia (MaDocGia, TenDocGia, GioiTinh, CCCD, DiaChi, SDT, Email)
	VALUES (@MaDocGia, @TenDocGia, @GioiTinh, @CCCD, @DiaChi, @SDT, @Email);
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ThemNhanVien]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- NHÂN VIÊN--
-- proc12 Thêm nhân viên
CREATE   PROCEDURE [dbo].[proc_ThemNhanVien]
    @MaNhanVien NVARCHAR(10),
    @HoTen NVARCHAR(50),
    @CCCD NVARCHAR(12),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(10),
    @Email NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM NhanVien WHERE MaNhanVien = @MaNhanVien)
    BEGIN
        RAISERROR(N'Mã Nhân viên đã tồn tại!', 16, 1);
        RETURN;
    END
	INSERT INTO NhanVien (MaNhanVien, HoTen, CCCD, DiaChi, SDT, Email)
	VALUES (@MaNhanVien, @HoTen, @CCCD, @DiaChi, @SDT, @Email);
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ThemPhieuMuon]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- PHIẾU MƯỢN TRẢ
-- proc7 Thêm phiếu mượn
CREATE   PROCEDURE [dbo].[proc_ThemPhieuMuon]
	@MaPhieu nvarchar(10),
	@MaDocGia nvarchar(10),
	@MaNhanVien nvarchar(10),
	@NgayMuon date
AS
BEGIN
	IF EXISTS (SELECT 1 FROM PhieuMuonTra WHERE MaPhieu =@MaPhieu)
	BEGIN
		RAISERROR(N'Mã phiếu đã tồn tại!', 16, 1);
		RETURN;
	END
	INSERT INTO PhieuMuonTra (MaPhieu, MaDocGia, MaNhanVien, NgayMuon)
	VALUES (@MaPhieu, @MaDocGia, @MaNhanVien, @NgayMuon)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ThemPhieuTra]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc9 Thêm phiếu trả
CREATE   PROCEDURE [dbo].[proc_ThemPhieuTra]
(
    @MaPhieu NVARCHAR(10),
    @MaCuon NVARCHAR(10),
    @NgayTra DATE,
    @TinhTrang NVARCHAR(10),
    @GhiChu NVARCHAR(200),
    @ThanhToan NVARCHAR(2)
)
AS
BEGIN
    IF EXISTS(SELECT 1 FROM CT_MuonTra WHERE MaCuon = @MaCuon)
    BEGIN
		RAISERROR (N'Mã Cuốn đã tồn tại!',16,1);
        RETURN;
    END
    INSERT INTO CT_MuonTra (MaCuon, MaPhieu, NgayTra, TinhTrang, GhiChu, ThanhToan)
    VALUES (@MaCuon, @MaPhieu, @NgayTra, @TinhTrang, @GhiChu, @ThanhToan)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ThemSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_ThemSach]
  @MaSach   nvarchar(10),
  @TenSach  nvarchar(100),
  @MaTacGia nvarchar(10),
  @NXB      nvarchar(10),
  @TheLoai  nvarchar(10),
  @DonGia   money,
  @SoLuong  int
AS
BEGIN
	IF EXISTS (SELECT 1 FROM DauSach WHERE MaSach = @MaSach)
    BEGIN
        RAISERROR(N'Mã sách đã tồn tại!', 16, 1);
        RETURN;
    END
  INSERT INTO DauSach (MaSach, TenSach, MaTacGia, MaNXB, MaTheLoai, Gia, SoLuong)
  VALUES (@MaSach, @TenSach, @MaTacGia, @NXB, @TheLoai, @DonGia, @SoLuong)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ThongKeSachDuocMuonNhieuNhat]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- proc15 Thống kê sách được mượn nhiều nhất theo theo lượng giảm dần
CREATE   PROCEDURE [dbo].[proc_ThongKeSachDuocMuonNhieuNhat]
AS
BEGIN
    SELECT
        DS.MaSach,
        DS.TenSach,
        COUNT(CT.MaCuon) AS SoLuongMuon
    FROM DauSach DS
    INNER JOIN CuonSach CS ON DS.MaSach = CS.MaSach
    INNER JOIN CT_MuonTra CT ON CS.MaCuon = CT.MaCuon
    GROUP BY DS.MaSach, DS.TenSach
    ORDER BY SoLuongMuon DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_ThongKeSachTheoTacGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc17 Thống kê sách theo tên tác giả
CREATE   PROCEDURE [dbo].[proc_ThongKeSachTheoTacGia]
AS
BEGIN
    SELECT
        TG.MaTacGia AS MaTacGia,
        TG.TenTacGia AS TenTacGia,
        COUNT(DS.MaSach) AS SoLuongSach
    FROM TacGia TG
    INNER JOIN DauSach DS ON TG.MaTacGia = DS.MaTacGia
    GROUP BY TG.MaTacGia, TG.TenTacGia
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_ThongKeSachTheoTheLoai]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc16 Thống kê sách theo thể loại
CREATE PROCEDURE [dbo].[proc_ThongKeSachTheoTheLoai]
AS
BEGIN
    SELECT
        TL.MaTheLoai AS MaTheLoai,
        TL.TenTheLoai AS TenTheLoai,
        COUNT(DS.MaSach) AS SoLuongSach
    FROM TheLoai TL
    INNER JOIN DauSach DS ON TL.MaTheLoai = DS.MaTheLoai
    GROUP BY TL.MaTheLoai, TL.TenTheLoai
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_XoaDocGia]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc6 Xóa độc giả--
CREATE   PROCEDURE [dbo].[proc_XoaDocGia]
    @MaDocGia NVARCHAR(10)
AS
BEGIN
    -- Kiểm tra xem độc giả có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM DocGia WHERE MaDocGia = @MaDocGia)
    BEGIN
        RAISERROR(N'Độc giả không tồn tại!', 16, 1);
        RETURN;
    END
    -- Xóa độc giả từ bảng DocGia
    DELETE FROM DocGia WHERE MaDocGia = @MaDocGia;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_XoaNhanVien]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- proc14 Xóa nhân viên
CREATE   PROCEDURE [dbo].[proc_XoaNhanVien]
    @MaNhanVien NVARCHAR(10)
AS
BEGIN
    -- Kiểm tra xem nhân viên có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNhanVien = @MaNhanVien)
    BEGIN
        RAISERROR(N'Nhân Viên không tồn tại!', 16, 1);
        RETURN;
    END
    -- Xóa Nhân viên từ bảng NhanVien
    DELETE FROM NhanVien WHERE MaNhanVien = @MaNhanVien;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_XoaPhieuTra]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- proc11 Xóa phiếu trả
CREATE   PROCEDURE [dbo].[proc_XoaPhieuTra] (
	@MaCuon NVARCHAR(10)
)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM CT_MuonTra WHERE MaCuon = @MaCuon)
	BEGIN 
		RAISERROR(N'Không tồn tại',16,1);
		RETURN 
	DELETE FROM CT_MuonTra
	WHERE MaCuon = @MaCuon;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_XoaSach]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc3 Xóa sách
CREATE PROCEDURE [dbo].[proc_XoaSach]
    @MaSach NVARCHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM DauSach WHERE MaSach = @MaSach)
    BEGIN
        RAISERROR(N'Mã sách không tồn tại!', 16, 1);
        RETURN;
    END
    DELETE FROM DauSach WHERE MaSach = @MaSach;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_XoaTaiKhoan]    Script Date: 11/24/2023 9:58:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Trigger xóa tài khoản
CREATE PROC [dbo].[proc_XoaTaiKhoan]
	@TenDangNhap NVARCHAR(10)
AS
DECLARE @sql NVARCHAR(2000);
DECLARE @sessionID INT;
SELECT @sessionID = session_id
FROM sys.dm_exec_sessions
WHERE login_name = @TenDangNhap;
IF @sessionID IS NOT NULL
BEGIN
	SET @sql = 'KILL ' + CONVERT(NVARCHAR(20), @sessionID);
	EXEC (@sql);
END;
BEGIN 
	BEGIN TRY
		SET @sql = 'DROP USER ' + @TenDangNhap;
		EXEC (@sql);
		SET @sql = 'DROP LOGIN ' + @TenDangNhap;
		EXEC (@sql);
		DELETE FROM DangNhap WHERE TenDangNhap = @TenDangNhap;
	END TRY
	BEGIN CATCH
		DECLARE @err NVARCHAR(MAX);
		SELECT @err = ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
	END CATCH;
END;
GO
