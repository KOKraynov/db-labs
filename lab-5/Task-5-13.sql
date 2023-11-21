use cd;
-- Task-5-13: Создайте монотонно увеличивающийся нумерованный список участников (включая гостей), 
-- упорядоченный по дате присоединения. Помните, что идентификаторы участников не обязательно
-- будут последовательными. Используйте функцию нумерации row_number.
SELECT ROW_NUMBER() OVER (ORDER BY m.joindate) row_num, 
       m.memid, m.surname, m.firstname
  FROM members m
  ORDER BY m.joindate;