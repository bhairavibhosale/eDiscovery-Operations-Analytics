# 01_Database_and_Table_Creation.sql

# Create eDiscoveryAnalytics database

CREATE database EDISCOVERYANALYTICS;

USE EDISCOVERYANALYTICS;

# Create Clients Table
CREATE table Clients(
ClientID VARCHAR(10) PRIMARY KEY,
ClientName VARCHAR(100),
Industry VARCHAR(100),
Region VARCHAR(50)
);

# Create Projects Table

CREATE TABLE Projects(
ProjectID VARCHAR(10) PRIMARY KEY,
ClientID VARCHAR(10),
ProjectName VARCHAR(100),
ProjectType VARCHAR(100),
StartDate DATE,
EndDate DATE,
ProjectStatus VARCHAR(30),
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

# Create WorkRequests Table

CREATE TABLE WorkRequests (
    RequestID VARCHAR(15) PRIMARY KEY,
    ProjectID VARCHAR(10),
    RequestType VARCHAR(50),
    ReceivedDate DATE,
    DueDate DATE,
    ActualDeliveryDate DATE,
    DocumentsReceived INT,
    DocumentsProcessed INT,
    RequestPriority VARCHAR(20),
    AssignedTeam VARCHAR(30),
    OverallStatus VARCHAR(30),

    FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID)
);

# Create WorkFlowStages Table

CREATE TABLE WorkflowStages (
    WorkflowID INT AUTO_INCREMENT PRIMARY KEY,
    RequestID VARCHAR(15),
    StageSequence INT,
    StageName VARCHAR(50),
    Status VARCHAR(30),
    StartDate DATE,
    CompletionDate DATE,
    StageTATDays INT,

    FOREIGN KEY (RequestID)
        REFERENCES WorkRequests(RequestID)
);

SHOW TABLES;

# Insert Clients Records

INSERT INTO Clients
(ClientID, ClientName, Industry, Region)
VALUES
('CL001', 'Apex Legal Group', 'Legal', 'North America'),
('CL002', 'Sterling Financial', 'Finance', 'North America'),
('CL003', 'Vertex Technologies', 'Technology', 'Europe'),
('CL004', 'Horizon Healthcare', 'Healthcare', 'North America'),
('CL005', 'BluePeak Corporation', 'Manufacturing', 'Asia Pacific'),
('CL006', 'Meridian Holdings', 'Finance', 'Europe'),
('CL007', 'Northstar Energy', 'Energy', 'North America'),
('CL008', 'Pinnacle Retail', 'Retail', 'Asia Pacific'),
('CL009', 'Crestview Insurance', 'Insurance', 'Europe'),
('CL010', 'Summit Pharmaceuticals', 'Healthcare', 'North America'),
('CL011', 'Evergreen Manufacturing', 'Manufacturing', 'Europe'),
('CL012', 'Atlas Consulting', 'Consulting', 'Asia Pacific'),
('CL013', 'Silverline Telecom', 'Telecommunications', 'North America'),
('CL014', 'Redwood Enterprises', 'Legal', 'Europe'),
('CL015', 'Clearwater Capital', 'Finance', 'Asia Pacific');

SELECT * FROM Clients;

SELECT COUNT(*) FROM Clients;

# Insert Projects Records

INSERT INTO Projects
(ProjectID, ClientID, ProjectName, ProjectType, StartDate, EndDate, ProjectStatus)
VALUES
('PR001', 'CL001', 'Contract Dispute Review', 'Document Review', '2026-01-05', '2026-02-15', 'Completed'),
('PR002', 'CL002', 'Financial Fraud Investigation', 'Investigation', '2026-01-10', '2026-03-20', 'Completed'),
('PR003', 'CL003', 'Intellectual Property Litigation', 'Litigation Support', '2026-02-01', '2026-05-30', 'In Progress'),
('PR004', 'CL004', 'Healthcare Compliance Audit', 'Compliance', '2026-02-10', '2026-04-15', 'Completed'),
('PR005', 'CL005', 'Corporate Merger Review', 'Due Diligence', '2026-03-01', '2026-06-30', 'In Progress'),
('PR006', 'CL006', 'Regulatory Investigation', 'Investigation', '2026-03-05', '2026-07-15', 'In Progress'),
('PR007', 'CL007', 'Energy Contract Litigation', 'Litigation Support', '2026-01-15', '2026-03-31', 'Completed'),
('PR008', 'CL008', 'Retail Data Compliance', 'Compliance', '2026-04-01', '2026-06-15', 'In Progress'),
('PR009', 'CL009', 'Insurance Claims Investigation', 'Investigation', '2026-02-20', '2026-05-20', 'Completed'),
('PR010', 'CL010', 'Pharmaceutical Patent Dispute', 'Document Review', '2026-04-10', '2026-08-30', 'In Progress'),
('PR011', 'CL011', 'Manufacturing Contract Review', 'Document Review', '2026-05-01', '2026-07-31', 'In Progress'),
('PR012', 'CL012', 'Consulting Data Investigation', 'Investigation', '2026-05-15', '2026-08-15', 'In Progress'),
('PR013', 'CL013', 'Telecom Regulatory Review', 'Compliance', '2026-01-20', '2026-04-30', 'Completed'),
('PR014', 'CL014', 'Employment Litigation Review', 'Litigation Support', '2026-06-01', '2026-09-30', 'In Progress'),
('PR015', 'CL015', 'Investment Records Investigation', 'Investigation', '2026-06-15', '2026-10-15', 'In Progress'),
('PR016', 'CL001', 'Email Evidence Processing', 'Data Processing', '2026-07-01', '2026-08-15', 'Completed'),
('PR017', 'CL002', 'Regulatory Document Review', 'Document Review', '2026-07-10', '2026-10-31', 'In Progress'),
('PR018', 'CL003', 'Data Preservation Project', 'Data Collection', '2026-08-01', '2026-11-30', 'In Progress'),
('PR019', 'CL004', 'Medical Records Investigation', 'Investigation', '2026-08-15', '2026-12-15', 'In Progress'),
('PR020', 'CL005', 'Merger Communications Review', 'Document Review', '2026-09-01', '2026-12-31', 'In Progress');

SELECT * FROM Projects;

SELECT COUNT(*) FROM Projects;

SELECT c.ClientID, p.ProjectID, p.ProjectName,p.ProjectType,p.StartDate,p.EndDate,p.ProjectStatus
FROM Clients as c
LEFT JOIN Projects AS P
ON c.ClientID = p.ClientID;

# Insert WorkRequests Records

INSERT INTO WorkRequests
(RequestID, ProjectID, RequestType, ReceivedDate, DueDate,
 ActualDeliveryDate, DocumentsReceived, DocumentsProcessed,
 RequestPriority, AssignedTeam, OverallStatus)
VALUES
('WR001', 'PR001', 'Document Processing', '2026-01-06', '2026-01-12', '2026-01-11', 12000, 12000, 'High', 'Team A', 'Completed'),
('WR002', 'PR001', 'Document Review', '2026-01-12', '2026-01-25', '2026-01-28', 12000, 11500, 'Medium', 'Team B', 'Completed'),
('WR003', 'PR002', 'Data Collection', '2026-01-11', '2026-01-20', '2026-01-19', 25000, 25000, 'High', 'Team A', 'Completed'),
('WR004', 'PR002', 'Document Processing', '2026-01-20', '2026-02-05', '2026-02-08', 25000, 24500, 'High', 'Team C', 'Completed'),
('WR005', 'PR003', 'Data Collection', '2026-02-02', '2026-02-12', '2026-02-11', 18000, 18000, 'Medium', 'Team A', 'Completed'),
('WR006', 'PR003', 'Document Processing', '2026-02-12', '2026-02-25', NULL, 18000, 15000, 'High', 'Team C', 'In Progress'),
('WR007', 'PR004', 'Document Review', '2026-02-11', '2026-02-28', '2026-02-27', 9000, 9000, 'Medium', 'Team B', 'Completed'),
('WR008', 'PR005', 'Data Collection', '2026-03-02', '2026-03-15', '2026-03-14', 40000, 40000, 'High', 'Team A', 'Completed'),
('WR009', 'PR005', 'Document Processing', '2026-03-15', '2026-04-05', NULL, 40000, 32000, 'High', 'Team C', 'In Progress'),
('WR010', 'PR006', 'Document Review', '2026-03-06', '2026-03-25', '2026-03-29', 22000, 21500, 'High', 'Team B', 'Completed'),
('WR011', 'PR007', 'Document Processing', '2026-01-16', '2026-01-30', '2026-01-29', 15000, 15000, 'Low', 'Team C', 'Completed'),
('WR012', 'PR008', 'Data Collection', '2026-04-02', '2026-04-15', NULL, 30000, 18000, 'High', 'Team A', 'In Progress'),
('WR013', 'PR009', 'Document Review', '2026-02-21', '2026-03-10', '2026-03-12', 11000, 10800, 'Medium', 'Team B', 'Completed'),
('WR014', 'PR010', 'Document Processing', '2026-04-11', '2026-04-30', NULL, 35000, 28000, 'High', 'Team C', 'In Progress'),
('WR015', 'PR011', 'Document Processing', '2026-05-02', '2026-05-20', NULL, 16000, 10000, 'Medium', 'Team C', 'In Progress'),
('WR016', 'PR012', 'Data Collection', '2026-05-16', '2026-05-30', NULL, 14000, 9000, 'Medium', 'Team A', 'In Progress'),
('WR017', 'PR013', 'Document Review', '2026-01-21', '2026-02-10', '2026-02-09', 20000, 20000, 'Low', 'Team B', 'Completed'),
('WR018', 'PR014', 'Document Processing', '2026-06-02', '2026-06-20', NULL, 28000, 17000, 'High', 'Team C', 'In Progress'),
('WR019', 'PR015', 'Data Collection', '2026-06-16', '2026-06-30', NULL, 32000, 22000, 'High', 'Team A', 'In Progress'),
('WR020', 'PR017', 'Document Review', '2026-07-11', '2026-07-30', NULL, 24000, 19000, 'Medium', 'Team B', 'In Progress'),
('WR021', 'PR018', 'Data Collection', '2026-08-02', '2026-08-15', NULL, 19000, 12000, 'High', 'Team A', 'In Progress'),
('WR022', 'PR019', 'Document Processing', '2026-08-16', '2026-09-05', NULL, 26000, 15000, 'High', 'Team C', 'In Progress'),
('WR023', 'PR020', 'Document Review', '2026-09-02', '2026-09-25', NULL, 21000, 8000, 'Medium', 'Team B', 'In Progress'),
('WR024', 'PR016', 'Document Processing', '2026-07-02', '2026-07-15', '2026-07-14', 13000, 13000, 'Low', 'Team C', 'Completed'),
('WR025', 'PR017', 'Document Processing', '2026-07-15', '2026-08-05', NULL, 24000, 16000, 'High', 'Team C', 'In Progress'),
('WR026', 'PR003', 'Quality Control', '2026-03-01', '2026-03-10', NULL, 18000, 17500, 'High', 'Team D', 'In Progress'),
('WR027', 'PR006', 'Quality Control', '2026-04-01', '2026-04-12', '2026-04-15', 22000, 21000, 'Medium', 'Team D', 'Completed'),
('WR028', 'PR010', 'Document Review', '2026-05-01', '2026-05-25', NULL, 35000, 20000, 'High', 'Team B', 'In Progress'),
('WR029', 'PR014', 'Quality Control', '2026-07-01', '2026-07-15', NULL, 28000, 15000, 'Medium', 'Team D', 'In Progress'),
('WR030', 'PR020', 'Quality Control', '2026-09-26', '2026-10-05', NULL, 21000, 5000, 'High', 'Team D', 'In Progress');

SELECT * FROM WorkRequests;

SELECT COUNT(*) FROM WorkRequests;

SELECT COUNT(*), OverallStatus
FROM WorkRequests
GROUP BY OverallStatus;

# Insert WorkFlowStages Records

INSERT INTO WorkflowStages
(RequestID, StageSequence, StageName, Status, StartDate, CompletionDate, StageTATDays)
VALUES
('WR001', 1, 'Data Collection', 'Completed', '2026-01-06', '2026-01-07', 1),
('WR001', 2, 'Document Processing', 'Completed', '2026-01-07', '2026-01-09', 2),
('WR001', 3, 'Quality Control', 'Completed', '2026-01-09', '2026-01-11', 2),

('WR002', 1, 'Document Review', 'Completed', '2026-01-12', '2026-01-28', 16),

('WR003', 1, 'Data Collection', 'Completed', '2026-01-11', '2026-01-14', 3),
('WR003', 2, 'Document Processing', 'Completed', '2026-01-14', '2026-01-19', 5),

('WR004', 1, 'Document Processing', 'Completed', '2026-01-20', '2026-01-28', 8),
('WR004', 2, 'Quality Control', 'Completed', '2026-01-28', '2026-02-08', 11),

('WR005', 1, 'Data Collection', 'Completed', '2026-02-02', '2026-02-05', 3),
('WR005', 2, 'Document Processing', 'Completed', '2026-02-05', '2026-02-11', 6),

('WR006', 1, 'Document Processing', 'In Progress', '2026-02-12', NULL, NULL),

('WR007', 1, 'Document Review', 'Completed', '2026-02-11', '2026-02-27', 16),

('WR008', 1, 'Data Collection', 'Completed', '2026-03-02', '2026-03-14', 12),

('WR009', 1, 'Document Processing', 'In Progress', '2026-03-15', NULL, NULL),

('WR010', 1, 'Document Review', 'Completed', '2026-03-06', '2026-03-29', 23),

('WR011', 1, 'Document Processing', 'Completed', '2026-01-16', '2026-01-29', 13),

('WR012', 1, 'Data Collection', 'In Progress', '2026-04-02', NULL, NULL),

('WR013', 1, 'Document Review', 'Completed', '2026-02-21', '2026-03-12', 19),

('WR014', 1, 'Document Processing', 'In Progress', '2026-04-11', NULL, NULL),

('WR015', 1, 'Document Processing', 'In Progress', '2026-05-02', NULL, NULL),

('WR016', 1, 'Data Collection', 'In Progress', '2026-05-16', NULL, NULL),

('WR017', 1, 'Document Review', 'Completed', '2026-01-21', '2026-02-09', 19),

('WR018', 1, 'Document Processing', 'In Progress', '2026-06-02', NULL, NULL),

('WR019', 1, 'Data Collection', 'In Progress', '2026-06-16', NULL, NULL),

('WR020', 1, 'Document Review', 'In Progress', '2026-07-11', NULL, NULL),

('WR021', 1, 'Data Collection', 'In Progress', '2026-08-02', NULL, NULL),

('WR022', 1, 'Document Processing', 'In Progress', '2026-08-16', NULL, NULL),

('WR023', 1, 'Document Review', 'In Progress', '2026-09-02', NULL, NULL),

('WR024', 1, 'Document Processing', 'Completed', '2026-07-02', '2026-07-14', 12),

('WR025', 1, 'Document Processing', 'In Progress', '2026-07-15', NULL, NULL),

('WR026', 1, 'Quality Control', 'In Progress', '2026-03-01', NULL, NULL),

('WR027', 1, 'Quality Control', 'Completed', '2026-04-01', '2026-04-15', 14),

('WR028', 1, 'Document Review', 'In Progress', '2026-05-01', NULL, NULL),

('WR029', 1, 'Quality Control', 'In Progress', '2026-07-01', NULL, NULL),

('WR030', 1, 'Quality Control', 'In Progress', '2026-09-26', NULL, NULL);

SELECT * FROM WorkflowStages;

SELECT COUNT(*) FROM WorkflowStages;

SELECT StageName, Status, COUNT(*) FROM WorkflowStages
GROUP BY StageName, Status;