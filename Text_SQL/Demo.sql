use SE1762
/*
	insert into table values(list of values)
	insert into table(list of fields) values(list of values as fields)
*/
-- khoa chinh la identity --> khong duoc insert gia tri khoa chinh
insert into Customer values('thanh tung', 'tung123', '1223')
-- password >= 8
insert into Customer values('thanh tung', 'tung123', '1223')
-----
insert into Customer values('thanh tung', 'tung123', '12232332123')

select * from Customer
-- 
insert into Customer values('thanh tung', '12232332123', 'tung1234')
--- danh sach value phai day du nhu danh sach cac truong
insert into Customer values('thanh tung')
----
insert into Customer(cusName, userName, password) values('thanh hai', 'hai', 'hai123456')
select * from Customer

--- khong nhap truong null hoac default
insert into Customer(cusName, userName) values('tuan hai', 'tuan hai')
select * from Customer
----

--- khoa chinh ton tai trc khoa ngoai --> nhap ben 1 truoc ben nhieu
-- toan ven khoa ngoai: gia tri khoa ngoai chi duoc phep nhap gia tri khoa chinh da ton tai

select * from Customer
insert into Bill(billID, dateCreate, totalBill, cusID) values('b01', getdate(), 1000, 2)
select * from Bill
--- change primary key
insert into Bill(billID, dateCreate, totalBill, cusID) values('b02', '5/23/2023', 1000, 3)
--- khong nhap truong co defaut (datecreate)
insert into Bill(billID, dateCreate, totalBill, cusID) values('b03', '5/23/2023', 1000, 4)

insert into Bill(billID, totalBill, cusID) values('b04', 1001, 4)
select * from Bill

insert into Products(pid, pname, createDate, quantity, price) 
values('p01', 'Dell', getdate() + 1, 100, 2000)

select * from Products


