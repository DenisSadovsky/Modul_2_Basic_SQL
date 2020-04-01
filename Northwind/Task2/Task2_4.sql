--																						Задание 2.4. Использование подзапросов

--Выдать всех поставщиков (колонка CompanyName в таблице Suppliers), у которых нет хотя бы одного продукта на складе (UnitsInStock в таблице Products равно 0). 
--Использовать вложенный SELECT для этого запроса с использованием оператора IN.

SELECT suppliers.[CompanyName] 
FROM [dbo].[Suppliers] suppliers
WHERE suppliers.SupplierID in (SELECT products.UnitsInStock FROM [dbo].[Products] products WHERE suppliers.SupplierID = products.SupplierID);

--Выдать всех продавцов, которые имеют более 150 заказов. Использовать вложенный SELECT.

SELECT concat(employees.[FirstName],' ',employees.LastName) AS 'Seller' 
FROM [dbo].[Employees] employees
WHERE (SELECT count(orders.OrderID) FROM [dbo].Orders orders WHERE employees.EmployeeID = Orders.EmployeeID) > 150;

--Выдать всех заказчиков (таблица Customers), которые не имеют ни одного заказа (подзапрос по таблице Orders). Использовать оператор EXISTS.

SELECT customers.ContactName AS 'Customer'
FROM [dbo].[Customers] customers
WHERE NOT EXISTS (SELECT orders.OrderID FROM [dbo].Orders orders WHERE customers.CustomerID = Orders.CustomerID);