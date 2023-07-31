Create Database QuanLyDiemSV
use QuanLyDiemSV
-----
Create table DMKhoa(
	MaKhoa char(2) primary key,
	TenKhoa nvarchar(30) not null
)

Insert into DMKhoa(MaKhoa,TenKhoa) 
values('AV',N'Anh Văn')
Insert into DMKhoa(MaKhoa,TenKhoa) 
values('TH',N'Tin Học')
Insert into DMKhoa(MaKhoa,TenKhoa) 
values('TR',N'Triết')
Insert into DMKhoa(MaKhoa,TenKhoa) 
values('VL',N'Vật Lý')
SELECT * FROM DMKhoa
-----
Create table DMSV(
	MaSV char(3) not null primary key,
	HoSV nvarchar(15) not null,
	TenSV nvarchar(7) not null,
	Phai nchar(7),
	NgaySinh datetime not null,
	NoiSinh nvarchar(20),
	MaKhoa char(2), 
	HocBong float
)

SET DATEFORMAT DMY
GO
Insert into DMSV 
values('A01',N'Nguyễn Thị',N'Hải',N'Nữ','23/02/1990',N'Hà Nội','TH',130000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) 
values('A02',N'Trần Văn',N'Chính',N'Nam','24/12/1992',N'Bình Định','VL',150000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) 
values('A03',N'Lê Thu Bạch',N'Yến',N'Nữ','21/02/1990',N'TP Hồ Chí Minh','TH',170000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) 
values('A04',N'Trần Anh',N'Tuấn',N'Nam','20/12/1990',N'Hà Nội','AV',80000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)  
values('B01',N'Trần Thanh',N'Mai',N'Nữ','12/08/1991',N'Hải Phòng','TR',0)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) 
values('B02',N'Trần Thị Thu',N'Thủy',N'Nữ','02/01/1991',N'TP Hồ Chí Minh','AV',0)
SELECT * FROM DMSV
-----
create table DMMH(
	MaMH char(2) not null,
	TenMH nvarchar(25) not null,
	SoTiet tinyint
	Constraint DMMH_MaMH_pk primary key(MaMH)
)

Insert into DMMH(MaMH,TenMH,SoTiet) 
values('01',N'Cơ Sở Dữ Liệu',45)
Insert into DMMH(MaMH,TenMH,SoTiet) 
values('02',N'Trí Tuệ Nhân Tạo',45)
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03',N'Truyền Tin',45)
Insert into DMMH(MaMH,TenMH,SoTiet) 
values('04',N'Đồ Họa',60)
Insert into DMMH(MaMH,TenMH,SoTiet) 
values('05',N'Văn Phạm',60)
select * from DMMH
-----
Create table KetQua(
	MaSV char(3) not null,
	MaMH char(2) not null,
	LanThi tinyint,
	Diem decimal(4,2), 
	Constraint KetQua_MaSV_MaMH_LanThi_pk 
	primary key(MaSV,MaMH,LanThi)
)

Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A01','01',1,3)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A01','01',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A01','02',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A01','03',1,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A02','01',1,4.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A02','01',2,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A02','03',1,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A02','05',1,9)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A03','01',1,2)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A03','01',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A03','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A03','03',2,4)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('A04','05',2,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('B01','01',1,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('B01','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('B01','03',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('B02','02',1,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) 
values('B02','04',1,10)
select *from KetQua
-----
Alter table dmsv 
add Constraint DMKhoa_MaKhoa_fk foreign key(MaKhoa) References DMKhoa(MaKhoa)
Alter table KetQua 
add constraint KetQua_MaSV_fk foreign key(MaSV) references DMSV(MaSV),
constraint DMMH_MaMH_fk foreign key(MaMH)references DMMH(MaMH)
-----
go

--D. Truy vấn sử dụng hàm kết hợp: max, min, count, sum, avg và gom nhóm 
--32. Cho biết tổng số sinh viên của toàn trường
SELECT COUNT(*) AS TotalStudents
FROM DMSV;
go

--33. Cho biết tổng sinh viên và tổng sinh viên nữ. 
--đây là cách viết gộp trong bảng
select * from DMSV
SELECT COUNT(*) AS [Tổng sinh viên],
       SUM(CASE WHEN Phai = N'Nữ' THEN 1 ELSE 0 END) AS [Tổng SV nữ]
FROM DMSV;
go

--34. Cho biết tổng số sinh viên của từng khoa. 
SELECT MaKhoa, COUNT(*) AS TongSinhVien
FROM DMSV
GROUP BY MaKhoa;
go

--35. Cho biết số lượng sinh viên học từng môn. 
SELECT MaMH, COUNT(*) AS SoLuongSinhVien
FROM KetQua
GROUP BY MaMH;
go

--36. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có trong bảng kq)
SELECT COUNT(DISTINCT MaMH) AS SoLuongMonHoc
FROM KetQua;
go

--37. Cho biết tổng số học bổng của mỗi khoa. 
SELECT MaKhoa, SUM(HocBong) AS TongHocBong
FROM DMSV
GROUP BY MaKhoa;
go

--38. Cho biết học bổng cao nhất của mỗi khoa. 
SELECT MaKhoa, MAX(HocBong) AS HocBongCaoNhat
FROM DMSV
GROUP BY MaKhoa;
go

--39. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa. 
SELECT MaKhoa, 
       SUM(CASE WHEN Phai = N'Nam' THEN 1 ELSE 0 END) AS TongSinhVienNam,
       SUM(CASE WHEN Phai = N'Nữ' THEN 1 ELSE 0 END) AS TongSinhVienNu
FROM DMSV
GROUP BY MaKhoa;
go

--40. Cho biết số lượng sinh viên theo từng độ tuổi. 
SELECT CASE
           WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) < 20 THEN 'Dưới 20'
           WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) < 30 THEN '20-29'
           ELSE 'Trên 30'
       END AS DoTuoi,
       COUNT(*) AS SoLuongSinhVien
FROM DMSV
GROUP BY CASE
             WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) < 20 THEN 'Dưới 20'
             WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) < 30 THEN '20-29'
             ELSE 'Trên 30'
         END;
go

--41. Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường. 
SELECT YEAR(NgaySinh) AS [Năm Sinh]
FROM DMSV
GROUP BY YEAR(NgaySinh)
HAVING COUNT(*) = 2;
go

--42. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường. 
select NoiSinh, COUNT(*) as [Tổng sv]
from DMSV
group by NoiSinh having COUNT(*) > 2
go

--43. Cho biết những môn nào có trên 3 sinh viên dự thi. 
SELECT DMMH.TenMH, COUNT(*) AS StudentCount
FROM DMMH
JOIN KetQua ON DMMH.MaMH = KetQua.MaMH
WHERE KetQua.LanThi = 1
GROUP BY DMMH.TenMH
HAVING COUNT(*) > 3;
go

--44. Cho biết những sinh viên thi lại trên 2 lần. 
select MaSV, COUNT(distinct LanThi) as [Số lần thi]
from KetQua
group by MaSV
having COUNT(distinct LanThi) > 2
go

--45. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0 
SELECT MaSV FROM KetQua
WHERE LanThi = 1
GROUP BY MaSV
HAVING AVG(Diem) > 7.0;
go

--46. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
SELECT MaSV FROM KetQua
WHERE LanThi = 1 AND Diem < 5.0
GROUP BY MaSV
HAVING COUNT(*) > 2;
go

--47. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam 
SELECT DMKhoa.MaKhoa, DMKhoa.TenKhoa, COUNT(*) AS MaleStudentCount
FROM DMSV
JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE DMSV.Phai = N'Nam'
GROUP BY DMKhoa.MaKhoa, DMKhoa.TenKhoa
HAVING COUNT(*) > 2;
go

--48. Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000. 
SELECT DMKhoa.MaKhoa, DMKhoa.TenKhoa
FROM DMSV
JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE DMSV.HocBong BETWEEN 200000 AND 300000
GROUP BY DMKhoa.MaKhoa, DMKhoa.TenKhoa
HAVING COUNT(*) = 2;
go

--49. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1. 
--làm từng bảng
SELECT MaMH, COUNT(*) AS Pass, 
(SELECT COUNT(*) FROM KetQua WHERE MaMH = KQ.MaMH AND LanThi = 1) - COUNT(*) AS Fail
FROM KetQua KQ
WHERE Diem >= 5.0 AND LanThi = 1
GROUP BY MaMH;
go

--F. Truy vấn con trả về một giá trị 
--51. Cho biết sinh viên nào có học bổng cao nhất. 
SELECT MaSV, TenSV, HocBong
FROM DMSV
WHERE HocBong = (SELECT MAX(HocBong) FROM DMSV)
go

--52. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất. 
SELECT a.MaSV, a.TenSV, b.MaMH, b.LanThi, b.Diem
FROM DMSV as a 
JOIN KetQua as b ON a.MaSV = b.MaSV
where b.MaMH = N'Cơ Sở Dữ Liệu' and b.LanThi = 1 and b.Diem = (SELECT MAX(Diem) FROM KetQua)
go

--53. Cho biết sinh viên khoa anh văn có tuổi lớn nhất. 
-- c1:
SELECT TOP 1 * FROM DMSV
WHERE MaKhoa = 'AV'
ORDER BY NgaySinh ASC;
go
--c2
SELECT * FROM DMSV
WHERE MaKhoa = 'AV'
  AND NgaySinh = (SELECT MIN(NgaySinh) FROM DMSV WHERE MaKhoa = 'AV');
go

--54. Cho biết khoa nào có đông sinh viên nhất. 
--cach 1:
SELECT MaKhoa
FROM DMSV
GROUP BY MaKhoa
HAVING COUNT(*) = (
	SELECT MAX(SoLuong) FROM (SELECT COUNT(*) AS SoLuong
	FROM DMSV GROUP BY MaKhoa) AS SubQuery
);
--cach 2:
SELECT TOP 1 WITH TIES MaKhoa
FROM DMSV
GROUP BY MaKhoa
ORDER BY COUNT(*) DESC;
go

--55. Cho biết khoa nào có đông nữ nhất. 
SELECT MaKhoa
FROM DMSV
WHERE Phai = 'Nu'
GROUP BY MaKhoa
HAVING COUNT(*) = (
	SELECT MAX(SoLuong) FROM (SELECT COUNT(*) AS SoLuong 
	FROM DMSV WHERE Phai = 'Nu' GROUP BY MaKhoa
	) AS SubQuery
);
go

--56. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất. 
SELECT MaMH
FROM KetQua
WHERE LanThi > 1 
GROUP BY MaMH
HAVING COUNT(*) = (
	SELECT MAX(LanThi) FROM KetQua
);
go

--57. 
SELECT SV1.MaSV, SV1.TenSV, K1.TenKhoa,KQ1.Diem, KQ2.Diem
FROM DMSV SV1
JOIN DMKhoa K1 ON SV1.MaKhoa = K1.MaKhoa
JOIN KetQua KQ1 ON SV1.MaSV = KQ1.MaSV 
JOIN DMSV SV2 ON SV2.MaKhoa = 'AV'
JOIN DMKhoa K2 ON SV2.MaKhoa = K2.MaKhoa
JOIN KetQua KQ2 ON SV2.MaSV = KQ2.MaSV 
WHERE SV1.MaKhoa <> 'AV' AND KQ1.Diem > KQ2.Diem 
go
