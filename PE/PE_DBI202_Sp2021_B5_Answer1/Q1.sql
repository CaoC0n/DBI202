Use PE_DBI202_Sp2021_B5

Create Table Items(
	ItemID int Primary Key,
	Name nvarchar(255),
	Price float
);

Create Table ItemVariants(
	variantID int Primary Key,
	Details nvarchar(200),
	Color nvarchar(50),
	Size nvarchar(30),
	ItemID int,
	Constraint FK_ItemVariants_Items Foreign Key(ItemID) References Items(ItemID)
);

Create Table Categories(
	CatID int Primary Key,
	Name nvarchar(255)
);

Create Table belongTo(
	ItemID int,
	CatID int,
	Constraint PK_belongTo Primary Key(CatID, ItemID),
	Constraint FK_belongTo_Categories Foreign Key(CatID) References Categories(CatID),
	Constraint FK_belongTo_Items Foreign Key(ItemID) References Items(ItemID)
)
