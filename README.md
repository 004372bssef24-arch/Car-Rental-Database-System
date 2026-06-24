# Car Rental and Maintenance Service – Relational Database System

## 📌 Project Overview
This project implements an enterprise-grade relational database architecture for a modern Car Rental and Maintenance Service. Designed to capture the entire system lifecycle, this repository covers conceptual data modeling, enhanced entity specialization (EERD), structural normalization up to Third Normal Form (3NF), and complete programmatic implementation within Microsoft SQL Server.

## 🎯 Objectives
* **Production-Ready Schema:** Design and implement an optimized, data-integrity-focused database system for scalable car rental workflows.
* **Advanced SQL Application:** Leverage declarative integrity constraints, complex multi-table execution paths, analytic window aggregations, materialized abstraction views, and automated transaction triggers.
* **Comprehensive Documentation:** Provide transparent engineering artifacts, including verified data flow schemas, physical relational mapping profiles, and benchmarked execution script outputs.

## 👥 Engineering Team
| Student Name | Registration Number | Academic Focus |
| :--- | :--- | :--- |
| **Iqbal Hassan Tariq** | 4361/BSSE/F24 | Software Engineering |
| **M. Hasnain Baig** | 4372/BSSE/F24 | Software Engineering |
| **Habib Ullah ** | 4380/BSSE/F24 | Software Engineering |
| **Nasrullah Malik** | 4583/BSSE/F24 | Software Engineering |

* **Academic Supervisor:** Prof. Shakeel Ahmad  
* **Institution:** International Islamic University, Islamabad  
* **Department:** Department of Software Engineering  

---

## 🛠️ Tools & Technologies
* **RDBMS Platform:** Microsoft SQL Server (2016+)
* **Database Administration Environment:** SQL Server Management Studio (SSMS v18.0+)
* **Vector Architecture Modeling:** Draw.io / Lucidchart
* **Technical Compilations:** Markdown / Adobe PDF Engine

---

## 🗂️ Repository Architecture
```text
Car-Rental-Database-System/
│
├── IDS_Schema_Design.sql       # DDL Script: Comprehensive DDL Schema Configuration
├── IDS_Data_Population.sql     # DML Script: Transactionally safe sample datasets
├── IDS_Business_Queries.sql    # DML Analytic Execution Layer: Joins, Aggregations, SPs, Triggers
├── Final_Report.pdf            # Engineering Manual: Complete 15-page systems profile
├── EER_Diagram.png             # Modeling Asset: Enhanced Entity-Relationship Diagram
│
├── Query_Outputs/              # Verified Verification Layer (Run Benchmarks)
│   ├── Q01_ActiveRentals.png
│   ├── Q02_VehicleFleetBreakdown.png
│   └── Q03_BranchRevenueAnalysis.png
│
├── LICENSE                     # Open Source Licensing Engine (MIT)
└── .gitignore                  # Active Git Environmental Tracking Filter
🗄️ Database Normalization Profile (3NF Compliance)To mitigate mutation anomalies and completely isolate transactional redundancy, the operational structure is divided into 18 distinct relations:Superclass Relations: Customer, StaffSubclass Subtypes (Is-A Specializations): Individual, Corporate, Manager, SalesAgentCore Entity Profiles: Branch, Address, Vehicle_Type, Car, Rental, Payment, Insurance_Policy, MechanicWeak Entity Systems: Maintenance_Record (Identified via structural composite dependency: (CarID, RecordID))Atomicity Normalization (Multi-valued): Customer_PhoneAssociative Relation Mapping: Rental_Car (Resolves operational Many-to-Many structural dependency between Rental and Car)Aggregated Operational Boundaries: Rental_TransactionData Integrity GuardrailsSubtype Specialization Rules: Configured with strict Total Specialization (double-line) parameters alongside structural Overlapping constraints where applicable.Referential Integrity Pipelines: Fully managed using declarative engine cascading mechanics (ON DELETE CASCADE, SET NULL, NO ACTION).📊 Programmatic Query MatricesQuery FingerprintExecution StrategyPractical Application TargetQuery 01INNER JOIN Multi-PathExtracts live operational parameters linking customers, staff, and branches.Query 02LEFT OUTER JOINAudits vehicle category distributions, safely capturing zero-count lines.Query 03SUM + GROUP BY + HAVINGRenders location-based financial statements filtering target thresholds.Query 04Scalar Metrics AggregationTracks computational pricing averages across active vehicle classes.Query 05Correlated Subquery (IN)Identifies enterprise VIP profiles interacting with premium vehicle classes.Query 06Mathematical SubqueryIsolates individual fleet vehicle values operating above median costs.Query 07Relational Subquery (EXISTS)Maps organizational branches currently managing active repair jobs.Query 08Materialized View Abstractionvw_ActiveRentalDetails: Flattens a high-cost 5-table schema path into an active query stream.Query 09Procedural Database Triggertrg_UpdateCarStatusOnRental: Automates instant status switches during operational mutations.Query 10Enterprise Stored ProcedureHandles structural check-in cycles, calculating damage variables natively.🚀 Setup & Execution DeploymentEnvironmental PrerequisitesMicrosoft SQL Server Enterprise / Developer / Express Edition (2016 or newer)SQL Server Management Studio (SSMS)Step-by-Step System InitializationClone the Asset Repository:Bashgit clone [https://github.com/YourUsername/Car-Rental-Database-System.git](https://github.com/YourUsername/Car-Rental-Database-System.git)
cd Car-Rental-Database-System
Provision the RDBMS Container: Open SSMS, connect to your active engine instance, and execute:SQLCREATE DATABASE CarRentalDB;
GO
USE CarRentalDB;
GO
Build the Physical Schema (DDL): Open and execute the contents of IDS_Schema_Design.sql to compile all 18 tables, primary keys, foreign keys, and attribute data constraints.Seed the Database Environment (DML): Open and execute IDS_Data_Population.sql. Note: The data population sequences are arranged sequentially to guarantee relational keys validate smoothly without violation exceptions.Execute Analytical Testing Suites: Run IDS_Business_Queries.sql to evaluate tracking views, procedures, and report outputs.Unit Testing: Trigger Functionality ValidationTo confirm the reactive state automation engines function correctly under payload stress, run the following benchmark script:SQL-- Step 1: Append a test transactional relationship record
INSERT INTO Rental_Car (RentalID, CarID, ReturnDate, DamageFee)
VALUES (10, 1, NULL, 0);
GO

-- Step 2: Validate that 'trg_UpdateCarStatusOnRental' systematically shifted Fleet Car #1 to 'Rented'
SELECT CarID, RegistrationNumber, OperationalStatus 
FROM Car 
WHERE CarID = 1;
GO

-- Step 3: Transactional Cleanup Cycle
DELETE FROM Rental_Car 
WHERE RentalID = 10 AND CarID = 1;
GO
📝 System Architecture RequirementsHost Environment: Windows 10 / 11 Pro / Enterprise Edition (or compatible Linux runtime hosting MSSQL instances)RAM Limits: 4GB Baseline Minimum (8GB+ Recommended for execution parallelization profiling)Storage Profiles: ~100MB allocation envelope for base schema files, indexed tablespaces, and tracking logs.
