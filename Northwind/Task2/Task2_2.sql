--																						Задание 2.2. Соединение таблиц, использование агрегатных функций и предложений GROUP BY и HAVING


--По таблице Orders найти количество заказов с группировкой по годам. 
--В результатах запроса надо возвращать две колонки c названиями Year и Total. 
--Написать проверочный запрос, который вычисляет количество всех заказов.

SELECT YEAR(orders.[OrderDate]) AS 'Year',
		COUNT(orders.OrderID) AS 'Total'
FROM [DBO].[Orders] orders
GROUP BY orders.OrderDate;

SELECT COUNT(orders.OrderID) AS 'Total'
FROM [DBO].[Orders] orders;


--По таблице Orders найти количество заказов, cделанных каждым продавцом. 
--Заказ для указанного продавца – это любая запись в таблице Orders, где в колонке EmployeeID задано значение для данного продавца. 
--В результатах запроса надо возвращать колонку с именем продавца (Должно высвечиваться имя полученное конкатенацией LastName & FirstName. 
--Эта строка LastName & FirstName должна быть получена отдельным запросом в колонке основного запроса. 
--Также основной запрос должен использовать группировку по EmployeeID.) с названием колонки ‘Seller’ и колонку c количеством заказов возвращать с названием 'Amount'. 
--Результаты запроса должны быть упорядочены по убыванию количества заказов.

SELECT (select CONCAT(employees.LastName, ' & ' , employees.FirstName) FROM [DBO].[Employees] employees 
		WHERE employees.[EmployeeID] = orders.EmployeeID) AS 'Seller',
		COUNT(orders.[OrderID]) AS 'Amount'
FROM [dbo].[Orders] orders
GROUP BY orders.EmployeeID
ORDER BY 'Amount' DESC;


--По таблице Orders найти количество заказов, сделанных каждым продавцом и для каждого покупателя. 
--Необходимо определить это только для заказов, сделанных в 1998 году.

SELECT orders.[EmployeeID] AS 'Employee',
	   orders.[CustomerID] AS 'Customer', 
	   COUNT(orders.OrderID) AS 'Count Orders'
FROM [dbo].[Orders] orders 
WHERE YEAR(orders.[OrderDate]) = 1998
GROUP BY orders.[EmployeeID], orders.[CustomerID];


--Найти покупателей и продавцов, которые живут в одном городе. 
--Если в городе живут только один или несколько продавцов, или только один или несколько покупателей, то информация о таких покупателя и продавцах не должна попадать в результирующий набор. 
--Не использовать конструкцию JOIN.

SELECT customers.[CustomerID] AS 'Customers ID',
	   employees.[EmployeeID] AS 'Employeers ID',
	   customers.[City] AS 'City'
FROM [dbo].Customers customers
CROSS APPLY (select employees.[EmployeeID] FROM [dbo].[Employees] employees 
		WHERE employees.[City] = customers.[City]) employees;

--Найти всех покупателей, которые живут в одном городе.

SELECT 
    CustomersL.[CustomerID]     AS 'Customer ID'
    ,CustomersR.[CustomerID]    AS 'Neighbor id'
    ,CustomersL.[City]          AS 'City'
FROM [dbo].[Customers] customersL
    LEFT JOIN [dbo].[Customers] customersR 
        ON customersL.[CustomerID] <> customersR.[CustomerID] AND customersL.[City] = customersR.[City]
ORDER BY customersL.[City];


--По таблице Employees найти для каждого продавца его руководителя.

SELECT employees.EmployeeID AS 'Employee ID',
	   concat(employees.FirstName, ' ' , employees.LastName) AS 'Seller',
	   (select concat(employeeManager.FirstName, ' ' , employeeManager.LastName)
		FROM [dbo].[Employees] employeeManager
		WHERE employeeManager.EmployeeID = employees.ReportsTo) AS 'Manager'
FROM [dbo].[Employees] employees;