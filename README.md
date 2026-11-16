# eDiscovery Operations Analytics

## Project Overview

This is an end-to-end data analytics project focused on analysing eDiscovery operations, document processing efficiency, workload distribution, SLA compliance, client performance, and workflow turnaround time (TAT).

The project uses **MySQL** for data management and analysis, with **Power BI** for interactive dashboard development and business insights.

## Business Objectives

The objective is to analyse operational data and identify insights that can help understand:

- Document processing efficiency and pending document volumes.
- Workload distribution across operational teams.
- SLA compliance and delayed requests.
- Client-wise document processing performance.
- Workflow stage turnaround time (TAT).
- Potential operational bottlenecks.

## Tools & Technologies

- **Database:** MySQL 8.0
- **Data Analysis:** SQL
- **Data Visualization:** Microsoft Power BI (Upcoming)

## Database Structure

The project consists of four relational tables:

| Table | Description |
|---|---|
| Clients | Stores client information |
| Projects | Stores project details associated with clients |
| WorkRequests | Contains document processing requests and operational details |
| WorkflowStages | Tracks individual workflow stages and turnaround time |

### Dataset Overview

| Table | Records |
|---|---:|
| Clients | 15 |
| Projects | 20 |
| WorkRequests | 30 |
| WorkflowStages | 35 |

## SQL Analysis

The SQL phase covers the following areas:

1. **Overall Document Processing Performance** – Analysing total documents received, processed, and pending.
2. **Team-wise Workload Analysis** – Evaluating document workload and pending volumes across teams.
3. **SLA Compliance Analysis** – Identifying on-time, delayed, and in-progress requests.
4. **Client-wise Analysis** – Comparing client workload and document processing volumes.
5. **Workflow TAT Analysis** – Evaluating average and maximum turnaround time across workflow stages.
6. **CTE Analysis** – Identifying work requests with high pending document volumes.
7. **Window Functions** – Ranking clients based on total documents processed.

## Key Findings

- **673,000** documents received.
- **519,800** documents processed.
- **153,200** documents pending.
- Overall processing completion rate: **77.24%**.
- SLA compliance: **61.54%** of completed requests were delivered on time.
- Document Review recorded the highest average workflow TAT at **19 days**.

## SQL Concepts Demonstrated

- Database and table creation
- Primary and foreign keys
- Data validation
- SELECT, WHERE and ORDER BY
- Aggregate functions
- GROUP BY and HAVING
- Joins
- CASE WHEN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK()

## Repository Structure

```text
eDiscovery-Operations-Analytics/
├── SQL/
│   ├── 01_Data_Creation.sql
│   └── 02_Data_Analysis.sql
├── PowerBI/
└── README.md
```

## Project Status

- [x] Database creation and table design
- [x] Data insertion and validation
- [x] SQL business analysis
- [x] CTEs and window functions
- [ ] Power BI dashboard development
- [ ] Final business insights and recommendations

**Bhairavi Bhosale**

Data Operations Professional | Aspiring Data Analyst
