-- ==============================================================================
-- PART 2: DATA MANIPULATION LANGUAGE (DML) SCRIPT
-- RDBMS: Microsoft SQL Server (SSMS) / T-SQL
-- Rules Applied: Minimum 10 rows per table, Parent-first sequence, Realistic data
-- ==============================================================================

-- ==========================================
-- LEVEL 0: Foundation Tables
-- ==========================================

INSERT INTO Customer (CustomerID, Name, Email) VALUES
(1, 'Alice Smith', 'alice.smith@email.com'), (2, 'Bob Johnson', 'bjohnson@email.com'),
(3, 'Charlie Brown', 'cbrown@email.com'), (4, 'Diana Prince', 'dprince@email.com'),
(5, 'Evan Wright', 'ewright@email.com'), (6, 'Fiona Gallagher', 'fgallagher@email.com'),
(7, 'George Costanza', 'gcostanza@email.com'), (8, 'Hannah Abbott', 'habbott@email.com'),
(9, 'Ian Malcolm', 'imalcolm@email.com'), (10, 'Julia Roberts', 'jroberts@email.com'),
(11, 'Acme Corp', 'contact@acme.com'), (12, 'Globex Inc', 'billing@globex.com'),
(13, 'Initech', 'admin@initech.com'), (14, 'Umbrella Corp', 'fleet@umbrella.com'),
(15, 'Stark Industries', 'transport@stark.com'), (16, 'Wayne Enterprises', 'logistics@wayne.com'),
(17, 'Massive Dynamic', 'info@massivedynamic.com'), (18, 'Cyberdyne', 'accounts@cyberdyne.com'),
(19, 'Hooli', 'travel@hooli.com'), (20, 'Pied Piper', 'operations@piedpiper.com');

INSERT INTO Branch (BranchID, Name) VALUES
(1, 'Downtown Central'), (2, 'International Airport'), (3, 'Westside Suburbs'),
(4, 'Eastside Business Park'), (5, 'North Station'), (6, 'Southside Highway'),
(7, 'University Campus'), (8, 'Harbor District'), (9, 'Financial District'),
(10, 'Midtown Mall');

INSERT INTO Vehicle_Type (VehicleTypeID, TypeName, SeatingCapacity) VALUES
(1, 'Economy', 4), (2, 'Compact', 5), (3, 'Mid-Size', 5),
(4, 'Full-Size', 5), (5, 'Luxury Sedan', 5), (6, 'Compact SUV', 5),
(7, 'Full-Size SUV', 7), (8, 'Minivan', 7), (9, 'Pickup Truck', 4),
(10, 'Cargo Van', 2);

INSERT INTO Mechanic (MechanicID, Name, Specialization) VALUES
(1, 'Mike Torque', 'Engine Diagnostics'), (2, 'Sarah Tread', 'Tires & Alignment'),
(3, 'John Spark', 'Electrical Systems'), (4, 'Dave Brake', 'Braking Systems'),
(5, 'Lisa Shift', 'Transmission'), (6, 'Tom Body', 'Bodywork & Paint'),
(7, 'Rick Filter', 'Routine Maintenance'), (8, 'Ann Cool', 'AC Systems'),
(9, 'Paul Axle', 'Suspension'), (10, 'Tina Glass', 'Windshield & Glass');

-- ==========================================
-- LEVEL 1: First-Degree Dependents
-- ==========================================

INSERT INTO Individual (CustomerID, LicenseNumber) VALUES
(1, 'DL-1001-TX'), (2, 'DL-1002-NY'), (3, 'DL-1003-CA'), (4, 'DL-1004-FL'),
(5, 'DL-1005-WA'), (6, 'DL-1006-OR'), (7, 'DL-1007-NV'), (8, 'DL-1008-AZ'),
(9, 'DL-1009-UT'), (10, 'DL-1010-CO');

INSERT INTO Corporate (CustomerID, CompanyName, TaxID) VALUES
(11, 'Acme Corp', 'TAX-9001'), (12, 'Globex Inc', 'TAX-9002'),
(13, 'Initech', 'TAX-9003'), (14, 'Umbrella Corp', 'TAX-9004'),
(15, 'Stark Industries', 'TAX-9005'), (16, 'Wayne Enterprises', 'TAX-9006'),
(17, 'Massive Dynamic', 'TAX-9007'), (18, 'Cyberdyne', 'TAX-9008'),
(19, 'Hooli', 'TAX-9009'), (20, 'Pied Piper', 'TAX-9010');

INSERT INTO Customer_Phone (CustomerID, PhoneNumber) VALUES
(1, '555-0101'), (2, '555-0102'), (3, '555-0103'), (4, '555-0104'),
(5, '555-0105'), (11, '555-0201'), (12, '555-0202'), (13, '555-0203'),
(14, '555-0204'), (15, '555-0205');

INSERT INTO Address (BranchID, Street, City, State, ZipCode) VALUES
(1, '100 Main St', 'Metropolis', 'NY', '10001'), (2, '500 Airport Blvd', 'Metropolis', 'NY', '10002'),
(3, '250 West Ave', 'Gotham', 'NJ', '07001'), (4, '789 Tech Parkway', 'San Jose', 'CA', '95112'),
(5, '45 North Blvd', 'Chicago', 'IL', '60601'), (6, '99 South Rd', 'Houston', 'TX', '77001'),
(7, '101 College Way', 'Boston', 'MA', '02115'), (8, '88 Pier St', 'Seattle', 'WA', '98101'),
(9, '200 Wall St', 'Metropolis', 'NY', '10005'), (10, '300 Center Plaza', 'Denver', 'CO', '80202');

INSERT INTO Staff (StaffID, BranchID, Name, Salary) VALUES
(1, 1, 'Manager Mark', 85000.00), (2, 2, 'Manager Mary', 88000.00),
(3, 3, 'Manager Matt', 82000.00), (4, 4, 'Manager Megan', 90000.00),
(5, 5, 'Manager Miles', 80000.00), (6, 6, 'Manager Molly', 84000.00),
(7, 7, 'Manager Mason', 81000.00), (8, 8, 'Manager Mia', 86000.00),
(9, 9, 'Manager Max', 92000.00), (10, 10, 'Manager Maya', 83000.00),
(11, 1, 'Agent Andy', 45000.00), (12, 2, 'Agent Anna', 46000.00),
(13, 3, 'Agent Alex', 44000.00), (14, 4, 'Agent Amy', 47000.00),
(15, 5, 'Agent Aaron', 43000.00), (16, 6, 'Agent Alice', 45500.00),
(17, 7, 'Agent Adam', 44500.00), (18, 8, 'Agent Ava', 46500.00),
(19, 9, 'Agent Alan', 48000.00), (20, 10, 'Agent Aria', 45000.00);

-- ==========================================
-- LEVEL 2: Second-Degree Dependents
-- ==========================================

INSERT INTO Manager (StaffID, OfficeNumber, BonusPlan) VALUES
(1, 'M-101', 'Standard 10%'), (2, 'M-102', 'Premium 15%'), (3, 'M-103', 'Standard 10%'),
(4, 'M-104', 'Corporate 20%'), (5, 'M-105', 'Standard 10%'), (6, 'M-106', 'Standard 10%'),
(7, 'M-107', 'University 12%'), (8, 'M-108', 'Premium 15%'), (9, 'M-109', 'Corporate 20%'),
(10, 'M-110', 'Standard 10%');

INSERT INTO SalesAgent (StaffID, CommissionRate) VALUES
(11, 0.05), (12, 0.06), (13, 0.05), (14, 0.07), (15, 0.04),
(16, 0.05), (17, 0.05), (18, 0.06), (19, 0.08), (20, 0.05);

INSERT INTO Car (CarID, BranchID, VehicleTypeID, Model, RegistrationNumber, DailyRate, Status) VALUES
(1, 1, 1, 'Toyota Corolla', 'REG-1001', 35.00, 'Available'),
(2, 2, 5, 'Mercedes C-Class', 'REG-1002', 120.00, 'Rented'),
(3, 3, 6, 'Honda CR-V', 'REG-1003', 55.00, 'Available'),
(4, 4, 3, 'Nissan Altima', 'REG-1004', 45.00, 'Maintenance'),
(5, 5, 8, 'Dodge Grand Caravan', 'REG-1005', 70.00, 'Available'),
(6, 6, 9, 'Ford F-150', 'REG-1006', 85.00, 'Rented'),
(7, 7, 2, 'Hyundai Elantra', 'REG-1007', 40.00, 'Available'),
(8, 8, 7, 'Chevrolet Tahoe', 'REG-1008', 110.00, 'Available'),
(9, 9, 5, 'BMW 5 Series', 'REG-1009', 130.00, 'Rented'),
(10, 10, 4, 'Toyota Camry', 'REG-1010', 50.00, 'Available');

-- ==========================================
-- LEVEL 3 & 4: Operations & Transactions
-- ==========================================

INSERT INTO Insurance_Policy (PolicyID, CarID, Provider, ExpiryDate, CoverageAmount) VALUES
(1, 1, 'Geico', '2026-12-31', 50000.00), (2, 2, 'Progressive', '2026-11-30', 100000.00),
(3, 3, 'State Farm', '2027-01-15', 75000.00), (4, 4, 'Allstate', '2026-10-20', 50000.00),
(5, 5, 'Geico', '2026-12-31', 75000.00), (6, 6, 'Progressive', '2027-03-01', 80000.00),
(7, 7, 'State Farm', '2026-09-15', 50000.00), (8, 8, 'Allstate', '2027-05-10', 100000.00),
(9, 9, 'Geico', '2026-12-31', 150000.00), (10, 10, 'Progressive', '2027-02-28', 50000.00);

INSERT INTO Maintenance_Record (CarID, RecordID, ServiceDate, Cost, Description) VALUES
(1, 1, '2026-01-15', 50.00, 'Oil Change'), (2, 2, '2026-02-10', 120.00, 'Brake Pad Replacement'),
(3, 3, '2026-03-05', 400.00, 'New Tires'), (4, 4, '2026-05-25', 150.00, 'Battery Replacement'),
(5, 5, '2026-04-12', 60.00, 'Air Filter and Fluids'), (6, 6, '2026-01-20', 80.00, 'Alignment'),
(7, 7, '2026-02-28', 45.00, 'Oil Change'), (8, 8, '2026-03-15', 250.00, 'Detailing and Deep Clean'),
(9, 9, '2026-04-02', 300.00, 'Scheduled 30k Mile Service'), (10, 10, '2026-05-18', 55.00, 'Wiper Blades and Fluids');

-- Note: StaffIDs 11-20 are used here, representing the Sales Agents who process rentals
INSERT INTO Rental (RentalID, CustomerID, StaffID, RentalDate, ReturnDate, TotalAmount, Status) VALUES
(1, 1, 11, '2026-05-01', '2026-05-03', 70.00, 'Completed'),
(2, 12, 12, '2026-05-20', '2026-05-25', 600.00, 'Active'),
(3, 3, 13, '2026-04-10', '2026-04-12', 110.00, 'Completed'),
(4, 14, 14, '2026-05-22', NULL, 0.00, 'Active'),
(5, 5, 15, '2026-03-15', '2026-03-20', 350.00, 'Completed'),
(6, 16, 16, '2026-05-24', '2026-05-26', 170.00, 'Active'),
(7, 7, 17, '2026-02-01', '2026-02-05', 160.00, 'Completed'),
(8, 18, 18, '2026-04-20', '2026-04-25', 550.00, 'Completed'),
(9, 9, 19, '2026-05-25', '2026-05-28', 390.00, 'Active'),
(10, 20, 20, '2026-01-10', '2026-01-12', 100.00, 'Completed');

INSERT INTO Rental_Car (RentalID, CarID, ReturnDate, DamageFee) VALUES
(1, 1, '2026-05-03', 0.00), (2, 2, NULL, 0.00),
(3, 3, '2026-04-12', 0.00), (4, 4, NULL, 0.00),
(5, 5, '2026-03-20', 50.00), (6, 6, NULL, 0.00),
(7, 7, '2026-02-05', 0.00), (8, 8, '2026-04-25', 0.00),
(9, 9, NULL, 0.00), (10, 10, '2026-01-12', 0.00);

INSERT INTO Payment (PaymentID, RentalID, Amount, PaymentDate, PaymentMethod) VALUES
(1, 1, 70.00, '2026-05-01', 'Credit Card'), (2, 2, 300.00, '2026-05-20', 'Corporate Account'),
(3, 3, 110.00, '2026-04-10', 'Debit Card'), (4, 4, 100.00, '2026-05-22', 'Corporate Account'),
(5, 5, 400.00, '2026-03-20', 'Credit Card'), (6, 6, 170.00, '2026-05-24', 'Corporate Account'),
(7, 7, 160.00, '2026-02-01', 'Cash'), (8, 8, 550.00, '2026-04-20', 'Corporate Account'),
(9, 9, 390.00, '2026-05-25', 'Credit Card'), (10, 10, 100.00, '2026-01-10', 'Corporate Account');

INSERT INTO Rental_Transaction (TransactionID, StaffID, CustomerID, RentalID, TransactionDate) VALUES
(1, 11, 1, 1, '2026-05-01'), (2, 12, 12, 2, '2026-05-20'),
(3, 13, 3, 3, '2026-04-10'), (4, 14, 14, 4, '2026-05-22'),
(5, 15, 5, 5, '2026-03-15'), (6, 16, 16, 6, '2026-05-24'),
(7, 17, 7, 7, '2026-02-01'), (8, 18, 18, 8, '2026-04-20'),
(9, 19, 9, 9, '2026-05-25'), (10, 20, 20, 10, '2026-01-10');