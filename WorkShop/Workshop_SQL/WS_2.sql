create database WS2
use WS2
-----
create table NhanVien(
	maNV varchar(10) primary key, 
	hoTen varchar(30), 
	chucDanh varchar(30),
	ngaySinh date, 
	ngayNhanViec datetime, 
	diaChi varchar(30), 
	phone varchar(15),
	photo varchar(10), 
	ghiChu varchar(30)
)
go

insert into NhanVien 
values('01', 'Lan Huong', 'Ban hang', '11/15/1993','1/13/2005', 'Hoa Binh',
'0361745624','<Binary>', null)
insert into NhanVien 
values('02', 'Bich Hue', 'Tiep thi', '12/31/1979','1/22/2001', 'Quang Binh',
'0987565223','<Binary>', null)
insert into NhanVien 
values('03', 'Tung Chi', 'Ban hang', '8/9/1986','1/14/2005', 'Hai Phong',
'0986567134','<Binary>', null)
insert into NhanVien 
values('04', 'Kien Cuong', 'Thu kho', '1/22/1979','9/19/2003', 'Ha Noi',
'0912341245','<Binary>', null)
select * from NhanVien
go
-----
create table NhaCungCap(
	maNhaCC varchar(10) primary key, 
	tenNhaCC varchar(30), 
	diaChi varchar(30),
	phone varchar(15), 
	fax varchar(20), 
	homePage varchar(30)
)
go

insert into NhaCungCap 
values('BAN', 'Cong ty Ban Mai', '64 Hang Bun', '048286745', null, 'www.binhminh.com')
insert into NhaCungCap 
values('OCE', 'Cong ty Ocean', '26 Tran Quy Cap', '048924712', null, 'www.ocean.com')
insert into NhaCungCap 
values('RDO', 'Cong ty Rang Dong', '97 Hoang Hoa Tha,', '048923711', null, 'www.rdong.com')
select  * from NhaCungCap
go
-----
create table KhachHang(
	maKH varchar(20) primary key, 
	tenKH varchar(30), 
	diaChi varchar(30),
	phone varchar(15), 
	email varchar(30)
)
go

insert into KhachHang 
values ('01', 'Hoa Binh', 'Ha Noi', '0987455144', 'hb@fpt.vn')
insert into KhachHang 
values ('02', 'Quang Long', 'Ha Noi', '0945251457', 'qlong@yahoo.vn')
insert into KhachHang 
values ('03', 'Nguyen Tuan', 'Hai Phong', '0124567256', 'Tuan@Yahoo.vn')
go
-----
create table LoaiSanPham(
	maLoaiSP varchar(10) primary key, 
	tenLoaiSP varchar(15), 
	moTa ntext
)
go

insert into LoaiSanPham values ('DL', 'Dien Lanh', null)
insert into LoaiSanPham values ('DT', 'Dien Tu', null)
insert into LoaiSanPham values ('MP', 'Hang my pham', null)
insert into LoaiSanPham values ('TD', 'Hang tieu dung', null)
go
-----
create table HoaDon(
	maHD varchar(10) primary key, 
	maKH varchar(20) foreign key references KhachHang(maKH),
	maNV varchar(10) foreign key references NhanVien(maNV),
	ngayLapHD smalldatetime, 
	ngayNhanHang smalldatetime,  
	tien int, thue real, 
	tongSoTien int
)
go

insert into HoaDon 
values ('01', '02', '01', '12/14/2007', '12/15/2007', '0', '0.05', '0')
insert into HoaDon 
values ('02', '01', '01', '1/19/2006', '2/15/2006', '0', '0.05', '0')
insert into HoaDon 
values ('03', '02', '02', '10/30/2006','1/1/2006', '0', '0.1', '0')
select  * from HoaDon
-----
go

create table SanPham(
	maSP varchar(10) primary key, 
	tenSP varchar(40),
	maNhaCC varchar(10) foreign key references NhaCungCap(maNhaCC),
	maLoaiSP varchar(10)foreign key references LoaiSanPham(maLoaiSP),
	DVT varchar(20),
	donGia smallint, 
	soLuong smallint, 
	soLuongTT smallint, 
	Discontinued bit
)
go

insert into SanPham 
values('001', 'Vo tuyen', 'BAN', 'DT', 'Chiec', '4000', '25', '5', '0')
insert into SanPham 
values('002', 'Radio', 'BAN', 'DT', 'Chiec', '200', '150', '20', '0')
insert into SanPham 
values('003', 'CD player', 'BAN', 'DT', 'Chiec', '2000', '45', '10', '0')
insert into SanPham 
values('004', 'Tu lanh', 'RDO', 'DT', 'Chiec', '6000', '22', '5', '0')
insert into SanPham 
values('005', 'May lam kem', 'RDO', 'DT', 'Chiec', '7000', '19', '4', '0')
insert into SanPham 
values('006', 'Dieu hoa', 'RDO', 'DT', 'Chiec', '9000', '38', '7', '0')
insert into SanPham 
values('008', 'Xa phong thom', 'OCE', 'TD', 'Banh', '6', '200', '50', '0')
insert into SanPham 
values('009', 'Duong', 'OCE', 'TD', 'kg', '9', '550', '50', '0')
insert into SanPham 
values('0010', 'Sua', 'OCE', 'TD', 'hop', '120', '80', '20', '0')

-----
create table HoaDonChiTiet(
	maHD varchar(10) foreign key references HoaDon(maHD),
	maSP varchar(10) foreign key references SanPham(maSP),
	donGia int, 
	soLuong smallint,
	giamGia real, 
	thanhTien int
)
go

insert into HoaDonChiTiet 
values('03', '003', '0', '3', '0.02', '0')
insert into HoaDonChiTiet 
values('03', '006', '0', '2', '0.01', '0')
insert into HoaDonChiTiet 
values('03', '05', '0', '10', '0', '0')
insert into HoaDonChiTiet 
values('02', '010', '0', '11', '0.04', '0')
insert into HoaDonChiTiet 
values('02', '002', '0', '2', '0.01', '0')
insert into HoaDonChiTiet 
values('01', '004', '0', '1', '0.05', '0')
insert into HoaDonChiTiet 
values('01', '009', '0', '15', '0.04', '0')
select * from HoaDonChiTiet
-----

--1
UPDATE HoaDonChiTiet
SET ThanhTien = DonGia * SoLuong * (1 - GiamGia)
select * from HoaDonChiTiet
go

-- 2. 
UPDATE HoaDon
SET Tien = (
    SELECT SUM(ThanhTien) FROM HoaDonChiTiet
    WHERE HoaDonChiTiet.maHD = HoaDon.maHD
)

UPDATE HoaDon
SET TongSoTien = Tien * (1 + Thue)
go

-- 3.
SELECT LoaiSanPham.tenLoaiSP, SanPham.maSP, SanPham.tenSP
FROM SanPham
INNER JOIN LoaiSanPham ON SanPham.maLoaiSP = LoaiSanPham.maLoaiSP
ORDER BY SanPham.tenSP ASC
-- 4. 
SELECT SanPham.maSP, SanPham.tenSP, SUM(HoaDonChiTiet.soLuong) AS TongSoHangBan
FROM SanPham
LEFT JOIN HoaDonChiTiet ON SanPham.maSP = HoaDonChiTiet.maSP
GROUP BY SanPham.maSP, SanPham.tenSP
go
--5. 
SELECT SanPham.maSP, SanPham.tenSP, SUM(HoaDonChiTiet.ThanhTien) AS TongSoTienBan
FROM SanPham
LEFT JOIN HoaDonChiTiet ON SanPham.maSP = HoaDonChiTiet.maSP
GROUP BY SanPham.maSP, SanPham.tenSP
go

--6. 
SELECT HoaDonChiTiet.maHD, HoaDonChiTiet.maSP, SanPham.tenSP, 
		HoaDonChiTiet.donGia, HoaDonChiTiet.soLuong, 
		HoaDonChiTiet.giamGia, HoaDonChiTiet.ThanhTien
FROM HoaDonChiTiet
INNER JOIN SanPham ON HoaDonChiTiet.maSP = SanPham.maSP
WHERE HoaDonChiTiet.giamGia > 0.01 AND HoaDonChiTiet.ThanhTien < 10000
go

--7 
SELECT KhachHang.maKH, KhachHang.tenKH, KhachHang.diaChi, 
	   KhachHang.phone, COUNT(HoaDon.maHD) AS SoHoaDon
FROM KhachHang
INNER JOIN HoaDon ON KhachHang.maKH = HoaDon.maKH
WHERE MONTH(HoaDon.ngayLapHD) = 3 AND YEAR(HoaDon.ngayLapHD) = 1997
GROUP BY KhachHang.maKH, KhachHang.tenKH, KhachHang.diaChi, KhachHang.phone
ORDER BY KhachHang.maKH, KhachHang.tenKH
go

--8
SELECT LoaiSanPham.tenLoaiSP, SanPham.maSP, SanPham.tenSP, 
	   SUM(HoaDonChiTiet.soLuong) AS TongSoHang, 
	   SUM(HoaDonChiTiet.ThanhTien) AS TongSoTien
FROM SanPham
INNER JOIN LoaiSanPham ON SanPham.maLoaiSP = LoaiSanPham.maLoaiSP
LEFT JOIN HoaDonChiTiet ON SanPham.maSP = HoaDonChiTiet.maSP
GROUP BY LoaiSanPham.tenLoaiSP, SanPham.maSP, SanPham.tenSP
WITH ROLLUP
go

--9
SELECT KhachHang.maKH, KhachHang.tenKH, 
	   SUM(HoaDonChiTiet.ThanhTien) AS TongSoTienDaMua
FROM KhachHang
INNER JOIN HoaDon ON KhachHang.maKH = HoaDon.maKH
INNER JOIN HoaDonChiTiet ON HoaDon.maHD = HoaDonChiTiet.maHD
WHERE MONTH(HoaDon.ngayLapHD) = 11 AND YEAR(HoaDon.ngayLapHD) = 2006
GROUP BY KhachHang.maKH, KhachHang.tenKH
go

--10
SELECT NhanVien.maNV, NhanVien.hoTen, 
	   SUM(HoaDonChiTiet.ThanhTien) AS TongSoTienBanDuoc
FROM NhanVien
INNER JOIN HoaDon ON NhanVien.maNV = HoaDon.maNV
INNER JOIN HoaDonChiTiet ON HoaDon.maHD = HoaDonChiTiet.maHD
WHERE MONTH(HoaDon.ngayLapHD) = 11 AND YEAR(HoaDon.ngayLapHD) = 2006
GROUP BY NhanVien.maNV, NhanVien.hoTen
go
