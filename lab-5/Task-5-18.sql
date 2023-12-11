use cd;
-- Task-5-18:  Для каждого дня августа 2012 года рассчитайте скользящее среднее общего дохода за предыдущие 15 дней.
-- Вывод должен содержать столбцы даты и дохода, отсортированные по дате. Не забудьте учесть возможность того, что в день будет нулевой доход. 
-- Примечание: используйте DATE_ADD для генерации серии дат.
WITH RECURSIVE dates AS(
  SELECT '2012-08-01' AS Date
  UNION ALL
  SELECT DATE_ADD(DATE, INTERVAL 1 DAY) 
	FROM dates 
	WHERE DATE < '2012-08-31')
SELECT d.date, 
       SUM(CASE
			 WHEN m.surname like "guest" THEN f.guestcost
			 ELSE f.membercost
		   END * b.slots) / 15 AS DOXOD
  FROM dates d, bookings b, facilities f, members m
  WHERE b.starttime < DATE_ADD(d.date, INTERVAL 1 day)
    AND b.starttime >= DATE_ADD(d.date, INTERVAL -14 day)
    AND b.facid = f.facid
    AND b.memid = m.memid
  GROUP BY d.date
  order by 1


