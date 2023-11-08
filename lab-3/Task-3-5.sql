use cd;
-- Task-3-5: Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2.
select distinct concat(m.firstname, ' ', m.surname) as name, 
       f.facility
  from members m, bookings b, facilities f
  where m.memid = b.memid
	and b.facid = f.facid
	and f.facility like '%Court%'
	and (f.facility like '% 1' 
        or f.facility like '% 2')
  order by name

