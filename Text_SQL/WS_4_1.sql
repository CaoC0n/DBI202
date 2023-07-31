Create Database QuanLyDiemSV
use QuanLyDiemSV
-----
Create table DMKhoa(MaKhoa char(2) primary key,
TenKhoa nvarchar(30) not null)

Insert into DMKhoa(MaKhoa,TenKhoa) values('AV',N'Anh Văn')
Insert into DMKhoa(MaKhoa,TenKhoa) values('TH',N'Tin Học')
Insert into DMKhoa(MaKhoa,TenKhoa) values('TR',N'Triết')
Insert into DMKhoa(MaKhoa,TenKhoa) values('VL',N'Vật Lý')
SELECT * FROM DMKhoa
-----
Create table DMSV(MaSV char(3) not null primary key,HoSV nvarchar(15) not null,
TenSV nvarchar(7) not null,Phai nchar(7),NgaySinh datetime not null,
NoiSinh nvarchar(20),MaKhoa char(2), HocBong float)

SET DATEFORMAT DMY
GO
Insert into DMSV values('A01',N'Nguyễn Thị',N'Hải',N'Nữ','23/02/1990',N'Hà Nội','TH',130000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) values('A02',N'Trần Văn',N'Chính',N'Nam','24/12/1992',N'Bình Định','VL',150000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) values('A03',N'Lê Thu Bạch',N'Yến',N'Nữ','21/02/1990',N'TP Hồ Chí Minh','TH',170000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) values('A04',N'Trần Anh',N'Tuấn',N'Nam','20/12/1990',N'Hà Nội','AV',80000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)  values('B01',N'Trần Thanh',N'Mai',N'Nữ','12/08/1991',N'Hải Phòng','TR',0)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong) values('B02',N'Trần Thị Thu',N'Thủy',N'Nữ','02/01/1991',N'TP Hồ Chí Minh','AV',0)
SELECT * FROM DMSV
-----
create table DMMH(MaMH char(2) not null,TenMH nvarchar(25) not null,SoTiet tinyint
Constraint DMMH_MaMH_pk primary key(MaMH))

Insert into DMMH(MaMH,TenMH,SoTiet) values('01',N'Cơ Sở Dữ Liệu',45)
Insert into DMMH(MaMH,TenMH,SoTiet) values('02',N'Trí Tuệ Nhân Tạo',45)
Insert into DMMH(MaMH,TenMH,SoTiet) values('03',N'Truyền Tin',45)
Insert into DMMH(MaMH,TenMH,SoTiet) values('04',N'Đồ Họa',60)
Insert into DMMH(MaMH,TenMH,SoTiet) values('05',N'Văn Phạm',60)
select * from DMMH
-----
Create table KetQua(MaSV char(3) not null,MaMH char(2) not null,LanThi tinyint,
Diem decimal(4,2), Constraint KetQua_MaSV_MaMH_LanThi_pk 
primary key(MaSV,MaMH,LanThi))

Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A01','01',1,3)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A01','01',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A01','02',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A01','03',1,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A02','01',1,4.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A02','01',2,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A02','03',1,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A02','05',1,9)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A03','01',1,2)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A03','01',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A03','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A03','03',2,4)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('A04','05',2,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('B01','01',1,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('B01','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('B01','03',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('B02','02',1,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem) values('B02','04',1,10)
select *from KetQua
-----
Alter table dmsv add Constraint DMKhoa_MaKhoa_fk foreign key(MaKhoa) References DMKhoa(MaKhoa)
Alter table KetQua add constraint KetQua_MaSV_fk foreign key(MaSV) references DMSV(MaSV),
constraint DMMH_MaMH_fk foreign key(MaMH)references DMMH(MaMH)
-----
update DMMH set SoTiet='45' where MaMH='05'
select * from DMMH
update DMSV set NgaySinh='05/07/1990' where MaSV='b02'
select * from DMSV
update DMSV set TenSV=N'Kỳ', Phai='Nam' where MaSV='b01'
select * from DMSV
update DMSV set HocBong=HocBong+100000 where MaKhoa='Av'
select * from DMSV
-----
delete DMSV where MaKhoa='TL'
select * from DMSV

------Select-------
-----9
select MaSV, HoSV, TenSV, HocBong from DMSV
order by MaSV asc
-----10
select MaSV, HoSV, TenSV, HocBong, Phai, NgaySinh from DMSV
order by case when Phai='Nam' then 0 else 1 end
-----11
select HoSV, TenSV, NgaySinh, HocBong from DMSV
order by NgaySinh asc, HocBong desc
-----12
select MaMH, TenMH, SoTiet from DMMH
where TenMH like 'T%'
-----13
select HoSV, TenSV, NgaySinh, Phai from DMSV
where TenSV like '%i'
-----14
select MaKhoa, TenKhoa from DMKhoa
where TenKhoa like '_n%'
-----15
select * from DMSV
where HoSV like N'%Thị%'
-----16
select HoSV, TenSV, Phai, HocBong from DMSV
where substring(TenSV,1,1) between 'a' and 'm'
-----17
select HoSV, TenSV, NgaySinh, NoiSinh, HocBong from DMSV
where substring(TenSV,1,1) between 'a' and 'm'
order by HoSV asc, TenSV asc
-----18
select HoSV, TenSV, MaKhoa, HocBong from DMSV
where HocBong >= 100000 order by MaKhoa desc
-----19
select HoSV, TenSV, MaKhoa, NoiSinh, HocBong from DMSV
where HocBong >= 150000 and NoiSinh=N'Hà Nội'
-----20
select MaSV, MaKhoa, Phai from DMSV
where MaKhoa='AV' or MaKhoa='VL'
-----21
select MaSV, NgaySinh, NoiSinh, HocBong from DMSV
where NgaySinh between '01/01/1991' and '05/06/1992'
-----22
select MaSV, NgaySinh, Phai, MaKhoa from DMSV
where HocBong between 80000 and 150000
-----23
select MaMH, TenMH, SoTiet from DMMH
where SoTiet>30 and SoTiet<45
-----24
select MaSV,HoSV, TenSV, MaKhoa, Phai from DMSV
where Phai='Nam' and (MaKhoa='AV' or MaKhoa='TH')
-----25
select * from DMSV
where Phai='Nữ' and (TenSV = 'N__')

-----26
select HoSV, TenSV, NoiSinh, NgaySinh from DMSV
where NoiSinh = N'Hà Nội' and Month(NgaySinh)=2

-----27
select HoSV, TenSV,	
case 
when DATEDIFF(YEAR, NgaySinh, getDate()) > 20 then DATEDIFF(YEAR, NgaySinh, getDate()) else null
	end as Tuoi, HocBong
from DMSV where DATEDIFF(YEAR, NgaySinh, getDate()) > 20

-----28
select  b.HoSV, b.TenSV, a.TenKhoa,
DATEDIFF(YEAR, NgaySinh, getDate()) as Tuoi, HocBong
from DMKhoa as a inner join DMSV as b on a.MaKhoa=b.MaKhoa
where DATEDIFF(YEAR, NgaySinh, getDate()) between 20 and 25

-----29: mùa xuân bắt đầu từ tháng 3 và kết thúc vào tháng 6
select* from DMSV
select HoSV, TenSV, Phai, NgaySinh from DMSV
where Year(NgaySinh)=1990 and MONTH(NgaySinh) between 3 and 6

-----30
select MaSV, Phai, MaKhoa, 
case 
when HocBong > 500000 then N'Mức học bổng cao'
else N'Mức học bổng trung bình'
end as MucHocBong
from DMSV

-----32
select count(MaSV) as totalStudent from DMSV

-----33
select count(MaSV)as TongSV,
count(
case 
when Phai = N'Nữ' then 1 
end
)as TongSVnu from DMSV

-----34
select MaKhoa, count(*) as total from DMSV
group by MaKhoa

-----35
select MaMH, count(*) as total
from KetQua group by MaMH

-----36
select MaSV, count(MaMH) as total
from KetQua group by MaSV

-----37
select a.MaKhoa, b.TenKhoa, count(a.HocBong) totalScholar 
from DMSV as a join DMKhoa as b on a.MaKhoa=b.MaKhoa
group by a.MaKhoa, b.TenKhoa

-----38
select a.MaKhoa, b.TenKhoa, max(a.HocBong) maxScholar 
from DMSV as a join DMKhoa as b on a.MaKhoa=b.MaKhoa
group by a.MaKhoa, b.TenKhoa

-----39
SELECT MaKhoa, SUM(CASE WHEN Phai = N'Nam' THEN 1 ELSE 0 END) AS TotalMaleStudents, 
       SUM(CASE WHEN Phai = N'Nữ' THEN 1 ELSE 0 END) AS TotalFemaleStudents
FROM DMSV
GROUP BY MaKhoa

-----40
SELECT YEAR(GETDATE()) - YEAR(NgaySinh) AS Age, 
COUNT(*) AS Student
FROM DMSV GROUP BY YEAR(GETDATE()) - YEAR(NgaySinh)

-----41
SELECT YEAR(NgaySinh) AS BirthYear, COUNT(*) AS StudentCount
FROM DMSV GROUP BY YEAR(NgaySinh)
HAVING COUNT(*) = 2

-----42
select NoiSinh, count(*) as studentCount from DMSV
group by NoiSinh
having count(*) = 2

-----43
select a.MaMH, b.TenMH, count(*) as duthi from KetQua as a join DMMH as b on a.MaMH=b.MaMH
group by a.MaMH, b.TenMH
having count(*) > 3

-----44
select b.MaSV, b.HoSV, b.TenSV , a.LanThi, count(*) as duthi from KetQua as a join DMSV as b on a.MaSV=b.MaSV
group by b.MaSV, b.HoSV, b.TenSV ,a.LanThi
having count(*) > 2

-----45
select a.MaSV, a.HoSV, a.TenSV, avg(b.Diem) as DiemTrungBinh
from DMSV as a join KetQua as b on a.MaSV = b.MaSV
where a.Phai = N'Nam' and b.LanThi = 1
group by a.MaSV, a.HoSV, a.TenSV
having avg(b.Diem) > 7.0;

-----46
select a.MaSV, a.HoSV, a.TenSV, b.LanThi, count(*) as retake 
from DMSV as a join KetQua as b on a.MaSV=b.MaSV
group by a.MaSV, a.HoSV, a.TenSV, b.LanThi
having count(*) > 2

-----47
select a.MaKhoa, a.TenKhoa, count(distinct b.MaSV) as SoLuongSinhVienNam
from DMKhoa as a join DMSV as b ON a.MaKhoa = b.MaKhoa
where b.Phai = N'Nam'
GROUP BY a.MaKhoa, a.TenKhoa
having count(distinct b.MaSV) > 2

-----48
select a.MaKhoa, a.TenKhoa, count(distinct b.MaSV) as SoLuongSinhVien
from DMKhoa as a join DMSV as b ON a.MaKhoa = b.MaKhoa
where b.HocBong between 200000 and 300000
group by  a.MaKhoa, a.TenKhoa
having count(distinct b.MaSV) = 2

-----49
select MaMH,
    count(case when Diem >= 5 then 1 end) as SoLuongDau,
    count(case when Diem < 5 then 1 end) as SoLuongRot
from KetQua where LanThi = 1
group by MaMH

-----50
select count(Phai) as SoLuongSinhVien, MaKhoa , Phai
from DMSV
group by MaKhoa, Phai
SELECT * FROM DMSV

-----51
select top 1 * from DMSV order by HocBong desc

-----52
select * from KetQua
where LanThi = 1 and Diem = (select max(Diem) from KetQua where MaMH = '01')

-----53
select * from DMSV
where NgaySinh = (select min(NgaySinh) from DMSV)

-----54
select MaKhoa, count(maSV) as SLSV from DMSV 
group by MaKhoa
having count(maSV) = (select max(SLSV) from (select count(maSV) as SLSV from DMSV 
					group by MaKhoa)  as subquery)

-----55
select b.MaKhoa, b.TenKhoa, count(a.maSV) as TongSVNu
from DMSV as a join DMKhoa as b on a.MaKhoa = b. MaKhoa
where a.Phai =N'Nữ'
group by b.MaKhoa, b.TenKhoa
having count(a.maSV) = (select max(TongSVNu) from( select b.MaKhoa, b.TenKhoa, count(a.maSV) as TongSVNu
						from DMSV as a join DMKhoa as b on a.MaKhoa = b. MaKhoa 
						group by b.MaKhoa, b.TenKhoa) as subquery)

-----56
select a.MaMH, b.TenMH, count(a.MaSV) as SVRotLan1
from KetQua as a join DMMH as b on a.MaMH = b.MaMH
where a.LanThi = 1 and a.Diem <= 5.0
group by a.MaMH, b.TenMH
having count(a.MaSV) = (select max(SVRotLan1) from (select a.MaMH, b.TenMH, count(a.MaSV) as SVRotLan1
						from KetQua as a join DMMH as b on a.MaMH = b.MaMH
						group by a.MaMH, b.TenMH) as subquery)

-----57 
SELECT SV1.MaSV, SV1.TenSV, K1.TenKhoa,KQ1.Diem, KQ2.Diem
FROM DMSV SV1
JOIN DMKhoa K1 ON SV1.MaKhoa = K1.MaKhoa
JOIN KetQua KQ1 ON SV1.MaSV = KQ1.MaSV 
JOIN DMSV SV2 ON SV2.MaKhoa = 'AV'
JOIN DMKhoa K2 ON SV2.MaKhoa = K2.MaKhoa
JOIN KetQua KQ2 ON SV2.MaSV = KQ2.MaSV 
WHERE SV1.MaKhoa <> 'AV' AND KQ1.Diem > KQ2.Diem





