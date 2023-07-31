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

----- A ----------
select * from DMSV
--câu 3,4---
-- cập nhập sinh viên có mã b01 với tensv là Kỳ, phái là Nam
UPDATE DMSV
SET HoSV = N'Kỳ', Phai = N'Nam'
WHERE MaSV = 'B01';
go

----------câu 6----------
--Tăng học bổng sinh viên có makhoa Av thêm 100000
UPDATE DMSV
SET HocBong = HocBong + 100000
WHERE MaKhoa = 'AV';
go
select * from DMSV

-------câu 7----------
--Xóa danh sách kết quả có lần thi =2 và điểm <5
DELETE FROM KetQua
WHERE LanThi = 2 AND Diem < 5;
go

------------------------------------ B ------------------------------------
--9. Liệt kê danh sách sinh viên, gồm các thông tin sau: 
--Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. 
--Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần.

SELECT MaSV, HoSV, TenSV, HocBong
FROM DMSV
ORDER BY MaSV ASC;
go

--10. Danh sách các sinh viên gồm thông tin sau: 
--Mã sinh viên, họ tên sinh viên, Phái, Ngày sinh. 
--Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.

SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh
FROM DMSV
ORDER BY Phai ASC;
go

--11. Thông tin các sinh viên gồm: 
--Họ tên sinh viên, Ngày sinh, Học bổng. 
--Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.

SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, HocBong
FROM DMSV
ORDER BY NgaySinh ASC, HocBong DESC;
go

--12. Danh sách các môn học có tên bắt đầu bằng chữ T, 
--gồm các thông tin: Mã môn, Tên môn, Số tiết.

SELECT MaMH, TenMH, SoTiet
FROM DMMH
WHERE TenMH LIKE 'T%'
ORDER BY MaMH ASC;
go

--13. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, 
--gồm các thông tin: Họ tên sinh viên, Ngày sinh, Phái.

SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, Phai
FROM DMSV
WHERE TenSV LIKE '%I'
ORDER BY HoTen ASC;
go

--14. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, 
--gồm các thông tin: Mã khoa, Tên khoa.

SELECT MaKhoa, TenKhoa
FROM DMKhoa
WHERE SUBSTRING(TenKhoa, 2, 1) = 'N';
go

--15. Liệt kê những sinh viên mà họ có chứa chữ Thị.

SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen
FROM DMSV
WHERE HoSV LIKE N'%Thị%';
go

--16. Cho biết danh sách những sinh viên có ký tự đầu tiên của tên nằm trong khoảng từ a đến m, 
--gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Phái, Học bổng.

SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS [Họ tên sinh viên], Phai, HocBong
FROM DMSV
WHERE SUBSTRING(TenSV, 1, 1) BETWEEN 'a' AND 'm';
go

--17. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến 
--m, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách 
--được sắp xếp tăng dần theo họ tên sinh viên. 
SELECT HoSV + ' ' + TenSV AS [Họ tên sinh viên], NgaySinh, NoiSinh, HocBong
FROM DMSV
WHERE TenSV COLLATE Vietnamese_CI_AI LIKE '%[a-m]%'
ORDER BY [Họ tên sinh viên] ASC;
go

--18. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin: Mã 
--sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự 
--Mã khoa giảm dần. 

select HoSV + ' ' + TenSV AS [Họ tên sinh viên], MaKhoa, HocBong 
from DMSV
where HocBong > 100000
order by [HocBong] desc
go

--19. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông 
--tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng. 

select HoSV + ' ' + TenSV as [Họ tên sinh viên], MaKhoa, NoiSinh, HocBong 
from DMSV
where HocBong >= 150000 and NoiSinh = N'Hà Nội'
go

--20. Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh 
--viên, Mã khoa, Phái. 

SELECT MaSV, MaKhoa, Phai
FROM DMSV
WHERE MaKhoa IN ('AV', 'VL');
go

--21. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 gồm 
--các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng. 

select MaSV, NgaySinh, NoiSinh, HocBong  
from DMSV
where NgaySinh >= '1991/01/01' and NgaySinh <= '1992/06/05'
go

--22. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã 
--sinh viên, Ngày sinh, Phái, Mã khoa. 
select MaSV, NgaySinh, Phai, MaKhoa
from DMSV
where HocBong >= 80000 and HocBong <= 150000
go

--23. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã 
--môn học, Tên môn học, Số tiết. 
select MaMH, TenMH, SoTiet
from DMMH
where SoTiet > 30 and SoTiet < 45
go

--24. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã 
--sinh viên, Họ tên sinh viên, tên khoa, Phái. 
SELECT DMSV.MaSV, DMSV.HoSV + ' ' + DMSV.TenSV AS HoTenSV, DMKhoa.TenKhoa, DMSV.Phai
FROM DMSV
full outer JOIN DMKhoa on DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE DMKhoa.TenKhoa IN (N'Anh văn', N'Tin học') AND DMSV.Phai = N'Nam';
go

--25. Liệt kê những sinh viên nữ, tên có chứa chữ N--	
SELECT * FROM DMSV
WHERE Phai = N'Nữ' AND TenSV LIKE '%N%';
go


--C. Truy vấn sử dụng hàm: year, month, day, getdate, case, …. 

--26. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin: Họ 
--sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
SELECT HoSV, TenSV, NoiSinh, NgaySinh
FROM DMSV
WHERE NoiSinh = N'Hà Nội' AND MONTH(NgaySinh) = 2;
go

--27. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi, Học bổng. 
SELECT HoSV, TenSV, DATEDIFF(YEAR, NgaySinh, GETDATE()) AS Tuoi, HocBong
FROM DMSV
WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) > 20;
go

--28. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, 
--Tên khoa. 
SELECT DMSV.HoSV + ' ' + DMSV.TenSV AS [Họ tên sinh viên], 
       DATEDIFF(YEAR, DMSV.NgaySinh, GETDATE()) AS [Tuổi],
	   DMKhoa.TenKhoa as [Tên Khoa]
FROM DMSV
JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.TenKhoa
WHERE DATEDIFF(YEAR, DMSV.NgaySinh, GETDATE()) BETWEEN 20 AND 25;
go

--29. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên, 
--Phái, Ngày sinh. 
SELECT HoSV, TenSV, Phai, NgaySinh
FROM DMSV
WHERE YEAR(NgaySinh) = 1990 AND MONTH(NgaySinh) BETWEEN 1 AND 3;
go

--30. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã 
--khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị 
--của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình” 
SELECT MaSV, Phai, MaKhoa,
  CASE
    WHEN HocBong > 500000 THEN N'Học bổng cao'
    ELSE N'Mức trung bình'
  END AS MucHocBong
FROM DMSV;
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
select top 1 * from DMSV
order by HocBong desc
go

--52. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất. 
SELECT TOP 1 *
FROM KetQua
WHERE LanThi = 1 AND MaMH = '01'
ORDER BY Diem DESC;
go

--53. Cho biết sinh viên khoa anh văn có tuổi lớn nhất. 
SELECT TOP 1 *
FROM DMSV
WHERE MaKhoa = 'AV'
ORDER BY NgaySinh ASC;
go

--54. Cho biết khoa nào có đông sinh viên nhất. 
SELECT TOP 1 MaKhoa, COUNT(*) AS SoSinhVien
FROM DMSV
GROUP BY MaKhoa
ORDER BY SoSinhVien DESC;
go

--55. Cho biết khoa nào có đông nữ nhất. 
SELECT TOP 1 MaKhoa, COUNT(*) AS SoNu
FROM DMSV
WHERE Phai = N'Nữ'
GROUP BY MaKhoa
ORDER BY SoNu DESC;
go

--56. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất. 
SELECT TOP 1 MaMH, COUNT(*) AS SoSinhVienRot
FROM KetQua
WHERE LanThi = 1 AND Diem < 5
GROUP BY MaMH
ORDER BY SoSinhVienRot DESC;
go

--57. Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn điểm thi văn 
-- của sinh viên học khoa anh văn. 
SELECT *
FROM DMSV
WHERE MaKhoa <> 'AV' AND MaSV IN (
    SELECT MaSV
    FROM KetQua
    WHERE MaMH = '05' AND Diem > (
        SELECT MAX(Diem)
        FROM KetQua
        WHERE MaMH = '05' AND MaSV IN (
            SELECT MaSV
            FROM DMSV
            WHERE MaKhoa = 'AV'
        )
    )
);
go
--G. Truy vấn con trả về nhiều giá trị, sử dụng lượng từ all, any, union, top. 
--58. Cho biết sinh viên có nơi sinh cùng với Hải. 
SELECT *
FROM DMSV
WHERE NoiSinh = (SELECT NoiSinh FROM DMSV WHERE TenSV = N'Hải')
go

--59. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của 
--sinh viên thuộc khoa anh văn 
SELECT * FROM DMSV
WHERE HocBong > ALL (SELECT HocBong FROM DMSV WHERE MaKhoa = 'AV')
go

--60. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn
SELECT *
FROM DMSV
WHERE HocBong > ANY (SELECT HocBong FROM DMSV WHERE MaKhoa = 'AV')
go

--61. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 
--môn cơ sở dữ liệu của những sinh viên khác
SELECT *
FROM DMSV
WHERE EXISTS (
    SELECT *
    FROM KetQua kq1
    WHERE kq1.MaSV = DMSV.MaSV AND kq1.MaMH = '01' 
	  AND kq1.LanThi = 2 AND kq1.Diem > ALL (
        SELECT kq2.Diem
        FROM KetQua kq2
        WHERE kq2.MaSV != DMSV.MaSV AND kq2.MaMH = '01' AND kq2.LanThi = 1
    )
)
go
 
--62. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
SELECT kq.MaSV, kq.MaMH, kq.LanThi, kq.Diem
FROM KetQua kq
WHERE kq.Diem = (
    SELECT MAX(Diem)
    FROM KetQua
    WHERE MaMH = kq.MaMH
    GROUP BY MaMH
)
go
--63. Cho biết những khoa không có sinh viên học. 
SELECT *
FROM DMKhoa
WHERE MaKhoa NOT IN (SELECT DISTINCT MaKhoa FROM DMSV)
go

--64. Cho biết sinh viên chưa thi môn cơ sở dữ liệu. 
SELECT *
FROM DMSV
WHERE MaSV NOT IN (SELECT MaSV FROM KetQua WHERE MaMH = '01')
go

--65. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2. 


--66. Cho biết môn nào không có sinh viên khoa anh văn học. 

--67. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm. 


--68. Cho biết những sinh viên không rớt môn nào. 



--69. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên chưa bao 
--giờ rớt.


--70. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít 
--sinh viên nhận học bổng nhất. 



--71. Cho biết 3 sinh viên có học nhiều môn nhất. 

