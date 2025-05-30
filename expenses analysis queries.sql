  # Total Expenses Per Month
SELECT DATE_FORMAT(expense_date, '%Y-%m') AS month, SUM(amount) AS total_expense FROM Expenses
GROUP BY month ORDER BY month;

# Department-Wise Expense Breakdown
SELECT e.department, SUM(ex.amount) AS total_expense FROM Expenses ex
JOIN Employees e ON ex.employee_id = e.employee_id
GROUP BY e.department ORDER BY total_expense DESC;

#Top 5 Expense Categories
SELECT c.category_name, SUM(e.amount) AS total_spent FROM Expenses e
JOIN Expense_Categories c ON e.category_id = c.category_id
GROUP BY c.category_name ORDER BY total_spent DESC LIMIT 5;

#Pending Payments
SELECT p.payment_id, e.description, p.payment_mode, p.payment_status, p.payment_date FROM Payments p
JOIN Expenses e ON p.expense_id = e.expense_id WHERE p.payment_status = 'Pending';

#Employee with the Highest Expense
SELECT emp.name,SUM(ex.amount) AS total_expense FROM Expenses ex
JOIN Employees emp ON ex.employee_id = emp.employee_id GROUP BY emp.name
ORDER BY total_expense DESC LIMIT 1;

delimiter //
create procedure month_expenses(IN var int)
begin
SELECT DATE_FORMAT(expense_date, '%m') AS month,SUM(amount) AS total_expense FROM Expenses
GROUP BY month ORDER BY month;
end ; //

call month_expenses(3)

#1. View: Total Expenses by Department
CREATE VIEW Department_Expense_Summary AS
SELECT emp.department, SUM(exp.amount) AS total_expense FROM Expenses exp
JOIN Employees emp ON exp.employee_id = emp.employee_id GROUP BY emp.department;

SELECT * FROM Department_Expense_Summary;

#2. View: Employee Expense Details
CREATE VIEW Employee_Expense_Details AS
SELECT emp.name AS employee_name, emp.department, cat.category_name, exp.amount, exp.expense_date, exp.description FROM Expenses exp
JOIN Employees emp ON exp.employee_id = emp.employee_id
JOIN Expense_Categories cat ON exp.category_id = cat.category_id;

SELECT * FROM Employee_Expense_Details ORDER BY amount DESC;

#3. View: Pending Payments
CREATE VIEW Pending_Payments AS
SELECT exp.expense_id, emp.name AS employee_name, exp.amount, pay.payment_mode, pay.payment_status FROM Payments pay
JOIN Expenses exp ON pay.expense_id = exp.expense_id
JOIN Employees emp ON exp.employee_id = emp.employee_id WHERE pay.payment_status = 'Pending';

SELECT * FROM Pending_Payments;

#4. View: Monthly Expense Summary
CREATE VIEW Monthly_Expense_Summary AS
SELECT DATE_FORMAT(exp.expense_date, '%Y-%m') AS month, SUM(exp.amount) AS total_expense
FROM Expenses exp GROUP BY month;

SELECT * FROM Monthly_Expense_Summary ORDER BY month DESC;

#5. View: Vendor Expense Summary
CREATE VIEW Vendor_Expense_Summary AS
SELECT v.vendor_name, SUM(exp.amount) AS total_spent FROM Expenses exp
JOIN Vendors v ON exp.category_id = v.vendor_id GROUP BY v.vendor_name;

SELECT * FROM Vendor_Expense_Summary ORDER BY total_spent DESC;


