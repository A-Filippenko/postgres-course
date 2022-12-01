--1. Выбрать все записи заказов в которых наименование страны отгрузки начинается с 'U'
--2. Выбрать записи заказов (включить колонки идентификатора заказа, идентификатора заказчика, веса и страны отгузки), которые должны быть отгружены в страны имя которых начинается с 'N', отсортировать по весу (по убыванию) и вывести только первые 10 записей.
--3. Выбрать записи работников (включить колонки имени, фамилии, телефона, региона) в которых регион неизвестен
--4. Подсчитать кол-во заказчиков регион которых известен
--5. Подсчитать кол-во поставщиков в каждой из стран и отсортировать результаты группировки по убыванию кол-ва
--6. Подсчитать суммарный вес заказов (в которых известен регион) по странам, затем отфильтровать по суммарному весу (вывести только те записи где суммарный вес больше 2750) и отсортировать по убыванию суммарного веса.
--7. Выбрать все уникальные страны заказчиков и поставщиков и отсортировать страны по возрастанию
--8. Выбрать такие страны в которых "зарегистированы" одновременно и заказчики и поставщики и работники.
--9. Выбрать такие страны в которых "зарегистированы" одновременно заказчики и поставщики, но при этом в них не "зарегистрированы" работники.

SELECT *
FROM orders
WHERE ship_country LIKE 'U%';

SELECT order_id, customer_id, freight, ship_country
FROM orders
WHERE ship_country LIKE 'N%'
ORDER BY freight DESC;
LIMIT 10

SELECT first_name, last_name, home_phone
FROM employees
WHERE region IS NULL

SELECT COUNT(*)
FROM customers
WHERE region IS NOT NULL

SELECT ship_country, COUNT(*)
FROM orders
WHERE freight > 50
GROUP BY ship_country
ORDER BY COUNT(*) DESC

SELECT category_id, SUM(units_in_stock)
FROM products
GROUP BY category_id
ORDER BY SUM(units_in_stock) DESC
LIMIT 5

SELECT ship_country, SUM(freight)
FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY SUM(freight) DESC

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country

SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM employees

SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers
EXCEPT
SELECT country
FROM employees
