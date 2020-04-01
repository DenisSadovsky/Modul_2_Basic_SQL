--																						Задание 1.1. Простая фильтрация данных.

--Выбрать в таблице Orders заказы, которые были доставлены после 6 мая 1998 года (колонка ShippedDate) 
--включительно и которые доставлены с ShipVia >= 2. 
--Запрос должен возвращать только колонки OrderID, ShippedDate и ShipVia.


SELECT orders.[OrderID], orders.[ShippedDate], orders.[ShipVia] 
FROM [dbo].[Orders] orders
WHERE orders.[ShippedDate] >= Convert(DATETIME, '1998-05-06') AND orders.[ShipVia]>=2;


--Написать запрос, который выводит только недоставленные заказы из таблицы Orders. 
--В результатах запроса возвращать для колонки ShippedDate вместо значений NULL строку ‘Not Shipped’ (использовать системную функцию CASЕ). 
--Запрос должен возвращать только колонки OrderID и ShippedDate.

SELECT orders.[OrderID],
	CASE 
		WHEN orders.[ShippedDate] IS NULL 
			THEN 'Not shipped' END AS 'ShippedDate'
FROM [dbo].[Orders] orders
WHERE orders.[ShippedDate] IS NULL;



--Выбрать в таблице Orders заказы, которые были доставлены после 6 мая 1998 года (ShippedDate) не включая эту дату или которые еще не доставлены. 
--В запросе должны возвращаться только колонки OrderID (переименовать в Order Number) и ShippedDate (переименовать в Shipped Date).
--В результатах запроса возвращать для колонки ShippedDate вместо значений NULL строку ‘Not Shipped’, для остальных значений возвращать дату в формате по умолчанию.


SELECT orders.[OrderID] AS 'Order Number',
	CASE 
		WHEN orders.[ShippedDate] IS NULL 
			THEN 'Not shipped' 
			ELSE CONVERT(VARCHAR(30), Orders.[ShippedDate], 0) END AS 'Shipped Date' 
FROM [dbo].[Orders] orders
WHERE orders.[ShippedDate] > Convert(DATETIME, '1998-05-06') OR orders.[ShippedDate] IS NULL;