/* Домашнее задание № 4 
 работа с несколькими таблицами */

-- Задание № 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA


SELECT MARK, COLOR, COUNT(REGNUM)  as 'Count_Auto' 
  FROM AUTO
 GROUP BY COLOR, MARK
HAVING MARK = 'LADA' OR MARK = 'BMW'
 ORDER BY MARK;

-- Задание № 2. Вывести на экран марку авто и количество AUTO не этой марки


SELECT MARK,  COUNT(REGNUM)  as 'Count_Auto', 
		(SELECT COUNT(MARK)
		   FROM AUTO) - (COUNT(REGNUM))  AS other_auto 
 FROM AUTO
GROUP BY MARK;


/* Задание № 3. Даны 2 таблицы:
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.*/


SELECT a.*
  FROM test_a AS a
  LEFT JOIN test_b AS b
  ON a.id = b.id
  WHERE b.id IS NULL;

