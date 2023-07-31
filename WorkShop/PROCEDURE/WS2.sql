USE WS2

-- C12
CREATE PROCEDURE procProductList
	@pYear INT,
	@pMonth INT,
	@pMaLoaiHang VARCHAR(10) OUTPUT
AS
	SELECT TOP 1 @pMaLoaiHang = sp.maLoaiSP
	FROM SanPham sp
	INNER JOIN HoaDonChiTiet hct ON sp.maSP = hct.maSP
	INNER JOIN HoaDon hd ON hct.maHD = hd.maHD
	WHERE YEAR(hd.ngayLapHD) = @pYear AND MONTH(hd.ngayLapHD) = @pMonth
	GROUP BY sp.maLoaiSP
	ORDER BY SUM(sp.donGia * hct.soLuong) DESC

DECLARE @maLoaiHang VARCHAR(10)
EXEC procProductList 2007, 10, @maLoaiHang OUTPUT
SELECT maLoaiSP, tenLoaiSP FROM LoaiSanPham WHERE maLoaiSP = @maLoaiHang

