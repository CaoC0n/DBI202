--create database dbName
create database SE1762
go
--remove DB
drop database SE1762
--open database: use databaseName
use SE1762
-- create table 
/*
	Create table tableName(fieldName dataType[(size)] [constrains],.....)
	dataType: 
		int : 4byte
		float: 8byte
		real: 4byte
		double: 8byte
		money: 8byte
		small money: 4byte
		char(maxSize): khong unicode, do dai co dinh la maxSize
		varchar(maxSize): khong unicode, do dai toi da la maxSize 
		nvarchar(maxSize): unicode, do dai toi da la maxSize(note: bo nho la maxSize*2)
		date: ngay thang(long date)
		smallDate: ngay thang
		dateTime: date+time
*/
-- note: neu ten truong doi mau xanh --> trung tu khoa -> de an toan co the khai bao trong cap []
-- ten truong co dau --> phai viet trong []: [full name]
create table Product(pid varchar(30), pname nvarchar(100), createDate date, quantity int, price money,
[description] nvarchar(max), status bit)
go
drop table Product
go
-- primary key, constrains
-- not null: require input
-- check input condition
-- check (createDate >= getDate()): ngay tao phai tu hom nay tro di
-- getDate(): return current date
-- default: khong input thi dung default
create table Products(pid varchar(30) primary key, pname nvarchar(100) not null, 
createDate date check(createDate >= getDate()) default getDate(), quantity int check(quantity >= 0), 
price money check(price >= 0), [description] nvarchar(max), status bit default 1)
-- Customer
-- identity(1,1): start 1, step 1
-- unique (unique key): dung dinh nghia cac truong co gia tri duy nhat khong phai khoa chinh
create table Customer(cusID int primary key identity(1,1), cusName nvarchar(30) not null, 
userName varchar(100) unique, password varchar(32) check(len(password) >= 8)) 
-- khoa ngoai(foreign key)
-- Customner --(1)--<Have>--(n)-- Bill: cusID cua Customer chuyen sang Bill lam foreign key
Create table Bill(billID varchar(100) primary key, dateCreate dateTime default getDate(), 
totalBill money, cusID int foreign key references Customer(cusID))
-- multi primary key
-- Bill --(1)--<have>--(n)-- BillDetail -- (n) -- <have> -- (1) -- Product
-- BillDetail: hai truong lam khoa chinh pid, billID
create table BillDetail(maBill varchar(100) foreign key references Bill(billID), 
pid varchar(30) foreign key references Products(pid), quantity int, price money, subtotal money, 
primary key(maBill, pid))