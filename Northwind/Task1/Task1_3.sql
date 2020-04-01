--																						Задание 1.3. Использование оператора BETWEEN, DISTINCT

--Выбрать все заказы (OrderID) из таблицы Order Details (заказы не должны повторяться),
--где встречаются продукты с количеством от 3 до 10 включительно – это колонка Quantity в таблице Order Details.
--Использовать оператор BETWEEN. Запрос должен возвращать только колонку OrderID.


SELECT DISTINCT 
				orderDetails.[OrderID] AS 'Order ID'
FROM [dbo].[Order Details] orderDetails
WHERE orderDetails.[Quantity] BETWEEN 3 AND 10;

--Выбрать всех заказчиков из таблицы Customers, у которых название страны начинается на буквы из диапазона b и g. 
--Использовать оператор BETWEEN. Проверить, что в результаты запроса попадает Germany. 
--Запрос должен возвращать только колонки CustomerID и Country и отсортирован по Country.

SELECT customers.[CustomerID] AS 'Customer ID',
	   customers.[Country]	AS 'Country'
FROM [DBO].Customers customers
WHERE SUBSTRING(customers.Country,1,1)  BETWEEN  'b' AND 'g'
ORDER BY customers.[Country];

--Выбрать всех заказчиков из таблицы Customers, у которых название страны начинается на буквы из диапазона b и g, не используя оператор BETWEEN.

SELECT customers.[CustomerID] AS 'Customer ID'
FROM [DBO].[Customers] customers
WHERE SUBSTRING(customers.[Country],1,1) >='b' AND  SUBSTRING(customers.[Country],1,1) <= 'g';