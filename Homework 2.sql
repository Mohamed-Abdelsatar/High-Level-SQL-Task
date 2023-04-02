SELECT Employee_FirstName, Employee_LastName, SUM(Quantity) Total_Quantity
FROM (
SELECT employees.FirstName AS Employee_FirstName, employees.lastname AS Employee_LastName, orders.orderID, orderdetails.Quantity
FROM [Orders]
INNER JOIN [employees] ON [Orders].employeeID = [employees].employeeID
INNER JOIN [orderdetails] ON [Orders].orderID = [orderdetails].orderID
INNER JOIN [products] on [products].productID = [orderdetails].ProductID
INNER JOIN [categories] on [categories].categoryID = [products].categoryID
WHERE [categories].CategoryName = 'Beverages'
)
GROUP BY Employee_FirstName, Employee_LastName
ORDER BY Total_quantity desc