-- ==============================================================================
-- PART 1: DATA DEFINITION LANGUAGE (DDL) SCRIPT
-- RDBMS: Microsoft SQL Server (SSMS) / T-SQL
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. DROP EXISTING TABLES (Reverse Dependency Order to prevent FK errors)
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS Rental_Transaction;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Rental_Car;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Maintenance_Record;
DROP TABLE IF EXISTS Insurance_Policy;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Vehicle_Type;
DROP TABLE IF EXISTS Mechanic;
DROP TABLE IF EXISTS SalesAgent;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Corporate;
DROP TABLE IF EXISTS Individual;
DROP TABLE IF EXISTS Customer_Phone;
DROP TABLE IF EXISTS Customer;

-- ------------------------------------------------------------------------------
-- 2. CREATE TABLES (Dependency Order)
-- ------------------------------------------------------------------------------

-- ==========================================
-- LEVEL 0: Foundation Tables (Independent)
-- ==========================================

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Vehicle_Type (
    VehicleTypeID INT PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL,
    SeatingCapacity INT CHECK (SeatingCapacity > 0)
);

CREATE TABLE Mechanic (
    MechanicID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100)
);

-- ==========================================
-- LEVEL 1: First-Degree Dependents
-- ==========================================

CREATE TABLE Customer_Phone (
    CustomerID INT,
    PhoneNumber VARCHAR(20),
    PRIMARY KEY (CustomerID, PhoneNumber),
    CONSTRAINT fk_custphone_customer FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Individual (
    CustomerID INT PRIMARY KEY,
    LicenseNumber VARCHAR(50) UNIQUE NOT NULL,
    CONSTRAINT fk_individual_customer FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Corporate (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    TaxID VARCHAR(50) UNIQUE NOT NULL,
    CONSTRAINT fk_corporate_customer FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Address (
    BranchID INT PRIMARY KEY, -- 1:1 Relationship with Branch
    Street VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    CONSTRAINT fk_address_branch FOREIGN KEY (BranchID)
        REFERENCES Branch(BranchID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    BranchID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    CONSTRAINT fk_staff_branch FOREIGN KEY (BranchID)
        REFERENCES Branch(BranchID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- ==========================================
-- LEVEL 2: Second-Degree Dependents
-- ==========================================

CREATE TABLE Manager (
    StaffID INT PRIMARY KEY,
    OfficeNumber VARCHAR(20),
    BonusPlan VARCHAR(50),
    CONSTRAINT fk_manager_staff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE SalesAgent (
    StaffID INT PRIMARY KEY,
    CommissionRate DECIMAL(5, 2) CHECK (CommissionRate >= 0),
    CONSTRAINT fk_salesagent_staff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Car (
    CarID INT PRIMARY KEY,
    BranchID INT NOT NULL,
    VehicleTypeID INT NOT NULL,
    Model VARCHAR(100) NOT NULL,
    RegistrationNumber VARCHAR(50) UNIQUE NOT NULL,
    DailyRate DECIMAL(10, 2) CHECK (DailyRate > 0),
    Status VARCHAR(20) DEFAULT 'Available' CHECK (Status IN ('Available', 'Rented', 'Maintenance')),
    CONSTRAINT fk_car_branch FOREIGN KEY (BranchID)
        REFERENCES Branch(BranchID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT fk_car_vehicletype FOREIGN KEY (VehicleTypeID)
        REFERENCES Vehicle_Type(VehicleTypeID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- ==========================================
-- LEVEL 3 & 4: Operations & Transactions
-- ==========================================

CREATE TABLE Insurance_Policy (
    PolicyID INT PRIMARY KEY,
    CarID INT NOT NULL,
    Provider VARCHAR(100) NOT NULL,
    ExpiryDate DATE NOT NULL,
    CoverageAmount DECIMAL(15, 2),
    CONSTRAINT fk_insurance_car FOREIGN KEY (CarID)
        REFERENCES Car(CarID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Maintenance_Record (
    CarID INT,
    RecordID INT,
    ServiceDate DATE NOT NULL,
    Cost DECIMAL(10, 2) CHECK (Cost >= 0),
    Description VARCHAR(255),
    PRIMARY KEY (CarID, RecordID),
    CONSTRAINT fk_maintenance_car FOREIGN KEY (CarID)
        REFERENCES Car(CarID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Rental (
    RentalID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    StaffID INT NOT NULL,
    RentalDate DATE NOT NULL,
    ReturnDate DATE,
    TotalAmount DECIMAL(12, 2),
    Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active', 'Completed', 'Cancelled')),
    CONSTRAINT fk_rental_customer FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT fk_rental_staff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
        ON DELETE NO ACTION  -- NO ACTION prevents SSMS multiple cascade path error
        ON UPDATE NO ACTION
);

CREATE TABLE Rental_Car (
    RentalID INT,
    CarID INT,
    ReturnDate DATE,
    DamageFee DECIMAL(10, 2) DEFAULT 0 CHECK (DamageFee >= 0),
    PRIMARY KEY (RentalID, CarID),
    CONSTRAINT fk_rentalcar_rental FOREIGN KEY (RentalID)
        REFERENCES Rental(RentalID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT fk_rentalcar_car FOREIGN KEY (CarID)
        REFERENCES Car(CarID)
        ON DELETE NO ACTION -- NO ACTION prevents SSMS multiple cascade path error
        ON UPDATE NO ACTION
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    RentalID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR(50),
    CONSTRAINT fk_payment_rental FOREIGN KEY (RentalID)
        REFERENCES Rental(RentalID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE Rental_Transaction (
    TransactionID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    CustomerID INT NOT NULL,
    RentalID INT NOT NULL,
    TransactionDate DATE NOT NULL,
    CONSTRAINT fk_rentaltx_staff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
        ON DELETE NO ACTION -- NO ACTION prevents SSMS multiple cascade path error
        ON UPDATE NO ACTION,
    CONSTRAINT fk_rentaltx_customer FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT fk_rentaltx_rental FOREIGN KEY (RentalID)
        REFERENCES Rental(RentalID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);