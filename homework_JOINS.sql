--1. Найти заказчиков и обслуживающих их заказы сотрудников таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.
--2. Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц. Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.
--3. Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.
--4. Переписать предыдущий запрос, использовав симметричный вид джойна (подсказка: речь о LEFT и RIGHT).

SELECT customers.company_name, first_name, last_name
FROM orders
JOIN employees ON orders.employee_id = employees.employee_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN shippers ON orders.ship_via = shippers.shipper_id
WHERE employees.city = 'London' AND customers.city = 'London' AND shippers.company_name = 'Speedy Express'

SELECT product_name, SUM(units_in_stock), contact_name, phone
FROM products
JOIN categories ON products.category_id = categories.category_id
JOIN suppliers ON products.supplier_id = suppliers.supplier_id
WHERE category_name IN ('Beverages', 'Seafood') AND units_in_stock < 20
GROUP BY product_name, contact_name, phone

SELECT company_name, order_id
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL

SELECT company_name, order_id
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL
