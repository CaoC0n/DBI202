/*
Chuy?n t? ERD --> database
1. entity --> table, key entity --> key table
2. relationship
	* 1-1: không chuy?n khóa vì quan h? trên hai khóa chính c?a 2 b?ng
	* 1-n: chuy?n khóa chính c?a entity(table) bên 1 sang làm khóa ngo?i entity bên nhi?u
		entity(table) bên nhi?u 
	* n-m: tách quan h? thành 2: 1-n
		- quan h? --> new table
			+ các thu?c tính (bao g?m khóa) thành thu?c tính c?a b?ng
			+ l?y khóa chính c?a hai b?ng bên (n, m) (+ khóa trính c?a quan h? n?u có 
			--> khóa chính c?a new table)
			+ newTable: khóa chính g?m nhi?u thu?c tính, nh?ng m?i thành ph?n c?a khóa chính
			l?i là khóa ngo?i
*/
-- demo task 4: 
create database task4
use task4
-- ben 1
create table MonHoc(maMH varchar(30) primary key, tenMH nvarchar(100) not null)
go
create table HocKy(maHK varchar(20) primary key, tenHK nvarchar(100) not null)
go
create table Khoa(maKhoa varchar(30) primary key, tenKhoa nvarchar(100) not null)

-- ben nhieu
create table MonHocMo(maMonHoc varchar(30) primary key, 
maMH varchar(30) foreign key references MonHoc(maMH), 
maHK varchar(20) foreign key references HocKy(maHK))
------
create table SinhVien(maSV varchar(30) primary key, tenSV nvarchar(30) not null, 
maKhoa varchar(30) foreign key references Khoa(maKhoa))
------
create table Diem(diemKT float, diemThi float check(diemThi >= 0 And diemThi <= 10),
maMonMo varchar(30) foreign key references MonHocMo(maMonHoc),
maSV varchar(30) foreign key references SinhVien(maSV), 
primary key(maMonMo, maSV))
