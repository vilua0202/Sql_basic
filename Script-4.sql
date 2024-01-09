-- Create Database
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;

-- Use Database
USE Testing_System_Assignment_1;

-- Create Department Table
CREATE TABLE IF NOT EXISTS Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);

-- Create Position Table
CREATE TABLE IF NOT EXISTS `Position` (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(255) NOT NULL
);

-- Create Account Table
CREATE TABLE IF NOT EXISTS Account (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    FullName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

-- Create Group Table
CREATE TABLE IF NOT EXISTS `Group` (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(255) NOT NULL,
    CreatorID INT,
    CreateDate DATE,
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);

-- Create GroupAccount Table
CREATE TABLE IF NOT EXISTS GroupAccount (
    GroupID INT,
    AccountID INT,
    JoinDate DATE,
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Create TypeQuestion Table
CREATE TABLE IF NOT EXISTS TypeQuestion (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(255) NOT NULL
);

-- Create CategoryQuestion Table
CREATE TABLE IF NOT EXISTS CategoryQuestion (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Create Question Table
CREATE TABLE IF NOT EXISTS Question (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);

-- Create Answer Table
CREATE TABLE IF NOT EXISTS Answer (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    QuestionID INT,
    IsCorrect BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- Create Exam Table
CREATE TABLE IF NOT EXISTS Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    Code VARCHAR(255) NOT NULL,
    Title VARCHAR(255) NOT NULL,
    CategoryID INT,
    Duration INT,
    CreatorID INT,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);

-- Create ExamQuestion Table
CREATE TABLE IF NOT EXISTS ExamQuestion (
    ExamID INT,
    QuestionID INT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);