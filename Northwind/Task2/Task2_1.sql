--																						Задание 2.1. Использование агрегатных функций (SUM, COUNT)

--Найти общую сумму всех заказов из таблицы Order Details с учетом количества закупленных товаров и скидок по ним. 
--Результатом запроса должна быть одна запись с одной колонкой с названием колонки 'Totals'.

SELECT SUM(orderDetails.[Quantity] * orderDetails.[UnitPrice] * (1-orderDetails.[Discount])) AS 'Totals'
FROM [DBO].[Order Details] orderDetails;

--По таблице Orders найти количество заказов, которые еще не были доставлены (т.е. в колонке ShippedDate нет значения даты доставки). 
--Использовать при этом запросе только оператор COUNT. Не использовать предложения WHERE и GROUP.

SELECT COUNT(*) - COUNT(orders.[ShippedDate]) AS 'Shipped Date'
FROM [DBO].[Orders] orders; 

--По таблице Orders найти количество различных покупателей (CustomerID), сделавших заказы. 
--Использовать функцию COUNT и не использовать предложения WHERE и GROUP

SELECT COUNT(DISTINCT orders.[CustomerID]) AS 'Customer ID'
FROM [DBO].Orders orders;