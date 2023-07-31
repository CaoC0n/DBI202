use QuanLy_WS
-- 1 --
create trigger Check_Salary
on Nhanvien
for insert,update
as
begin
    if exists (
	select PHG, avg(LUONG) from NHANVIEN
	group by PHG
	having avg(LUONG)>=50000
	)
	begin
	print 'Average salary of each department must be fewer than 50000'
	  rollback transaction
	end
end

-- 2 --
create trigger Check_Salary_of_Head
on NhanVien
for insert,update
as
begin
if exists (
select * from NHANVIEN as a join PHONGBAN as b on a.PHG=b.MAPHG
where a.LUONG<(select max(LUONG) from NHANVIEN where PHG=b.MAPHG )
and a.MANV=b.TRPHG
)
begin
print 'The salary of the head of each department must be greater than or equal to salary of all employees'
rollback transaction
end
end

-- 3 --
create trigger Check_Place
on Nhanvien
for insert,update
as
begin
if exists (
select * from NHANVIEN as a join DIADIEM_PHG as b on a.PHG=b.MAPHG
where abs((select avg(LUONG) from NHANVIEN  where b.DIADIEM='HA NOI' and PHG=b.MAPHG)-(select avg(LUONG) from NHANVIEN  where b.DIADIEM='TP HCM' and PHG=b.MAPHG))>10000
)
begin 
print 'The different between average salary of employees in HCM and HN must fewer than 10000.'
rollback transaction
end
end
-- 4 ---
CREATE TRIGGER enforce_family_group
ON NHANVIEN
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @max_family_count INT;
    SET @max_family_count = 5; -- Maximum number of employees from the same family in a group

    IF EXISTS (
        SELECT n.PHG
        FROM NHANVIEN n
        INNER JOIN (
            SELECT PHG, COUNT(*) AS family_count
            FROM NHANVIEN n1
            INNER JOIN THANNHAN t ON n1.MANV = t.MA_NVIEN
            WHERE t.QUANHE = 'Con trai'
            GROUP BY PHG
            HAVING COUNT(*) > @max_family_count
        ) AS family_groups ON n.PHG = family_groups.PHG
        WHERE n.MANV IN (SELECT MANV FROM inserted)
		OR n.MANV IN (SELECT MANV FROM deleted)
    )
    BEGIN
        -- Raise an error or take appropriate action
        RAISERROR('There is a group with more than five employees from the same family.', 16, 1);
        ROLLBACK TRANSACTION; -- Rollback the transaction if necessary
    END;
END;

-- 5 --

create trigger Check_Phai
on Nhanvien
for insert,update
as
begin
if exists (
select * from NHANVIEN 
where abs((select count(PHAI) from NHANVIEN where PHAI='NAM')-(select count(PHAI) from NHANVIEN where PHAI='NU'))>(select count(PHAI)*0.1 from NHANVIEN)
)
begin 
print 'The different between number of male and female employees must fewer than 10%'
rollback transaction
end
end