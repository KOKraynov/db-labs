use cd;
DELIMITER //

DROP FUNCTION IF EXISTS F_GET_AREND //
-- Task-7-1. Создайте функцию, которая рассчитывает стоимость каждой аренды (для каждой записи таблицы bookings).  
CREATE FUNCTION F_GET_AREND(vID INTEGER) RETURNS FLOAT
  READS SQL DATA
NOT DETERMINISTIC
BEGIN
  DECLARE vAREND FLOAT;
  SELECT CASE
		   WHEN m.surname like "guest" THEN f.guestcost
		   ELSE f.membercost
		 END * b.slots INTO vAREND
  FROM members m, bookings b, facilities f
  WHERE b.bookid = vID
    AND b.memid = m.memid
	AND b.facid = f.facid;
  RETURN(vAREND);
END //

DELIMITER ;

SELECT B.*, F_GET_AREND(B.BOOKID) FROM BOOKINGS B LIMIT 1
