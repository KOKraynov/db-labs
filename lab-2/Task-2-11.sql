-- Task-2-11: Объедините имена членов и названия объектов в обдну таблицу с одним столбцом.
SELECT concat(m.surname, ' ', m.firstname) as "facilities And Members"
  FROM members m
UNION 
SELECT f.facility
  FROM facilities f;