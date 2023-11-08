USE cd;
-- Task-3-2: Выберите теннисные корты, забронированные пользователями на 19 сентября 2012 года.
SELECT f.facility
  FROM facilities f
  WHERE f.facility LIKE '%Tennis Court%'
	AND f.facid IN (SELECT b.facid
                      FROM bookings b
                      WHERE DATE(b.starttime) = '2012-09-19');