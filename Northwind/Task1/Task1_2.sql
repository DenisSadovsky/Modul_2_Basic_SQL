--																						Задание 1.2. Использование операторов IN, DISTINCT, ORDER BY, NOT

--Выбрать из таблицы Customers всех заказчиков, проживающих в USA и Canada. Запрос сделать с только помощью оператора IN. 
--Возвращать колонки с именем пользователя и названием страны в результатах запроса. 
--Упорядочить результаты запроса по имени заказчиков и по месту проживания.

SELECT customers.[ContactName] AS 'Contact Name',
	   customers.[Country] AS 'Country' 
FROM [DBO].[Customers] customers
WHERE customers.[Country] IN ('USA','Canada')
ORDER BY customers.[ContactName], customers.[Address];


--Выбрать из таблицы Customers всех заказчиков, не проживающих в USA и Canada. Запрос сделать с помощью оператора IN. 
--Возвращать колонки с именем пользователя и названием страны в результатах запроса.
--Упорядочить результаты запроса по имени заказчиков.

SELECT customers.[ContactName] AS 'Contact Name',
	   customers.[Country] AS 'Country' 
FROM [DBO].[Customers] customers
WHERE customers.[Country] NOT IN ('USA','Canada')
ORDER BY customers.[ContactName];


--Выбрать из таблицы Customers все страны, в которых проживают заказчики. 
--Страна должна быть упомянута только один раз и список отсортирован по убыванию. Не использовать предложение GROUP BY.
--Возвращать только одну колонку в результатах запроса.

SELECT DISTINCT 
				customers.[Country] AS 'Country' 
FROM [DBO].[Customers] customers
ORDER BY customers.[Country] DESC;