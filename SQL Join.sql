/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name as Product, c.Name as Catagory 
 FROM products as p JOIN categories as c 
 ON c.CategoryID = p.CategoryID 
 WHERE c.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name as Product, p.Price, r.Rating
 FROM products as p JOIN reviews as r
 ON p.ProductID = r.ProductID
 WHERE r.Rating = 5
 ORDER BY p.Name;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName as 'First Name', e.MiddleInitial as 'Middle Initial', e.LastName as 'Last Name', SUM(s.Quantity) as 'Units Sold'
FROM employees AS e JOIN sales as s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as Department, c.Name Category
FROM departments as d JOIN categories as c
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) as 'Total Sold', SUM(s.Quantity * s.PricePerUnit) as 'Total Price Sold'
FROM sales as s JOIN products as p
ON s.ProductID = p.ProductID
Where p.Name = "Eagles: Hotel California";





/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products as p JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE p.Name ='Visio TV'
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, CONCAT (e.FirstNAme, ' ', e.LastName) AS 'Full Name', SUM(s.Quantity) AS 'sales', p.Name AS 'Product'
FROM employees as e JOIN sales as s
ON e.EmployeeID = s.EmployeeID
JOIN products as p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY sales DESC;


