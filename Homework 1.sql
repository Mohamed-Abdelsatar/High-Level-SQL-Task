SELECT FirstName as Employee_FirstName , LastName as Employee_LastName , count ( orders.orderid ) as Number_of_Orders
FROM [Orders]
INNER JOIN [employees] on [Orders].employeeID = [employees].employeeID
group by [employees].employeeID
order by Number_of_Orders Desc;