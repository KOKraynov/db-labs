use cd;
-- Task-3-7: Выберите список всех членов, включая человека, который их рекомендовал (если таковой имеется), без 
-- использования каких-либо объединений. Исключите в списке дубликаты, упорядочите лист по ФИО (==   имя + фамилия).
SELECT DISTINCT concat(m.firstname, ' ', m.surname) AS "name",
       (select concat(r.firstname, ' ', r.surname)
          FROM members r 
          WHERE m.recommendedby = r.memid
       ) AS recommended
  FROM members m
  ORDER BY NAME;