use cd;
-- Task-6-3. Выберите процент использования объектов по месяцам, упорядочив по возрастанию
WITH  fsym as (SELECT DATE_FORMAT(b.starttime, '%y.%m') AS ym,
					  facility, SUM(b.slots) AS slot
				 FROM facilities f, bookings b
				 WHERE b.facid = f.facid
				 GROUP BY f.facid, DATE_FORMAT(b.starttime, '%y.%m'))
SELECT fsym.facility, ROUND(fsym.slot / sym.slot_all * 100, 1) us, sym.ym
  FROM  fsym,
       (SELECT fsym.ym, SUM(fsym.slot) AS slot_all
          FROM fsym
          GROUP BY ym) AS sym
  WHERE fsym.ym = sym.ym
  ORDER BY us ASC;