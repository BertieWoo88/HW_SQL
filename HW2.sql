/* Домашнее задание № 2 
2.1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными */

CREATE TABLE IF NOT EXISTS sales
( id int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE COMMENT "Дата заказа",
company_id VARCHAR(30) COMMENT "ID комании покупателя",
company_name VARCHAR(30) COMMENT "название комании покупателя",
product_id INT not NULL COMMENT "номер артикула товара",
quantity INT not NULL COMMENT "Количество товара",
UOM VARCHAR(10) NOT NULL COMMENT "Единица измерения"
); 

SELECT * FROM sales;

INSERT sales (order_date, company_id, company_name, product_id, quantity, UOM)
VALUES 
  ('2022-10-05', "123456", "ООО РОМАШКА", 700013567, 450, "Бочка"),
  ('2022-12-25', "345678", "АО Рога и Копыта", 700013223, 50, "шт"),
  ('2022-12-31', "223455", "ООО Тюльпан", 700013567, 250, "Бочка"),
  ('2023-01-25', "123456", "ООО РОМАШКА", 700013567, 70, "Бочка"),
  ('2023-02-12', "222333", "ООО ЗВЕЗДА-11", 700013567, 125, "Бочка"),
  ('2023-03-05', "323255", "ООО ДОМ-22", 700013671, 28, "Канистра"),
  ('2023-04-06', "123456", "ООО РОМАШКА", 700013567, 50, "Бочка"); 
  
  
  -- 2.2 Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
  SELECT id, order_date, company_name, product_id, UOM,  -- 
CASE
	WHEN quantity < 100 THEN "Маленький заказ"
    WHEN quantity BETWEEN 100 AND 300 THEN "Средний заказ"
    ELSE "Большой заказ"
END AS result
FROM sales;


  -- 2.3 Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE.
  CREATE TABLE IF NOT EXISTS orders
  (id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(5) NOT NULL,
  amount DECIMAL(8,2) NOT NULL,
  order_status VARCHAR(9) NOT NULL
  );
  
  SELECT * FROM orders;
  
  INSERT orders (employee_id, amount, order_status)
  VALUES 
  ('A123', 256.34, "CANCELLED"),
  ('A5654', 1656.22, "OPEN"),
  ('E1223', 2500.90, "OPEN"),
  ('A3412', 3000.00, "CLOSED"),
  ('A4568', 12974.12, "OPEN"),
  ('A8801', 199.22, "CLOSED");
  
  
    SELECT id, employee_id, amount,  
CASE
	WHEN order_status = "OPEN" THEN "Открытый заказ"
    WHEN order_status = "CLOSED" THEN "Закрытый заказ"
    WHEN order_status = "CANCELLED" THEN "Отмененный заказ"
    ELSE "Ошибка статуса"
END AS result
FROM orders;


  /* 2.4 Чем 0 отличается от NULL?.
  0 это числовое значение равное нулю, а NULL это пустое значение, тоесть отсутствие данных по конкретному полю (значение неизвестно)
  */