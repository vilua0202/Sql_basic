USE Testing_System_Assignment_1;
-- Question 2: Lay ra tat ca cac phong ban
SELECT * FROM `Department`;

-- Question 3: Lay ra id cua phong ban Sale
SELECT DepartmentID 
FROM `Department`
WHERE DepartmentName='Sale';

-- Question 4: Lay ra thong tin account co full name dai nhat va sap xep chung theo thu tu giam dan
SELECT *
FROM `Account`
WHERE LENGTH(FullName) = 
(SELECT MAX(LENGTH(FullName)) 
FROM `Account`);

-- Question 5: Lay ra thong tin account co full name dai nhat va thuoc deparment id=3
SELECT *
FROM `Account`
WHERE LENGTH(FullName) = 
(SELECT MAX(LENGTH(FullName)) 
FROM `Account`
WHERE DepartmentID=3)
AND DepartmentID=3;

-- Question 6: Lay ra ten group da tham gia truoc ngay 20/06/2022
SELECT GroupName 
FROM `Group`
WHERE CreateDate<'2022-06-20';

-- Question 7: Lay ra id cua question co >= 4 cau tra loi
SELECT QuestionID
FROM `Answer`
GROUP BY QuestionID
HAVING COUNT(QuestionID)>=4;

-- Question 8: Lay ra cac ma de thi co thoi gian thi >=60 phut va duoc tao truoc ngay 20/06/2022
SELECT `Code` 
FROM `Exam`
WHERE Duration>=60 AND CreateDate<'2022-06-20';

-- Question 9: Lay ra 5 group duoc tao gan day nhat
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10: Dem so nhan vien thuoc department co id=2
SELECT COUNT(*)
FROM `Account`
WHERE DepartmentID=2;

-- Question 11: Lay ra nhan vien co ten bat bau bang chu d va ket thuc bang chu o
SELECT *
FROM `Account`
WHERE FullName LIKE 'd%o';

-- Question 12: Xoa tat ca cac exam duoc tao truoc ngay 20/12/2019
DELETE
FROM `Exam`
WHERE CreateDate<'2019-12-20';

-- Question 13: Xoa tat ca cac question co noi dung bat dau bang tu cau hoi
DELETE 
FROM `Question`
WHERE Content LIKE 'cauhoi%';

-- Question 14: Update thong tin cua account co id=5 thanh ten nguyenbaloc va email thanh loc.nguyenba@vti.com.vn
UPDATE `Account`
SET FullName='nguyenbaloc', Email='loc.nguyenba@vti.com.vn'
WHERE AccountID=5; 

-- Question 15: Update account co id=5 se thuoc group co id=4
UPDATE `GroupAccount`
SET GroupID=4
WHERE AccountID=5;

SELECT * FROM `GroupAccount` WHERE GroupID=4;