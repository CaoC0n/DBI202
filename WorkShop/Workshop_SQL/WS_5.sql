create database WS5
use WS5
-----
create table Khoa(maKhoa varchar(5) primary key, tenKhoa varchar(10), soCBGD varchar(10))

insert into Khoa values ('VH01', 'Van Hoa', '001')
insert into Khoa values ('KT01', 'Kinh Te', '0012')
insert into Khoa values ('KS06', 'Khach San', '00443')
insert into Khoa values ('PM09', 'Phan Mem', '00139')
select *from Khoa
-----
create table Lop(maLop varchar(10) primary key, tenLop varchar(5), 
maKhoa varchar(5) foreign key references Khoa(maKhoa))

insert into Lop values ('D111', 'TCSK', 'VH01')
insert into Lop values ('D202', 'QTKD', 'KT01')
insert into Lop values ('B123', 'QTKS', 'KS06')
insert into Lop values ('D217', 'SQL', 'PM09')
select * from Lop
-----
create table SinhVien(maSV varchar(10) primary key, hoTen varchar(30), gioiTinh bit, 
ngaySinh date, maLop varchar(10) foreign key references Lop(maLop),
hocBong int, Tinh varchar(15)) 

insert into SinhVien values ('S01', 'Nguyen Thi Thuy', '0', '12/09/2000', 'D111', '100000', 'Ha Noi')
insert into SinhVien values ('S02', 'Luong Thuy Hoa', '0', '06/30/2003', 'B123', '80000', 'Thai Binh')
insert into SinhVien values ('S03', 'Hoang Chau', '1', '11/21/2003', 'D217', '50000', 'Lang Son')
insert into SinhVien values ('S04', 'Nguyen Viet Hoang', '1', '02/09/2001', 'D202', '100000', 'Vinh')
insert into SinhVien values ('S05', 'Tran Dung', '1', '05/21/2000', 'D217', '120000', 'Ha Noi')
insert into SinhVien values ('S06', 'Hoang Linh', '0', '04/21/2001', 'D111', '500000', 'Hung Yen')
select * from SinhVien
go

CREATE TABLE MonHoc (
  MaMH varchar(10) PRIMARY KEY,
  TenMH varchar(50),
  SoTiet int
)
go

CREATE TABLE KetQua (
  MaSV varchar(10),
  MaMH varchar(10),
  DiemThi decimal(4,2),
  PRIMARY KEY (MaSV, MaMH),
  FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
  FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
)
go

--1
SELECT MaLop, TenLop, MaKhoa
FROM Lop
go

--2
SELECT MaSV, HoTen, HocBong
FROM SinhVien
go

--3
SELECT MaSV, CASE WHEN gioiTinh = 0 THEN 'Nu' ELSE 'Nam' END AS Nu, HocBong
FROM SinhVien
go

--4
SELECT * FROM SinhVien
WHERE gioiTinh = 0
go

--5
SELECT * FROM SinhVien
WHERE hoTen LIKE 'Tran%'
go

--6
SELECT * FROM SinhVien
WHERE gioiTinh = 0 AND hocBong > 0
go
--7
SELECT *
FROM SinhVien
WHERE gioiTinh = 0 OR hocBong > 0
go

--8
SELECT * FROM SinhVien
WHERE YEAR(ngaySinh) BETWEEN 1978 AND 1985
go

--9
SELECT * FROM SinhVien
ORDER BY MaSV ASC
go

--10
SELECT * FROM SinhVien
ORDER BY HocBong DESC
go

--11
SELECT * FROM KetQua
WHERE  DiemThi >= 8
go

--12
SELECT sv.MaSV, sv.HoTen, sv.HocBong, lop.TenLop
FROM SinhVien sv
JOIN Lop as lop ON sv.maLop = lop.maLop
JOIN Khoa khoa ON lop.maKhoa = khoa.maKhoa
WHERE khoa.tenKhoa = 'CNTT'
go

--13
SELECT sv.MaSV, sv.HoTen, sv.HocBong, lop.TenLop, khoa.tenKhoa
FROM SinhVien sv
JOIN Lop lop ON sv.maLop = lop.maLop
JOIN Khoa khoa ON lop.maKhoa = khoa.maKhoa
WHERE khoa.tenKhoa = 'CNTT'
go
--14
SELECT lop.maLop, lop.tenLop, COUNT(sv.maSV) AS SoSinhVien
FROM Lop lop
LEFT JOIN SinhVien sv ON lop.maLop = sv.maLop
GROUP BY lop.maLop, lop.tenLop
go

--15
SELECT khoa.maKhoa, khoa.tenKhoa, COUNT(sv.maSV) AS SoLuongSinhVien
FROM Khoa khoa
LEFT JOIN Lop lop ON khoa.maKhoa = lop.maKhoa
LEFT JOIN SinhVien sv ON lop.maLop = sv.maLop
GROUP BY khoa.maKhoa, khoa.tenKhoa
go

--16
SELECT khoa.maKhoa, khoa.tenKhoa, COUNT(sv.maSV) AS SoLuongSinhVienNu
FROM Khoa khoa
LEFT JOIN Lop lop ON khoa.maKhoa = lop.maKhoa
LEFT JOIN SinhVien sv ON lop.maLop = sv.maLop
WHERE sv.gioiTinh = 0
GROUP BY khoa.maKhoa, khoa.tenKhoa
go

--17
SELECT lop.maLop, lop.tenLop, SUM(sv.hocBong) AS TongTienHocBong
FROM Lop lop
LEFT JOIN SinhVien sv ON lop.maLop = sv.maLop
GROUP BY lop.maLop, lop.tenLop
go

--18
SELECT khoa.maKhoa, khoa.tenKhoa, SUM(sv.hocBong) AS TongTienHocBong
FROM Khoa khoa
LEFT JOIN Lop lop ON khoa.maKhoa = lop.maKhoa
LEFT JOIN SinhVien sv ON lop.maLop = sv.maLop
GROUP BY khoa.maKhoa, khoa.tenKhoa
go

--19
SELECT khoa.maKhoa, khoa.tenKhoa, COUNT(sv.maSV) AS SoLuong
FROM Khoa khoa
LEFT JOIN Lop lop ON khoa.maKhoa = lop.maKhoa
LEFT JOIN SinhVien sv ON lop.maLop = sv.maLop
GROUP BY khoa.maKhoa, khoa.tenKhoa
HAVING COUNT(sv.maSV) > 100
go

--20
SELECT khoa.maKhoa, khoa.tenKhoa, COUNT(sv.maSV) AS SoLuong
FROM Khoa khoa
LEFT JOIN Lop lop ON khoa.maKhoa = lop.maKhoa
LEFT JOIN SinhVien sv ON lop.maLop = sv.maLop
WHERE sv.gioiTinh = 0
GROUP BY khoa.maKhoa, khoa.tenKhoa
HAVING COUNT(sv.maSV) > 50
go

--21
SELECT Khoa.maKhoa, Khoa.tenKhoa, SUM(SinhVien.hocBong) AS TongHocBong
FROM Khoa
JOIN Lop ON Khoa.maKhoa = Lop.maKhoa
JOIN SinhVien ON Lop.maLop = SinhVien.maLop
GROUP BY Khoa.maKhoa, Khoa.tenKhoa
HAVING SUM(SinhVien.hocBong) >= 1000000;
go

--22 
SELECT SinhVien.maSV, SinhVien.hoTen, SinhVien.hocBong
FROM SinhVien
WHERE SinhVien.hocBong = (SELECT MAX(hocBong) FROM SinhVien);
go

--23
SELECT SinhVien.maSV, SinhVien.hoTen, KetQua.DiemThi
FROM SinhVien
JOIN KetQua ON SinhVien.maSV = KetQua.MaSV
WHERE KetQua.MaMH = 'CSDL'
ORDER BY KetQua.DiemThi DESC
go

--24
SELECT maSV, hoTen
FROM SinhVien
WHERE maSV NOT IN (SELECT MaSV FROM KetQua WHERE MaMH = 'CSDL');
go

--25
SELECT Khoa.maKhoa, Khoa.tenKhoa, COUNT(*) AS SoSinhVien
FROM Khoa
JOIN Lop ON Khoa.maKhoa = Lop.maKhoa
JOIN SinhVien ON Lop.maLop = SinhVien.maLop
GROUP BY Khoa.maKhoa, Khoa.tenKhoa
ORDER BY COUNT(*) DESC
go


