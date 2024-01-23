USE danhsachbanhang;

-- Thêm dữ liệu cho bảng KHACHHANG
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK, LOAIKH)
VALUES
(1, 'Nguyen Van A', '123 Nguyen Hue, TP.HCM', '0123456789', '1990-01-01', 10000000.00, '2022-01-01', 1),
(2, 'Tran Thi B', '456 Le Loi, TP.HCM', '0987654321', '1995-05-05', 5000000.00, '2022-02-01', 2),
(3, 'Le Van C', '789 Vo Van Tan, TP.HCM', '0111222333', '1988-12-10', 20000000.00, '2022-03-01', 3),
(4, 'Khach Hang D', 'Dia chi D', '0123456789', '1992-02-02', 8000000.00, '2022-04-01', 1),
(5, 'Khach Hang E', 'Dia chi E', '0987654321', '1998-08-08', 3000000.00, '2022-05-01', 2),
(6, 'Khach Hang F', 'Dia chi F', '0111222333', '1994-04-04', 15000000.00, '2022-06-01', 3),
(7, 'Khach Hang G', 'Dia chi G', '0123456789', '1993-03-03', 12000000.00, '2022-07-01', 1),
(8, 'Khach Hang H', 'Dia chi H', '0987654321', '1997-07-07', 18000000.00, '2022-08-01', 2),
(9, 'Khach Hang I', 'Dia chi I', '0111222333', '1996-06-06', 9000000.00, '2022-09-01', 3);

DELETE FROM KHACHHANG;


-- Thêm dữ liệu cho bảng NHANVIEN
INSERT INTO NHANVIEN (MANV, HOTEN, NGVL, SODT)
VALUES
(101, 'Pham Van X', '2021-01-01', '0123456789'),
(102, 'Nguyen Thi Y', '2021-02-01', '0987654321'),
(103, 'Hoang Van Z', '2021-03-01', '0111222333');

DELETE FROM NHANVIEN;


-- Thêm dữ liệu cho bảng SANPHAM
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA, GHICHU)
VALUES
(201, 'Sản phẩm 1', 'cay', 'Viet Nam', 1000.00, 'Ghi chú sản phẩm 1'),
(202, 'Sản phẩm 2', 'hop', 'Trung Quoc', 1500.50, 'Ghi chú sản phẩm 2'),
(203, 'Sản phẩm 3', 'cai', 'Han Quoc', 2000.00, 'Ghi chú sản phẩm 3'),
(301, 'Sản phẩm 4', 'hop', 'Singapore', 1200.00,'Ghi chú sản phẩm 4'),
(302, 'Sản phẩm 5', 'cai', 'Singapore', 1800.50,'Ghi chú sản phẩm 5'),
(303, 'Sản phẩm 6', 'cay', 'Singapore', 2200.00,'Ghi chú sản phẩm 6'),
(401, 'Sản phẩm 2006 A', 'hop', 'Viet Nam', 800.00,'Ghi chú sản phẩm 6'),
(402, 'Sản phẩm 2006 B', 'cai', 'Trung Quoc', 1200.50,'Ghi chú sản phẩm 7'),
(403, 'Sản phẩm 2006 C', 'cay', 'Han Quoc', 1500.00,'Ghi chú sản phẩm 8'),
(501, 'Sản phẩm Max Gia', 'hop', 'Viet Nam', 5000.00,'Ghi chú sản phẩm 9'),
(502, 'Sản phẩm Min Gia', 'cai', 'Trung Quoc', 600.00,'Ghi chú sản phẩm 10');

DELETE FROM SANPHAM;

-- Thêm dữ liệu cho bảng HOADON
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
(301, '2022-01-15', 1, 101, 2500.00),
(302, '2022-02-20', 2, 102, 3000.00),
(303, '2022-03-25', 3, 103, 5000.00),
(401, '2022-01-15', 4, 101, 1500.00),
(402, '2022-02-20', 5, 102, 2000.00),
(403, '2022-03-25', 6, 103, 3000.00),
(501, '2006-04-01', 1, 101, 1800.00),
(502, '2006-05-15', 2, 102, 2500.00),
(503, '2006-06-20', 3, 103, 3500.00),
(601, '2022-01-01', 7, 101, 5000.00),
(602, '2022-02-02', 8, 102, 200.00),
(603, '2022-03-03', 9, 103, 4500.00),
(701, '2006-07-01', 1, 101, 1500.00),
(702, '2006-08-15', 2, 102, 2000.00),
(703, '2006-09-20', 3, 103, 3000.00),
(801, '2006-10-01', 1, 101, 5000.00),
(802, '2006-11-15', 2, 102, 4500.00),
(803, '2006-12-20', 3, 103, 4000.00);

DELETE FROM HOADON;

-- Thêm dữ liệu cho bảng CTHD
INSERT INTO CTHD (SOHD, MASP, SL)
VALUES
(301, 201, 2),
(302, 202, 1),
(303, 203, 3),
(501, 501, 2),
(502, 502, 1),
(503, 501, 3),
(701, 401, 1),
(702, 402, 2),
(703, 403, 1),
(801, 301, 2),
(802, 302, 1),
(803, 303, 3);
DELETE FROM CTHD;

