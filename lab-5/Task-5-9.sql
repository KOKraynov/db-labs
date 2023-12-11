use cd;
-- Task-5-9:  Создайте список объектов с общим доходом менее 1000. Создайте выходную таблицу, 
-- состоящую из названия объекта и дохода, отсортированного по доходу. Помните, что для гостей и участников действуют разные цены!
SELECT facility, DOXOD
  FROM (SELECT f.facility, 
			   sum(CASE
					 WHEN surname like "guest" THEN f.guestcost
					 ELSE f.membercost
				   END * b.slots) AS DOXOD
		  FROM bookings b, facilities f, members m
		  WHERE b.facid = f.facid
			AND b.memid = m.memid
		  GROUP BY f.facility) AS FAC_DOXOD
  WHERE DOXOD < 10000
  ORDER BY 2;