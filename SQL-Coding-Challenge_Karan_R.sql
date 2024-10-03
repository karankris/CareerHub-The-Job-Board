
                                                 -- SQL Coding Challenge

-- 1.Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”.
create database CareerHub;
use CareerHub;

-- 2. Create tables for Companies, Jobs, Applicants and Applications.
-- 3  Define appropriate primary keys, foreign keys, and constraints.

-- Created Tables and appropriate primary keys, foreign keys, and constraints
-- Table: Companies
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255),
);
INSERT INTO Companies (CompanyID, CompanyName, Location)
VALUES 
(1, 'Google', 'New York'),
(2, 'Innovatech', 'San Francisco'),
(3, 'DevMasters', 'Los Angeles'),
(4, 'Hexaware', 'Chennai'),
(5, 'OpenAI', 'Chicago');


--Table: Jobs
CREATE TABLE  Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(10, 2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
VALUES
(101, 1, 'Software Engineer', 'Develop and maintain software solutions.', 'New York', 75000, 'Full-time', '2024-01-15 09:00:00'),
(102, 2, 'Data Scientist', 'Analyze data for insights.', 'San Francisco', 90000, 'Full-time', '2024-01-18 10:30:00'),
(103, 3, 'Frontend Developer', 'Build web interfaces.', 'Los Angeles', 85000, 'Full-time', '2024-02-01 11:00:00'),
(104, 4, 'Backend Engineer', 'Work on server-side logic.', 'Chennai', 95000, 'Full-time', '2024-02-15 09:30:00'),
(105, 5, 'Network Engineer', 'Maintain network infrastructure.', 'Chicago', 65000, 'Full-time', '2024-02-20 13:00:00');


-- Table: Applicants
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    Resume TEXT
);
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume)
VALUES
(1, 'Sam', 'Altman', 'samalt@example.com', '555-1234', 'Experienced software engineer with expertise in web development.'),
(2, 'Sundhar', 'Pichai', 'sundharp@example.com', '555-5678', 'Data scientist with a passion for machine learning.'),
(3, 'Emily', 'Jones', 'emilyjones@example.com', '555-9012', 'Frontend developer specializing in UI/UX design.'),
(4, 'Karan', 'Ravichandar', 'karanravi@example.com', '555-3456', 'Backend engineer with 3 years experience and a focus on microservices.'),
(5, 'Sarah', 'Davis', 'sarahdavis@example.com', '555-7890', 'Network engineer experienced with Cisco systems.');


-- Table: Applications
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES
(1001, 101, 1, '2024-03-01 14:00:00', 'I am passionate about software engineering and would love to join your team.'),
(1002, 102, 2, '2024-03-02 15:00:00', 'I believe my data analysis skills would be a great asset.'),
(1003, 103, 3, '2024-03-03 16:00:00', 'I am excited about the opportunity to work as a frontend developer.'),
(1004, 104, 4, '2024-03-04 17:00:00', 'My experience in backend development would be a great fit.'),
(1005, 105, 5, '2024-03-05 18:00:00', 'I would love to work as a network engineer at your company.');

--List of all the tables
select * from Companies;
select * from Jobs;
select * from Applications;
select * from Applications;

-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.
DROP TABLE IF EXISTS Applications;    -- If the table already exisits it will drop the entire table
DROP TABLE IF EXISTS Jobs;
DROP TABLE IF EXISTS Applicants;
DROP TABLE IF EXISTS Companies;

-- 5. Write an SQL query to count the number of applications received for each job listing in the "Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all jobs, even if they have no applications.

SELECT j.JobTitle, COUNT(a.ApplicationID) AS ApplicationCount
FROM Jobs j
LEFT JOIN Applications a ON j.JobID = a.JobID
GROUP BY j.JobTitle, j.JobID;

-- 6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range. Allow parameters for the minimum and maximum salary values. Display the job title, company name, location, and salary for each matching job. 

SELECT j.JobTitle, c.CompanyName, j.JobLocation, j.Salary
FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE j.Salary BETWEEN 50000 AND 100000;


-- 7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a parameter for the ApplicantID, and return a result set with the job titles, company names, and application dates for all the jobs the applicant has applied to.
DECLARE @ApplicantID INT = 4; 

SELECT j.JobTitle, c.CompanyName, a.ApplicationDate
FROM Applications a
JOIN Jobs j ON a.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE a.ApplicantID = @ApplicantID;

-- 8. Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table.Ensure that the query filters out jobs with a salary of zero. 
SELECT AVG(Salary) AS AverageSalary
FROM Jobs
WHERE Salary > 0;

-- 9. Write an SQL query to identify the company that has posted the most job listings. Display the company name along with the count of job listings they have posted. Handle ties if multiple companies have the same maximum count.

SELECT TOP 1 c.CompanyName, COUNT(j.JobID) AS JobCount
FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
GROUP BY c.CompanyID, c.CompanyName
ORDER BY JobCount DESC;

-- 10. Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.


SELECT a.FirstName, a.LastName, a.Email
FROM Applications app
JOIN Applicants a ON app.ApplicantID = a.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE c.Location = 'Chennai' AND a.Resume LIKE '%3 years%';

-- 11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.

SELECT DISTINCT JobTitle
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

--12. Find the jobs that have not received any applications.

SELECT j.JobTitle
FROM Jobs j
LEFT JOIN Applications a ON j.JobID = a.JobID
WHERE a.ApplicationID IS NULL;

-- 13. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.
SELECT a.FirstName, a.LastName, c.CompanyName, j.JobTitle
FROM Applications app
JOIN Applicants a ON app.ApplicantID = a.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID;

-- 14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.

SELECT c.CompanyName, COUNT(j.JobID) AS JobCount
FROM Companies c
LEFT JOIN Jobs j ON c.CompanyID = j.CompanyID
GROUP BY c.CompanyID, c.CompanyName;

-- 15. List all applicants along with the companies and positions they have applied for, including those who have not applied.

SELECT a.FirstName, a.LastName, c.CompanyName, j.JobTitle
FROM Applicants a
LEFT JOIN Applications app ON a.ApplicantID = app.ApplicantID
LEFT JOIN Jobs j ON app.JobID = j.JobID
LEFT JOIN Companies c ON j.CompanyID = c.CompanyID;

-- 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.

SELECT c.CompanyName, j.JobTitle, j.Salary
FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE j.Salary > (SELECT AVG(Salary) FROM Jobs WHERE Salary > 0);

-- 17. Display a list of applicants with their names and a concatenated string of their city and state.
SELECT 
    CONCAT(a.FirstName, ' ', a.LastName) AS FullName, 
    CONCAT(c.Location, ', ', c.Location) AS CityState 
FROM Applicants a
JOIN Applications app ON a.ApplicantID = app.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID;

-- 18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

SELECT JobTitle
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

-- 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.

SELECT a.FirstName, a.LastName, j.JobTitle
FROM Applicants a
LEFT JOIN Applications app ON a.ApplicantID = app.ApplicantID
LEFT JOIN Jobs j ON app.JobID = j.JobID;

-- 20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience. For example: city=Chennai

SELECT a.FirstName, a.LastName, c.CompanyName
FROM Applicants a
JOIN Applications app ON a.ApplicantID = app.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE c.Location = 'Chennai' AND a.Resume LIKE '%3 years%'; -- More than 2 years


