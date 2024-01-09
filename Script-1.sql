DROP TABLE IF EXISTS TenBang;
CREATE TABLE IF NOT EXISTS TenBang (
    ID INT PRIMARY KEY,
    Ten NVARCHAR(50),
    NgaySinh DATE,
    Email NVARCHAR(100)
);

INSERT INTO TenBang (ID, Ten, NgaySinh, Email)
VALUES (1, 'Nguyen Van A', '2000-01-01', 'nguyenvana@email.com');


SELECT * FROM TenBang;