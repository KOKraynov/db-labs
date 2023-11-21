use cd;
-- Task-5-12: Составьте список имен и идентификаторов каждого участника, а также
-- их первого бронирования после 1 сентября 2012 г. Упорядочите по идентификатору участника.
SELECT m.memid, m.surname, m.firstname, fs.first_start
  FROM members m
  left join (SELECT b.memid, min(starttime) as first_start
			   FROM bookings b
		 	   WHERE b.starttime >= "2012-09-01"
			   GROUP BY b.memid) AS fs 
    on m.memid = FS.memid
  ORDER BY m.memid;