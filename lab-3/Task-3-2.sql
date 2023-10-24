use cd;
-- Task-3-2: Выберите теннисные корты, забронированные пользователями на 19 сентября 2012 года.
select f.facility
  from facilities f
  where f.facility like 'Tennis%'
	and f.facid in (select b.facid
                      from bookings b
                      where date(b.starttime) = '2012-09-19');