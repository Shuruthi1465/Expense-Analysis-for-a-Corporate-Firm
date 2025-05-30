use expenses;
-- Employees Table
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    position VARCHAR(50),
    joining_date DATE
);

-- Expense Categories Table
CREATE TABLE Expense_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Expenses Table
CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    category_id INT,
    amount DECIMAL(10,2),
    expense_date DATE,
    description TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (category_id) REFERENCES Expense_Categories(category_id)
);

-- Vendors Table
CREATE TABLE Vendors (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    vendor_name VARCHAR(100),
    contact_info VARCHAR(255)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_id INT,
    payment_mode VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATE,
    FOREIGN KEY (expense_id) REFERENCES Expenses(expense_id)
);

-- Insert Employees
INSERT INTO Employees (name, department, position, joining_date) VALUES
('Alice Johnson', 'Finance', 'Accountant', '2019-04-12'),
('Bob Smith', 'IT', 'Software Engineer', '2021-07-22'),
('Charlie Davis', 'Marketing', 'Marketing Manager', '2018-11-05'),
('David Brown', 'HR', 'HR Manager', '2020-02-15'),
('Emma Wilson', 'Operations', 'Operations Manager', '2017-06-30'),
('Fiona Lewis', 'Finance', 'Financial Analyst', '2020-08-10'),
('George White', 'IT', 'Network Engineer', '2019-03-15'),
('Hannah Scott', 'Marketing', 'Content Strategist', '2021-10-05'),
('Isaac Taylor', 'HR', 'Recruitment Specialist', '2018-07-23'),
('Jack Martin', 'Operations', 'Supply Chain Manager', '2016-12-11');

-- Insert Expense Categories
INSERT INTO Expense_Categories (category_name) VALUES
('Office Supplies'),
('Travel'),
('Software Subscriptions'),
('Marketing & Advertising'),
('Employee Training'),
('Office Rent'),
('Equipment & Maintenance');

-- Insert Expenses
INSERT INTO Expenses (employee_id, category_id, amount, expense_date, description) VALUES
(1, 1, 250.00, '2024-02-10', 'Purchased office stationery'),
(2, 2, 1200.50, '2024-02-15', 'Business trip to New York'),
(3, 4, 5000.00, '2024-02-18', 'Google Ads Campaign'),
(4, 5, 800.00, '2024-02-20', 'HR Training Session'),
(5, 3, 300.00, '2024-02-22', 'Zoom Premium Subscription'),
(1, 1, 350.00, '2024-01-05', 'Printer Ink Purchase'),
(2, 2, 1500.75, '2024-01-10', 'Client Meeting Travel'),
(3, 4, 6000.00, '2024-01-12', 'Social Media Ad Campaign'),
(4, 5, 950.00, '2024-01-15', 'Online HR Training Program'),
(5, 3, 500.00, '2024-01-18', 'Slack Business Subscription'),
(6, 6, 10000.00, '2024-01-20', 'Monthly Office Rent Payment'),
(7, 7, 2200.00, '2024-01-22', 'Server Maintenance Fees'),
(8, 1, 180.00, '2024-02-01', 'Notebooks and Stationery'),
(9, 2, 2000.00, '2024-02-05', 'Flight Ticket for Conference'),
(10, 3, 750.00, '2024-02-07', 'Software License Renewal'),
(1, 5, 900.00, '2024-02-08', 'Employee Skill Development Workshop'),
(2, 6, 10500.00, '2024-02-10', 'Monthly Office Rent Payment'),
(3, 4, 7000.00, '2024-02-12', 'YouTube Video Ads'),
(4, 7, 3000.00, '2024-02-14', 'Laptop Repairs'),
(5, 1, 450.00, '2024-02-15', 'Office Supplies Restock'),
(6, 3, 250.00, '2024-02-18', 'Dropbox Subscription'),
(7, 2, 1750.00, '2024-02-20', 'Train Ticket for Business Visit'),
(8, 4, 4000.00, '2024-02-21', 'Email Marketing Campaign'),
(9, 7, 1200.00, '2024-02-23', 'Office Chair Repair'),
(10, 5, 600.00, '2024-02-25', 'HR Training Session'),
(1, 6, 11000.00, '2024-02-28', 'Office Rent'),
(2, 1, 250.00, '2024-03-02', 'Business Card Printing'),
(3, 2, 1900.00, '2024-03-04', 'Flight Ticket for Seminar'),
(4, 3, 850.00, '2024-03-06', 'Annual Zoom Subscription'),
(5, 5, 950.00, '2024-03-08', 'Employee Skill Upgrade Program'),
(6, 6, 10000.00, '2024-03-10', 'Monthly Office Rent Payment'),
(7, 7, 2750.00, '2024-03-12', 'Software Bug Fixing'),
(8, 4, 5500.00, '2024-03-14', 'SEO Advertising'),
(9, 1, 300.00, '2024-03-16', 'Printer Maintenance'),
(10, 2, 2250.00, '2024-03-18', 'Airfare for Client Meeting');


-- Insert Vendors
INSERT INTO Vendors (vendor_name, contact_info) VALUES
('Office Depot', 'office@depot.com'),
('Airline Services', 'travel@airline.com'),
('Google Ads', 'ads@google.com'),
('HR Training Co.', 'training@hrco.com'),
('Zoom Inc.', 'support@zoom.com'),
('Tech Solutions Inc.', 'support@techsolutions.com'),
('Airline Express', 'contact@airlineexpress.com'),
('Google Marketing', 'marketing@google.com'),
('HR Learning Hub', 'info@hrlearninghub.com'),
('Business Essentials Ltd.', 'sales@businessessentials.com'),
('Property Management Co.', 'leasing@propertyco.com');

-- Insert Payments
INSERT INTO Payments (expense_id, payment_mode, payment_status, payment_date) VALUES
(1, 'Credit Card', 'Paid', '2024-02-12'),
(2, 'Bank Transfer', 'Pending', NULL),
(3, 'Credit Card', 'Paid', '2024-02-19'),
(4, 'Bank Transfer', 'Paid', '2024-02-21'),
(5, 'Credit Card', 'Pending', NULL),
(1, 'Credit Card', 'Paid', '2024-01-06'),
(2, 'Bank Transfer', 'Paid', '2024-01-11'),
(3, 'Credit Card', 'Paid', '2024-01-13'),
(4, 'Bank Transfer', 'Pending', NULL),
(5, 'Credit Card', 'Paid', '2024-01-19'),
(6, 'Bank Transfer', 'Paid', '2024-01-21'),
(7, 'Credit Card', 'Pending', NULL),
(8, 'Cash', 'Paid', '2024-02-02'),
(9, 'Bank Transfer', 'Paid', '2024-02-06'),
(10, 'Credit Card', 'Paid', '2024-02-08'),
(11, 'Bank Transfer', 'Pending', NULL),
(12, 'Bank Transfer', 'Paid', '2024-02-11'),
(13, 'Credit Card', 'Paid', '2024-02-13'),
(14, 'Bank Transfer', 'Paid', '2024-02-15'),
(15, 'Credit Card', 'Paid', '2024-02-16'),
(16, 'Cash', 'Paid', '2024-02-19'),
(17, 'Bank Transfer', 'Pending', NULL),
(18, 'Credit Card', 'Paid', '2024-02-22'),
(19, 'Bank Transfer', 'Paid', '2024-02-24'),
(20, 'Cash', 'Pending', NULL),
(21, 'Bank Transfer', 'Paid', '2024-02-29'),
(22, 'Credit Card', 'Paid', '2024-03-03'),
(23, 'Bank Transfer', 'Pending', NULL),
(24, 'Credit Card', 'Paid', '2024-03-05'),
(25, 'Bank Transfer', 'Paid', '2024-03-07'),
(26, 'Credit Card', 'Paid', '2024-03-09'),
(27, 'Bank Transfer', 'Pending', NULL),
(28, 'Credit Card', 'Paid', '2024-03-13'),
(29, 'Bank Transfer', 'Paid', '2024-03-15'),
(30, 'Cash', 'Pending', NULL);