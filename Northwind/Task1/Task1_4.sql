--																						Задание 1.4. Использование оператора LIKE

--В таблице Products найти все продукты (колонка ProductName), где встречается подстрока 'chocolade'. 
--Известно, что в подстроке 'chocolade' может быть изменена одна буква 'c' в середине - найти все продукты, которые удовлетворяют этому условию.

SELECT products.[ProductName] AS 'Product Name'
FROM [DBO].[Products] products
WHERE products.[ProductName] LIKE '%cho_olade%';