USE Testing_System_Assignment_1;

INSERT INTO Department (DepartmentName) VALUES
('Sale'),
('Marketing'),
('IT'),
('HR'),
('Finance'),
('Operations'),
('Research'),
('Customer Service'),
('Quality Assurance'),
('Production');


INSERT INTO Position (PositionName) VALUES
('Dev'),
('Test'),
('Scrum Master'),
('PM'),
('Analyst'),
('Designer'),
('Marketing Specialist'),
('HR Specialist'),
('Finance Analyst'),
('Operations Manager');
	
INSERT INTO Account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) VALUES
('user1@example.com', 'user1', 'User Onessss', 1, 1, '2022-01-01'),
('user2@example.com', 'user2', 'User Two', 2, 2, '2022-02-01'),
('user3@example.com', 'user3', 'User Three', 3, 3, '2022-03-01'),
('user4@example.com', 'user4', 'User Four', 4, 4, '2022-04-01'),
('user5@example.com', 'user5', 'User Five', 1, 1, '2022-05-01'),
('user6@example.com', 'user6', 'User Six', 2, 2, '2022-06-01'),
('user7@example.com', 'user7', 'User Seven', 3, 3, '2022-07-01'),
('user8@example.com', 'user8', 'User Eight', 4, 4, '2022-08-01'),
('user9@example.com', 'user9', 'User Nine', 5, 5, '2022-09-01'),
('user10@example.com', 'user10', 'User Ten', 5, 5, '2022-10-01');

INSERT INTO `Group` (GroupName, CreatorID, CreateDate) VALUES
('Development Team', 1, '2022-01-01'),
('Marketing Team', 2, '2022-02-01'),
('IT Support', 3, '2022-03-01'),
('HR Committee', 4, '2022-04-01'),
('Finance Department', 5, '2022-05-01'),
('Operations Team', 6, '2022-06-01'),
('Research Group', 7, '2022-07-01'),
('Customer Service Team', 8, '2022-08-01'),
('QA Team', 9, '2022-09-01'),
('Production Crew', 10, '2022-10-01');

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate) VALUES
(1, 1, '2022-01-01'),
(1, 2, '2022-02-01'),
(2, 3, '2022-03-01'),
(2, 4, '2022-04-01'),
(3, 5, '2022-05-01'),
(3, 6, '2022-06-01'),
(4, 7, '2022-07-01'),
(4, 8, '2022-08-01'),
(5, 9, '2022-09-01'),
(5, 10, '2022-10-01');

INSERT INTO TypeQuestion (TypeName) VALUES
('Essay'),
('Multiple-Choice');

INSERT INTO CategoryQuestion (CategoryName) VALUES
('Java'),
('.NET'),
('SQL'),
('Postman'),
('Ruby'),
('Networking'),
('Web Development'),
('Data Science'),
('UI/UX Design'),
('Security');

INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES
('What is Java Virtual Machine (JVM)?', 1, 1, 1, '2022-01-01'),
('Explain the concept of .NET Framework.', 2, 1, 2, '2022-02-01'),
('How does SQL JOIN work?', 3, 1, 3, '2022-03-01'),
('What is the purpose of Postman in API testing?', 4, 1, 4, '2022-04-01'),
('Explain the basics of Ruby programming language.', 5, 1, 5, '2022-05-01'),
('What is the OSI model in networking?', 6, 1, 6, '2022-06-01'),
('Discuss the key components of web development.', 7, 1, 7, '2022-07-01'),
('What is the role of data science in business?', 8, 1, 8, '2022-08-01'),
('How to design an effective UI/UX?', 9, 1, 9, '2022-09-01'),
('Explain the importance of security in software development.', 10, 1, 10, '2022-10-01');

INSERT INTO Answer (Content, QuestionID, IsCorrect) VALUES('Java Virtual Machine is an abstract machine that enables the Java applications to be platform-independent by converting Java bytecode into machine code.', 1, true),
('.NET Framework is a software framework developed by Microsoft that runs primarily on Microsoft Windows.', 2, true),
('SQL JOIN is used to combine rows from two or more tables based on a related column between them.', 3, true),
('Postman is a popular API testing tool that allows developers to test API endpoints by sending requests and receiving responses.', 4, true),
('Ruby is a dynamic, object-oriented programming language known for its simplicity and productivity.', 5, true),
('The OSI model is a conceptual framework that standardizes the functions of a communication system into seven abstraction layers.', 6, true),
('Key components of web development include HTML, CSS, JavaScript, and server-side technologies like PHP or Node.js.', 7, true),
('Data science involves analyzing and interpreting complex data sets to inform business decision-making.', 8, true),
('Effective UI/UX design focuses on user experience, visual design, and usability to create a positive interaction between users and the product.', 9, true),
('Security in software development is crucial to protect systems, data, and users from unauthorized access and potential threats.', 10, true);

INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES
('EXAM001', 'Java Basics Exam', 1, 60, 1, '2022-01-01'),
('EXAM002', '.NET Fundamentals Exam', 2, 45, 2, '2022-02-01'),
('EXAM003', 'SQL Mastery Exam', 3, 75, 3, '2022-03-01'),
('EXAM004', 'Postman Proficiency Exam', 4, 30, 4, '2022-04-01'),
('EXAM005', 'Ruby Essentials Exam', 5, 60, 5, '2022-05-01'),
('EXAM006', 'Networking Basics Exam', 6, 45, 6, '2022-06-01'),
('EXAM007', 'Web Development Skills Exam', 7, 90, 7, '2022-07-01'),
('EXAM008', 'Data Science Fundamentals Exam', 8, 60, 8, '2022-08-01'),
('EXAM009', 'UI/UX Design Exam', 9, 45, 9, '2022-09-01'),
('EXAM010', 'Software Security Exam', 10, 75, 10, '2022-10-01');

INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);