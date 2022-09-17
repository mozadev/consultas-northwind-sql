SELECT C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate, O.ShipCountry,
O.EmployeeID FROM customers AS C LEFT JOIN orders AS O ON ( C.CustomerID = O.CustomerID) ;

SELECT C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate, O.ShipCountry,
O.EmployeeID FROM orders AS O RIGHT JOIN customers AS C ON (C.CustomerID = O.CustomerID);

SELECT C1.City, C1.CompanyName, C2.CompanyName, C3.CompanyName, C4.CompanyName, C5.CompanyName FROM customers AS C1, customers AS C2, customers AS C3, customers AS C4, customers AS C5 WHERE C1.City = C2.City AND C2.City = C3.City = C4.City = C5.City AND C1.CompanyName < C2.CompanyName AND C2.CompanyName < C3.CompanyName AND C3.CompanyName < C4.CompanyName AND C4.CompanyName < C5.CompanyName;

SELECT C.CompanyName,
SUM(UnitPrice*Quantity) AS SalesGross ,
SUM(UnitPrice*(1-Discount)*Quantity) AS SalesNet,
1 - SUM(UnitPrice*(1-Discount)*Quantity) / SUM(UnitPrice*Quantity) AS Discount
FROM orders AS O
INNER JOIN orderdetails AS D
ON (O.OrderID = D.OrderID)
INNER JOIN customers AS C
ON (O.CustomerID = C.CustomerID)
GROUP BY O.CustomerID HAVING Discount > 0.1 ORDER BY Discount DESC;

INSERT INTO orderdetails VALUES ( 10248, 34 , -5 , 678,0) ;