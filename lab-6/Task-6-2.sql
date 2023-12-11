use cd;
-- Task-6-2. Выберите количество аренд объектов клуба в каждый месяц.
SELECT YEAR(b.starttime), MONTH(b.starttime), 
       f.facility, COUNT(*)
  FROM bookings b, facilities f 
  WHERE b.facid = f.facid
  GROUP BY YEAR(starttime), MONTH(starttime), facility;