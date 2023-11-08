use cd;
-- Task-4-9:  выведите членов клуба, которые не арендовали объекты клуба; удалите всех членов клуба, 
-- которые не арендовали объекты клуба. Проверьте есть ли в клубе член с mimid = 37
SELECT surname, firstname 
  FROM members m
  WHERE not exists (select 1 FROM bookings b
                      where b.memid = m.memid);
DELETE FROM members 
 WHERE memid in (SELECT memid FROM members m
				   WHERE not exists (select 1 FROM bookings b
									   where b.memid = m.memid));
SELECT 1 FROM members
  WHERE memid = 37; 
   
