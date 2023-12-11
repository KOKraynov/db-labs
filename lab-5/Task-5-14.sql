use cd;
-- Task-5-14: Выведите идентификатор объекта, в котором забронировано наибольшее количество мест (slot).
-- Убедитесь, что в случае ничьей все результаты привязки будут выведены.
SELECT FACID, SM 
  FROM (SELECT facid, SM, 
               RANK() OVER (ORDER BY SM DESC) AS RK
		  FROM (SELECT b.facid, sum(b.slots) as sm
				  FROM bookings b 
				  group by b.facid) as qwe) AS ERT
  WHERE RK = 1;