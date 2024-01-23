USE danhsachbanhang;

-- Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất
SELECT COUNT(DISTINCT h.SOHD) AS SoHoaDon
FROM HOADON h
JOIN CTHD c ON h.SOHD = c.SOHD
JOIN SANPHAM s ON c.MASP = s.MASP
WHERE s.NUOCSX = 'Singapore';

 -- Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) AS HoaDonKhong
FROM HOADON 
WHERE MAKH IS NULL;

-- Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP) AS SoSanPham
FROM CTHD c
JOIN HOADON h ON c.SOHD = h.SOHD
WHERE YEAR(NGHD) = 2006;

-- Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(GIA) AS GiaMax, MIN(GIA) AS GiaMin 
FROM SANPHAM;

-- Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS GiaTriTrungBinh
FROM HOADON
WHERE YEAR(NGHD)=2006; 

-- Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DoanhThu
FROM HOADON
WHERE YEAR(NGHD) = 2006;

-- Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD, TRIGIA AS SoHoaDon
FROM HOADON 
WHERE TRIGIA=(SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD)=2006 );

-- Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT DISTINCT HOTEN
FROM HOADON h
JOIN KHACHHANG k ON h.MAKH = k.MAKH 
WHERE TRIGIA =(SELECT max(TRIGIA) FROM HOADON WHERE YEAR(NGHD)=2006 );

-- In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT MAKH, HOTEN, DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC
LIMIT 3;


-- In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT MAKH, HOTEN, DOANHSO
FROM (
    SELECT MAKH, HOTEN, DOANHSO,
           RANK() OVER (ORDER BY DOANHSO DESC) AS XepHang
    FROM KHACHHANG
) AS RankedKH
WHERE XepHang <= 3;


-- In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP
FROM SANPHAM
ORDER BY GIA DESC
LIMIT 3;

-- In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan'
ORDER BY GIA DESC
LIMIT 3;

-- In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
ORDER BY GIA DESC
LIMIT 3;


-- Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(MASP) AS TongSoSanPhamTrungQuoc
FROM SANPHAM 
WHERE NUOCSX='Trung Quoc';


-- Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(MASP) AS TongSoSanPham
FROM SANPHAM
GROUP BY NUOCSX;

-- Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MIN(GIA) AS GIAMIN, MAX(GIA) AS GIAMAX, AVG(GIA) AS GIATRUNGBINH
FROM SANPHAM 
GROUP BY NUOCSX;

-- Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS DOANHTHUHANGNGAY
FROM HOADON
GROUP BY NGHD;


-- Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT c.MASP, s.TENSP, SUM(c.SL) AS TongSoLuong
FROM CTHD c
JOIN HOADON h ON c.SOHD = h.SOHD
JOIN SANPHAM s ON c.MASP = s.MASP
WHERE YEAR(h.NGHD) = 2006 AND MONTH(h.NGHD) = 10
GROUP BY c.MASP, s.TENSP;

-- Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DANHTHUTHANG
FROM HOADON 
WHERE YEAR(NGHD)=2006
GROUP BY MONTH(NGHD);


-- Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT h.SOHD, COUNT(DISTINCT c.MASP) AS SOSANPHAM
FROM HOADON h
JOIN CTHD c ON h.SOHD=c.SOHD 
GROUP BY h.SOHD 
HAVING SOSANPHAM>=4;

-- Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT h.SOHD, COUNT(DISTINCT c.MASP) AS SOSANPHAM
FROM HOADON h
JOIN CTHD c ON h.SOHD=c.SOHD 
JOIN SANPHAM s ON s.MASP = c.MASP 
WHERE s.NUOCSX = 'Viet Nam'
GROUP BY h.SOHD 
HAVING COUNT(DISTINCT c.MASP) =3;

-- Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT k.MAKH, k.HOTEN , COUNT(h.SOHD) AS SOLANMUA
FROM KHACHHANG k
JOIN HOADON h ON h.MAKH = k.MAKH 
GROUP BY k.MAKH, k.HOTEN 
ORDER BY SOLANMUA DESC LIMIT 1;

-- Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DANHTHUTHANGMAX
FROM HOADON 
WHERE YEAR(NGHD)=2006
GROUP BY MONTH(NGHD)
ORDER BY THANG DESC LIMIT 1;

-- Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT s.MASP, s.TENSP, SUM(c.SL) AS TONGSO
FROM SANPHAM s
JOIN CTHD c ON c.MASP = s.MASP 
JOIN HOADON h ON c.SOHD =h.SOHD
GROUP BY s.MASP , s.TENSP 
ORDER BY TONGSO ASC LIMIT 1;

-- *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT s.NUOCSX, s.MASP, s.TENSP, s.GIA 
FROM SANPHAM s
WHERE (s.NUOCSX, s.GIA) IN (SELECT s.NUOCSX, MAX(s.GIA) AS MaxGia
                           FROM SANPHAM s
                           GROUP BY s.NUOCSX);

-- Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT s.NUOCSX AS NUOCSX, COUNT(s.GIA) AS SOSANPHAM
FROM SANPHAM s 
GROUP BY s.NUOCSX 
HAVING COUNT(s.GIA)>=3;

-- *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

WITH Top10KH AS (
    SELECT k.MAKH, k.HOTEN, RANK() OVER (ORDER BY SUM(h.TRIGIA) DESC) AS XepHang
    FROM KHACHHANG k
    JOIN HOADON h ON k.MAKH = h.MAKH
    GROUP BY k.MAKH, k.HOTEN
    ORDER BY SUM(h.TRIGIA) DESC
    LIMIT 10
)

SELECT MAKH, HOTEN, SoLanMua
FROM (
    SELECT k.MAKH, k.HOTEN, COUNT(h.SOHD) AS SoLanMua,
           RANK() OVER (ORDER BY COUNT(h.SOHD) DESC) AS XepHang
    FROM KHACHHANG k
    JOIN HOADON h ON k.MAKH = h.MAKH
    WHERE k.MAKH IN (SELECT MAKH FROM Top10KH)
    GROUP BY k.MAKH, k.HOTEN
) AS RankedKH
WHERE XepHang = 1;






