DROP TABLE IF EXISTS employees;

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    position VARCHAR(255)
);

INSERT INTO employees (name, age, position) VALUES
('John Doe', 30, 'Developer'),
('Jane Smith', 25, 'Designer'),
('Bob Johnson', 35, 'Manager'),
('Alice Williams', 28, 'Analyst'),
('Charlie Brown', 32, 'Engineer'),
('Eva Davis', 27, 'Tester'),
('Frank Wilson', 40, 'Architect'),
('Grace Miller', 22, 'Intern'),
('Henry Harris', 38, 'Project Manager'),
('Ivy Robinson', 29, 'Data Scientist');

SELECT * FROM employees;
select min(age) as smallestAge from employees;
select count(age) from employees where age= 40;
select avg(age) from employees;

-- Tạo bảng "Users"
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Tạo bảng "Orders"
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- Thêm dữ liệu vào bảng "Users"
INSERT INTO Users (UserID, UserName, Email)
VALUES
    (1, 'JohnDoe', 'john.doe@example.com'),
    (2, 'JaneSmith', 'jane.smith@example.com'),
    (3, 'BobJohnson', 'bob.johnson@example.com');

-- Thêm dữ liệu vào bảng "Orders"
INSERT INTO Orders (OrderID, UserID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2024-01-08', 50.00),
    (102, 1, '2024-01-09', 75.50),
    (103, 2, '2024-01-10', 120.25);

  SELECT Users.UserID, Users.UserName, Orders.OrderID, Orders.OrderDate
FROM Users
LEFT JOIN Orders ON Users.UserID = Orders.UserID;

