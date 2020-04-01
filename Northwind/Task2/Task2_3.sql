--																						Задание 2.3. Использование JOIN

--Определить продавцов, которые обслуживают регион 'Western' (таблица Region).

SELECT DISTINCT concat(employees.FirstName,' ', employees.LastName) AS 'Seller'
FROM [dbo].[Employees] employees
JOIN [dbo].[EmployeeTerritories] employessT on employessT.EmployeeID = employees.EmployeeID
JOIN [dbo].[Territories] territories on territories.TerritoryID = employessT.TerritoryID
JOIN [dbo].[Region] region on region.RegionID = territories.RegionID
WHERE region.RegionDescription = 'Western';


--Выдать в результатах запроса имена всех заказчиков из таблицы Customers и суммарное количество их заказов из таблицы Orders. 
--Принять во внимание, что у некоторых заказчиков нет заказов, но они также должны быть выведены в результатах запроса. 
--Упорядочить результаты запроса по возрастанию количества заказов.


SELECT customers.[ContactName] AS 'Customer ID',
	   COUNT(orders.[OrderID]) AS 'COUNT Orders'
FROM [dbo].[Customers] customers
LEFT JOIN [dbo].[Orders] orders on orders.[CustomerID] = customers.[CustomerID]
GROUP BY customers.[ContactName]
ORDER BY COUNT(orders.[OrderID]);
