# Data Analysis

# 1. Overall Document Processing Performance

SELECT SUM(wr.DocumentsReceived) AS Total_Documents_Received, 
       SUM(wr.DocumentsProcessed) AS Total_Documents_Processed,
       SUM(DocumentsReceived - DocumentsProcessed) AS Total_Documents_Remaining,
       ROUND(SUM(wr.DocumentsProcessed) * 100 / SUM(wr.DocumentsReceived) , 2) AS Pecentage_of_Documents_Processed
FROM workrequests AS wr;

# 2.Team-wise Workload and Pending Document Analysis

SELECT SUM(wr.DocumentsReceived) AS DocumentsReceived,
       SUM(wr.DocumentsProcessed) AS DocumentsProcessed,
       SUM(DocumentsReceived - DocumentsProcessed) AS DocumentsRemaining,
       wr.AssignedTeam AS AssignedTeam
FROM WorkRequests AS wr
GROUP BY wr.AssignedTeam
ORDER BY DocumentsProcessed DESC;

# 3. SLA Compliance Analysis
SELECT RequestID, DueDate, ActualDeliveryDate,
 CASE 
    WHEN ActualDeliveryDate <= DueDate THEN "On Time"
    WHEN ActualDeliveryDate > DueDate THEN "Delayed"
    ELSE "In Progress"
END AS SLA_Staus
FROM workrequests;

SELECT SLA_Status, COUNT(*)
FROM(
    SELECT RequestID, DueDate, ActualDeliveryDate,
    CASE 
       WHEN ActualDeliveryDate <= DueDate THEN "On Time"
       WHEN ActualDeliveryDate > DueDate THEN "Delayed"
       ELSE "In Progress"
    END AS SLA_Status
    FROM workrequests
    ) AS work_analysis
GROUP BY SLA_Status;

SELECT 
  COUNT( CASE
          WHEN ActualDeliveryDate <= DueDate THEN 1
         END
  ) AS OnTimeRequests,
  COUNT( CASE
		 WHEN ActualDeliveryDate IS NOT NULL THEN 1
         END
  ) AS TotalCompletedRequests,
 ROUND( COUNT( CASE
              WHEN ActualDeliveryDate <= DueDate THEN 1
              END
              ) *100 / COUNT( CASE
		      WHEN ActualDeliveryDate IS NOT NULL THEN 1
              END
			)
  ) AS SLA_Compliance_Percentage
  FROM workrequests;
  
# 4. Client-wise Workload and Document Processing Analysis

  SELECT c.clientname,
		COUNT(DISTINCT p.projectID) AS NumberOfProjects,
        COUNT(DISTINCT wr.RequestID) AS NumberOfWorkRequests,
        SUM(wr.DocumentsReceived) AS DocumentsReceived,
        SUM(wr.DocumentsProcessed) AS DocumentsProcessed,
        SUM(wr.DocumentsReceived - wr.DocumentsProcessed) AS DocumentsPending
  FROM clients AS c
  JOIN projects AS p
  ON c.clientID = p.clientID
  JOIN workrequests AS wr
  ON p.ProjectID = wr.ProjectID
  GROUP BY c.clientname
  ORDER BY DocumentsReceived DESC;
  
  # 5. Workflow Stage Turnaround Time (TAT) Analysis
  
  SELECT StageName,
         COUNT(*) AS TotalRecords,
         ROUND(AVG(StageTATDays), 0) AS AverageTATDays,
         MAX(StageTATDays) AS MaxTATDays
  FROM workflowstages
  GROUP BY StageName
  ORDER BY AverageTATDays DESC;
  
 # 6. Identify Work Requests with High Pending Document Volumes (CTE)
  WITH CTE AS( 
    SELECT wr.requestID, 
           wr.documentsreceived,
           wr.documentsprocessed,
		   (wr.documentsreceived - wr.documentsprocessed) AS documentspending
	FROM workrequests AS wr
    )
    SELECT CTE.requestID, CTE.documentspending
    FROM CTE
    WHERE documentspending > 5000;
  
# 7. Rank Clients Based on Total Documents Processed (Window Function)  
  SELECT c.clientID, 
         SUM(wr.DocumentsProcessed) AS documentsProcessed,
         RANK() OVER (ORDER BY SUM(wr.DocumentsProcessed) DESC)
  FROM clients AS c
  JOIN projects AS p
  ON c.ClientID = p.ClientID
  JOIN workrequests AS wr
  ON p.ProjectID = wr.ProjectID
  GROUP BY c.ClientID;
