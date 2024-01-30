create database if not exists exercise2;
use exercise2;

-- Tạo bảng company
CREATE TABLE company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);

-- Tạo bảng project
CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

-- Tạo bảng task
CREATE TABLE task (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(255) NOT NULL,
    time INT NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);

-- Chèn dữ liệu vào bảng company
INSERT INTO company (company_name) VALUES ('Company A'), ('Company B');

-- Chèn dữ liệu vào bảng project
INSERT INTO project (project_name, company_id) VALUES
    ('Project 1', 1),
    ('Project 2', 1),
    ('Project 3', 2);

-- Chèn dữ liệu vào bảng task
INSERT INTO task (task_name, time, project_id) VALUES
    ('Task A1', 10, 1),
    ('Task A2', 15, 1),
    ('Task B1', 12, 2),
    ('Task B2', 8, 2),
    ('Task C1', 20, 3);

-- a. Danh sách tất cả các công ty và số lượng dự án mà mỗi công ty đang thực hiện
SELECT c.company_name, COUNT(p.project_id) AS total_projects
FROM company c
LEFT JOIN project p ON c.company_id = p.company_id
GROUP BY c.company_id;

-- b. Thông tin về mỗi dự án, bao gồm tên dự án, tên công ty, và tổng số giờ ước tính để hoàn thành tất cả các task trong dự án
SELECT p.project_name, c.company_name, SUM(t.time) AS total_hours
FROM project p
JOIN company c ON p.company_id = c.company_id
JOIN task t ON p.project_id = t.project_id
GROUP BY p.project_id;

-- c. Thông tin về tất cả các task trong một dự án cụ thể, bao gồm tên task, số giờ dự kiến và thực tế để hoàn thành task
SELECT task_name, time
FROM task
WHERE project_id = 1;

-- d. Nâng cấp hệ thống bằng cách thêm bảng employee và liên kết nó với bảng task
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL
);

ALTER TABLE task
ADD COLUMN employee_id INT;

ALTER TABLE task
ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

-- e. Tính tổng số giờ đã dành cho mỗi nhân viên trên tất cả các task mà họ đã thực hiện
SELECT e.employee_name, SUM(t.time) AS total_hours
FROM employee e
LEFT JOIN task t ON e.employee_id = t.employee_id
GROUP BY e.employee_id;
