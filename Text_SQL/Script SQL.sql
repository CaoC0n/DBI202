
create database SE1762

use SE1762
go

create table Supplier(
	SupplierCode varchar(10) primary key,
	SupplierName varchar(20),
	[Address] varchar(max)
)
go

-- Add them constraint vao 1 bang da tao
-- Them constraint de khong co SupplierName nao bi trung lap

alter table Supplier -- sua cau truc cua bang Supplier
add constraint unique_name unique(SupplierName)
go


insert into Supplier(SupplierCode, SupplierName, Address)
values('S01', 'SamSung', 'Korea')
go

insert into Supplier(SupplierCode, SupplierName, Address)
values('S02', 'LG', 'Korea')
go


insert into Supplier(SupplierCode, SupplierName, Address)
values('S03', 'SamSung', '')
go

insert into Supplier(SupplierCode, SupplierName, Address)
values('', 'LG', 'Korea')
go

insert into Supplier(SupplierCode, SupplierName, Address)
values('S04', 'Daikin', 'Japan')
go

insert into Supplier(SupplierCode, SupplierName, Address)
values(null, 'SamSung', 'Korea') -- Khong insert duoc vi khong duoc null
go

-- phan biet null va empty
-- null: khong ton tai
-- empty: ton tai nhung chua co gia tri

--Xoa du lieu trong bang
delete from Supplier 
where SupplierCode = ''
go

--Update du lieu = xoa + insert
--C1: xoa xong -> insert lai
--C2: su dung cau lenh update	

update Supplier set SupplierName = 'Panasonic', Address = 'Japan'
where SupplierCode = 'S03'
go

select * from Supplier
go

create table Product(
	ProductCode varchar(10) not null,
	ProductName nvarchar(30) not null,
	PurchasePrice real not null,
	SellPrice real not null,
	ProductType varchar(10) not null,
	SupplierCode varchar(10) not null,
	primary key(ProductCode),
	foreign key(SupplierCode) references Supplier(SupplierCode)
)
go

--Add them constraint purchase <= sell
alter table Product
add constraint chk_SellPrice check(PurchasePrice <= SellPrice) 
go

-- Gia su o phan create table Product chua co primary key
-- thi se lam nhu sau
alter table Product
add constraint PK_ProductCode primary key(ProductCode)
go

-- Gia su o phan create table Product chua co foreign key
-- cho Supplier thi se lam nhu sau
alter table Product
add constraint FK_SupplierCode foreign key(SupplierCode) references Supplier(SupplierCode)
go

select * from Supplier
select * from Product
insert into Product values('P01', 'Laptop SamSung', 100, 200, 'Laptop', 'S01')
go


create table Employee(
	EmployeeID varchar(10) primary key,
	FullName nvarchar(25) not null,
	Gender varchar(6) not null check(Gender = 'Male' or Gender = 'Female'),
	BirthDate smalldatetime not null check(BirthDate < getdate()),
	Address varchar(max)
)
go



--*NOTE: Muon de ten la tieng thi kieu du lieu phai la nvarchar 
-- va trong values phai co N o truoc
-- VD: Trần Quang Tùng -> N'Trần Quang Tùng

