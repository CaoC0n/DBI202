create table Customers(
	CustomerID int primary key,
	FullName nvarchar(100), 
	Address nvarchar(200)
)

create table Vehicles(
	VehicleID int primary key,
	Model nvarchar(50),
	Year int,
	Market varchar(20),
	RentalPrice float
)

create table Branches(
	BranchID int primary key,
	Name nvarchar(100),
	Address nvarchar(200)
)

create table Rent(
	PickupDate Date,
	DropoffDate Date,
	CustomerID int foreign key(CustomerID) references Customers(CustomerID),
	VehicleID int foreign key(VehicleID) references Vehicles(VehicleID),
	BranchID int foreign key(BranchID) references Branches(BranchID),
	primary key(PickupDate, CustomerID, VehicleID, BranchID)
)