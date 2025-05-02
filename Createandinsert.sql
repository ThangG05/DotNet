/****** Object:  Table [dbo].[CongViec]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[MaCV] [varchar](10) NOT NULL,
	[TenCV] [nvarchar](100) NULL,
	[LuongThang] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDonDatHang]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonDatHang](
	[MaHang] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
	[ThanhTien] [int] NULL,
	[SoDDH] [int] IDENTITY(1,1) NOT NULL,
	[GiamGia] [int] NULL,
 CONSTRAINT [PK_CTDonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHoaDonNhap]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDonNhap](
	[SoHDN] [int] NOT NULL,
	[MaHang] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
	[GiamGia] [int] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK__CTHoaDon__E65FE305CA060DA3] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMHang]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMHang](
	[MaHang] [varchar](10) NOT NULL,
	[TenHang] [nvarchar](100) NULL,
	[MaLoai] [varchar](10) NULL,
	[MaNuocSX] [varchar](10) NULL,
	[MaHangSX] [varchar](10) NULL,
	[MaPhanh] [varchar](10) NULL,
	[MaMau] [varchar](10) NULL,
	[MaDongCo] [varchar](10) NULL,
	[MaTinhTrang] [varchar](10) NULL,
	[DungTichKhoang] [nvarchar](50) NULL,
	[Anh] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[DonGiaNhap] [int] NULL,
	[DonGiaBan] [int] NULL,
	[ThoiGianBaoHanh] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaNV] [varchar](10) NULL,
	[NgayMua] [date] NULL,
	[MaKH] [varchar](10) NULL,
	[Thue] [int] NULL,
	[TongTien] [int] NULL,
	[SoDDH] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongCo]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongCo](
	[MaDongCo] [varchar](10) NOT NULL,
	[TenDongCo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDongCo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSX]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSX](
	[MaHangSX] [varchar](10) NOT NULL,
	[TenHangSX] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHangSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[SoHDN] [varchar](10) NOT NULL,
	[MaNV] [varchar](10) NULL,
	[NgayNhap] [date] NULL,
	[MaNCC] [varchar](10) NULL,
	[TongTien] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap_New]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap_New](
	[SoHDN] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [varchar](10) NULL,
	[NgayNhap] [date] NULL,
	[MaNCC] [varchar](10) NULL,
	[TongTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](10) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [varchar](10) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](10) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[TenNV] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[MaCV] [varchar](10) NULL,
	[SoDienThoai] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NuocSX]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NuocSX](
	[MaNuocSX] [varchar](10) NOT NULL,
	[TenNuocSX] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNuocSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanhXe]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanhXe](
	[MaPhanh] [varchar](10) NOT NULL,
	[TenPhanh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTrang]    Script Date: 29/04/2025 10:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrang](
	[MaTinhTrang] [varchar](10) NOT NULL,
	[TenTinhTrang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTinhTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [LuongThang]) VALUES (N'CV01', N'Bán hàng', CAST(8000000.00 AS Decimal(18, 2)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [LuongThang]) VALUES (N'CV02', N'Kế toán', CAST(10000000.00 AS Decimal(18, 2)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [LuongThang]) VALUES (N'CV03', N'Bảo trì', CAST(8500000.00 AS Decimal(18, 2)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [LuongThang]) VALUES (N'CV04', N'Thủ kho', CAST(7000000.00 AS Decimal(18, 2)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [LuongThang]) VALUES (N'CV05', N'Quản lý', CAST(12000000.00 AS Decimal(18, 2)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [LuongThang]) VALUES (N'CV06', N'Giao hàng', CAST(6500000.00 AS Decimal(18, 2)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [LuongThang]) VALUES (N'CV07', N'IT', CAST(11000000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[CTDonDatHang] ON 

INSERT [dbo].[CTDonDatHang] ([MaHang], [SoLuong], [GiaBan], [ThanhTien], [SoDDH], [GiamGia]) VALUES (N'MH12', 1, 51000000, 51000000, 1, 5)
SET IDENTITY_INSERT [dbo].[CTDonDatHang] OFF
GO
INSERT [dbo].[CTHoaDonNhap] ([SoHDN], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (2, N'MH05', 2, 60000000, 1000000, 120000000)
GO
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH01', N'HONDA AIR BLADE', N'TL01', N'NSX01', N'HSX01', N'PX01', N'MS01', N'DC01', N'TT01', N'10L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\HONDAAIRBLADE.png', 10, 30000000, 35000000, N'24                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH02', N'HONDA PCX', N'TL02', N'NSX02', N'HSX01', N'PX02', N'MS02', N'DC02', N'TT01', N'5L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\hondapcx.png', 15, 25000000, 29000000, N'18                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH03', N'HONDA SH MODE', N'TL03', N'NSX03', N'HSX01', N'PX03', N'MS03', N'DC03', N'TT01', N'7L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\HONDASHMODE.png', 12, 45000000, 52000000, N'36                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH04', N'HONDA VISION', N'TL01', N'NSX01', N'HSX01', N'PX01', N'MS04', N'DC02', N'TT02', N'8L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\HONDAVISION.jpg', 8, 70000000, 75000000, N'24                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH05', N'HONDA VISION', N'TL01', N'NSX06', N'HSX01', N'PX04', N'MS05', N'DC01', N'TT01', N'9L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\hondawinner.jpg', 7, 60000000, 65000000, N'24                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH06', N'SUZUKI ADDRESS', N'TL06', N'NSX01', N'HSX03', N'PX06', N'MS06', N'DC01', N'TT01', N'3L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\suzukiaddress.png', 10, 20000000, 23000000, N'12                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH07', N'Suzuki Burgman Street', N'TL07', N'NSX07', N'HSX03', N'PX07', N'MS07', N'DC07', N'TT01', N'15L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\suzukiburgmanstreet.png', 5, 300000000, 320000000, N'36                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH08', N'Suzuki GSX R150', N'TL01', N'NSX01', N'HSX03', N'PX01', N'MS01', N'DC01', N'TT01', N'10L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\suzukigsxr150.png', 10, 30000000, 35000000, N'24                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH09', N'Suzuki GSX-S150', N'TL01', N'NSX01', N'HSX03', N'PX01', N'MS01', N'DC01', N'TT01', N'10L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\suzukigsxs150.png', 10, 30000000, 35000000, N'24                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH10', N'Suzuki Raider R150', N'TL02', N'NSX02', N'HSX03', N'PX02', N'MS02', N'DC02', N'TT01', N'5L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\suzukiraider.png', 15, 25000000, 29000000, N'18                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH11', N'Yamaha Exciter 155', N'TL03', N'NSX03', N'HSX02', N'PX03', N'MS03', N'DC03', N'TT01', N'7L', N'"D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\yahamaexciter.png"', 12, 45000000, 52000000, N'36                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH12', N'Yamaha Grand', N'TL03', N'NSX03', N'HSX02', N'PX03', N'MS03', N'DC03', N'TT01', N'7L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\yahamagrand.png', 11, 42000000, 51000000, N'12                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH13', N'Yamaha Freego', N'TL03', N'NSX03', N'HSX02', N'PX03', N'MS03', N'DC03', N'TT01', N'7L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\yamahafreego.png', 9, 44000000, 50000000, N'24                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH14', N'Yamaha Janus', N'TL03', N'NSX03', N'HSX02', N'PX03', N'MS03', N'DC03', N'TT01', N'7L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\yamahajanus.png', 8, 40000000, 53000000, N'36                                                ')
INSERT [dbo].[DMHang] ([MaHang], [TenHang], [MaLoai], [MaNuocSX], [MaHangSX], [MaPhanh], [MaMau], [MaDongCo], [MaTinhTrang], [DungTichKhoang], [Anh], [SoLuong], [DonGiaNhap], [DonGiaBan], [ThoiGianBaoHanh]) VALUES (N'MH15', N'Yamaha NVX', N'TL03', N'NSX03', N'HSX02', N'PX03', N'MS03', N'DC03', N'TT01', N'7L', N'D:\ALL MON HOC\.NET\ShopMotobike\HangHoa\yamahanvx.png', 10, 34000000, 44000000, N'12                                                ')
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaNV], [NgayMua], [MaKH], [Thue], [TongTien], [SoDDH]) VALUES (N'NV03', CAST(N'2004-12-03' AS Date), N'KH06', 2, 52020000, 1)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
INSERT [dbo].[DongCo] ([MaDongCo], [TenDongCo]) VALUES (N'DC01', N'125cc')
INSERT [dbo].[DongCo] ([MaDongCo], [TenDongCo]) VALUES (N'DC02', N'150cc')
INSERT [dbo].[DongCo] ([MaDongCo], [TenDongCo]) VALUES (N'DC03', N'175cc')
INSERT [dbo].[DongCo] ([MaDongCo], [TenDongCo]) VALUES (N'DC04', N'250cc')
INSERT [dbo].[DongCo] ([MaDongCo], [TenDongCo]) VALUES (N'DC05', N'300cc')
INSERT [dbo].[DongCo] ([MaDongCo], [TenDongCo]) VALUES (N'DC06', N'500cc')
INSERT [dbo].[DongCo] ([MaDongCo], [TenDongCo]) VALUES (N'DC07', N'1000cc')
GO
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'HSX01', N'Honda')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'HSX02', N'Yamaha')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'HSX03', N'Suzuki')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'HSX04', N'Kawasaki')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'HSX05', N'Piaggio')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'HSX06', N'VinFast')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'HSX07', N'Harley-Davidson')
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap_New] ON 

INSERT [dbo].[HoaDonNhap_New] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (2, N'NV03', CAST(N'2004-01-10' AS Date), N'NCC05', 119000000)
SET IDENTITY_INSERT [dbo].[HoaDonNhap_New] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH01', N'Lê Quốc Hưng', N'Hà Nội', N'0901234567')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH02', N'Phan Thị Lan', N'HCM', N'0902345678')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH03', N'Hoàng Văn Khải', N'Bình Dương', N'0903456789')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH04', N'Nguyễn Thị Mai', N'Đà Nẵng', N'0904567890')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH05', N'Võ Thanh Tùng', N'Cần Thơ', N'0905678901')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH06', N'Trịnh Văn Minh', N'Long An', N'0906789012')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH07', N'Đinh Thị Hoa', N'Hà Tĩnh', N'0907890123')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'MS01', N'Đỏ')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'MS02', N'Đen')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'MS03', N'Trắng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'MS04', N'Xanh dương')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'MS05', N'H?ng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'MS06', N'Xám')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'MS07', N'Nâu')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC01', N'Cty Linh kiện ABC', N'123 Lê Lợi, Q1', N'0281234567')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC02', N'Cty Phụ tùng Duy Tân', N'456 Tôn Đức Thắng, Q3', N'0282345678')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC03', N'Xe máy Thái Bình', N'789 Nguyễn Trãi, Hà Nội', N'0243456789')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC04', N'Cty Hưng Thịnh', N'32 Lý Thường Kiệt, HN', N'0244567890')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC05', N'Tranhuy Auto', N'22 Nguyễn Du, Đà Nẵng', N'0236363636')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC06', N'Phụ kiện Tuấn Anh', N'Hải Dương', N'0220123456')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC07', N'VinAuto Supply', N'Nha Trang', N'0258123456')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [MaCV], [SoDienThoai]) VALUES (N'NV01', N'Nguyễn Văn A', N'Nam', CAST(N'1990-01-01' AS Date), N'Hà Nội', N'CV01', N'0901234567')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [MaCV], [SoDienThoai]) VALUES (N'NV02', N'Trần Thị B', N'Nữ', CAST(N'1992-02-02' AS Date), N'Hồ Chí Minh', N'CV02', N'0912345678')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [MaCV], [SoDienThoai]) VALUES (N'NV03', N'Lê Văn C', N'Nam', CAST(N'1985-03-03' AS Date), N'Đà Nẵng', N'CV03', N'0923456789')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [MaCV], [SoDienThoai]) VALUES (N'NV04', N'Phạm Thị D', N'Nữ', CAST(N'1993-04-04' AS Date), N'Cần Thơ', N'CV04', N'0923456799')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [MaCV], [SoDienThoai]) VALUES (N'NV05', N'Vũ Văn E', N'Nam', CAST(N'1991-05-05' AS Date), N'Huế', N'CV05', N'0923412799')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [MaCV], [SoDienThoai]) VALUES (N'NV06', N'Đỗ Thị F', N'Nữ', CAST(N'1988-06-06' AS Date), N'Hải Phòng', N'CV06', N'0903412799')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [MaCV], [SoDienThoai]) VALUES (N'NV07', N'Bùi Văn G', N'Nam', CAST(N'1994-07-07' AS Date), N'Nha Trang', N'CV07', N'0903412129')
GO
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'NSX01', N'Việt Nam')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'NSX02', N'Nhật Bản')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'NSX03', N'Hàn Quốc')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'NSX04', N'Thái Lan')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'NSX05', N'Ấn Độ')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'NSX06', N'Ý')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'NSX07', N'Mỹ')
GO
INSERT [dbo].[PhanhXe] ([MaPhanh], [TenPhanh]) VALUES (N'PX01', N'Phanh đĩa')
INSERT [dbo].[PhanhXe] ([MaPhanh], [TenPhanh]) VALUES (N'PX02', N'Phanh cơ')
INSERT [dbo].[PhanhXe] ([MaPhanh], [TenPhanh]) VALUES (N'PX03', N'Phanh ABS')
INSERT [dbo].[PhanhXe] ([MaPhanh], [TenPhanh]) VALUES (N'PX04', N'Phanh CBS')
INSERT [dbo].[PhanhXe] ([MaPhanh], [TenPhanh]) VALUES (N'PX05', N'Phanh tang trống')
INSERT [dbo].[PhanhXe] ([MaPhanh], [TenPhanh]) VALUES (N'PX06', N'Phanh điện tử')
INSERT [dbo].[PhanhXe] ([MaPhanh], [TenPhanh]) VALUES (N'PX07', N'Phanh hỗn hợp')
GO
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'TL01', N'Xe ga')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'TL02', N'Xe số')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'TL03', N'Xe tay côn')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'TL04', N'Xe địa hình')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'TL05', N'Xe thể thao')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'TL06', N'Xe điện')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'TL07', N'Mô tô phân khối lớn')
GO
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (N'TT01', N'Mới 100%')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (N'TT02', N'Like new 99%')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (N'TT03', N'Cũ')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (N'TT04', N'Đã qua sử dụng')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (N'TT05', N'Mới tồn kho')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (N'TT06', N'Hàng trưng bày')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (N'TT07', N'Khác')
GO
ALTER TABLE [dbo].[CTDonDatHang]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[DMHang] ([MaHang])
GO
ALTER TABLE [dbo].[CTDonDatHang]  WITH CHECK ADD  CONSTRAINT [Fkdathang] FOREIGN KEY([SoDDH])
REFERENCES [dbo].[DonDatHang] ([SoDDH])
GO
ALTER TABLE [dbo].[CTDonDatHang] CHECK CONSTRAINT [Fkdathang]
GO
ALTER TABLE [dbo].[CTHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[DMHang] ([MaHang])
GO
ALTER TABLE [dbo].[DMHang]  WITH CHECK ADD FOREIGN KEY([MaDongCo])
REFERENCES [dbo].[DongCo] ([MaDongCo])
GO
ALTER TABLE [dbo].[DMHang]  WITH CHECK ADD FOREIGN KEY([MaHangSX])
REFERENCES [dbo].[HangSX] ([MaHangSX])
GO
ALTER TABLE [dbo].[DMHang]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[DMHang]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[DMHang]  WITH CHECK ADD FOREIGN KEY([MaNuocSX])
REFERENCES [dbo].[NuocSX] ([MaNuocSX])
GO
ALTER TABLE [dbo].[DMHang]  WITH CHECK ADD FOREIGN KEY([MaPhanh])
REFERENCES [dbo].[PhanhXe] ([MaPhanh])
GO
ALTER TABLE [dbo].[DMHang]  WITH CHECK ADD FOREIGN KEY([MaTinhTrang])
REFERENCES [dbo].[TinhTrang] ([MaTinhTrang])
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap_New]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap_New]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaCV])
REFERENCES [dbo].[CongViec] ([MaCV])
GO



