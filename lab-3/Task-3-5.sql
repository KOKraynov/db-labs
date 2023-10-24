use cd;
-- Task-3-5: Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2.
select distinct concat(m.firstname, ' ', m.surname) as name
  from members m, bookings b
  where m.memid = b.memid
	and b.facid in (select f.facid
					  from facilities f
					  where f.facility like '%Court 1%'
						or f.facility like '%Court 2%')
  order by name

