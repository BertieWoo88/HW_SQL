/* Домашнее задание №5 */

/* 5.1 Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000; */

CREATE OR REPLACE VIEW product_name AS
SELECT *
FROM cars
WHERE cost<25000;


/* 5.2 Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) */

ALTER VIEW product_name AS
SELECT *
FROM cars
WHERE cost<30000;


/* 5.3 Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” */

CREATE OR REPLACE VIEW skoda_audi AS
SELECT *
FROM cars
WHERE cars.name ='Skoda' or cars.name ='Audi' ;


/* 5.4 Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. */

SELECT O.*, A.an_name, A.an_price
FROM Analysis AS A
JOIN Orders AS O
ON A.an_id = O.ord_an
WHERE O.ord_datetime BETWEEN '2020-02-05 00:00:00' AND '2020-02-12 23:59:59';


/* 5.5 Добавьте новый столбец под названием «время до следующей станции». */

SELECT *,
timediff(LEAD (station_time, 1) OVER w_num_train , station_time ) as 'Time_to_next_station'
FROM trains_path
WINDOW w_num_train AS (PARTITION BY train_id ORDER BY station_time);


