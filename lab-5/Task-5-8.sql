use cd;
-- Task-5-8: Составьте список объектов вместе с их общим доходом. Выходная таблица должна состоять
-- из названия объекта и доходов, отсортированных по доходам. Помните, что для гостей и участников действуют разные цены!
SELECT f.facility, 
       sum(CASE
             WHEN surname like "guest" THEN f.guestcost
             ELSE f.membercost
		   END)
  FROM bookings b, facilities f, members m
  WHERE b.facid = f.facid
    AND b.memid = m.memid
  GROUP BY f.facility
  ORDER BY 2;