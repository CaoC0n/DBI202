/*
Chuy?n t? ERD --> database
1. entity --> table, key entity --> key table
2. relationship
	* 1-1: kh�ng chuy?n kh�a v� quan h? tr�n hai kh�a ch�nh c?a 2 b?ng
	* 1-n: chuy?n kh�a ch�nh c?a entity(table) b�n 1 sang l�m kh�a ngo?i entity b�n nhi?u
		entity(table) b�n nhi?u 
	* n-m: t�ch quan h? th�nh 2: 1-n
		- quan h? --> new table
			+ c�c thu?c t�nh (bao g?m kh�a) th�nh thu?c t�nh c?a b?ng
			+ l?y kh�a ch�nh c?a hai b?ng b�n (n, m) (+ kh�a tr�nh c?a quan h? n?u c� 
			--> kh�a ch�nh c?a new table)
			+ newTable: kh�a ch�nh g?m nhi?u thu?c t�nh, nh?ng m?i th�nh ph?n c?a kh�a ch�nh
			l?i l� kh�a ngo?i
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
