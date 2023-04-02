SELECT CustomerName, round(SUM(Total_Price),2) as Total_Sales
from (
SELECT [Customers].CustomerName,
[ORDERS].OrderID, 
[OrderDetails].ProductID,
[OrderDetails].Quantity * [Products].Price AS Total_Price
FROM [Customers]
INNER JOIN [ORDERS] ON [Customers].CustomerID = [ORDERS].CustomerID
INNER JOIN [OrderDetails] ON [ORDERS].OrderID = [OrderDetails].OrderID
INNER JOIN [Products] ON [OrderDetails].ProductID = [Products].ProductID
)
group by CustomerName
order by Total_Sales desc
limit 10