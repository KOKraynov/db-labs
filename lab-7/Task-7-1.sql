use cd;
DELIMITER //

DROP FUNCTION IF EXISTS F_GET_AREND //
-- Task-7-1. Создайте функцию, которая рассчитывает стоимость каждой аренды (для каждой записи таблицы bookings).  
CREATE FUNCTION F_GET_AREND(vBookID INTEGER, vFacID INTEGER, vMemID INTEGER, vSlots INTEGER) RETURNS FLOAT
  READS SQL DATA
NOT DETERMINISTIC
BEGIN
  DECLARE vAREND FLOAT;
  IF (vMemID IS NULL) OR (vFacID IS NULL) THEN
    SELECT CASE
	  	     WHEN m.surname like "guest" THEN f.guestcost
		     ELSE f.membercost
		   END * b.slots INTO vAREND
      FROM members m, bookings b, facilities f
      WHERE b.bookid = vBookID
        AND b.memid = m.memid
	    AND b.facid = f.facid;
  ELSE
    SELECT IF(vMemID = 0, guestcost, membercost) * vSlots
      INTO vAREND
	  FROM facilities f
	  WHERE f.facid = vFacID;
  END IF;
  RETURN(vAREND);
END //

DELIMITER ;

SELECT B.*, F_GET_AREND(B.BOOKID, NULL, NULL, NULL) FROM BOOKINGS B LIMIT 1;
SELECT B.*, F_GET_AREND(NULL, b.facid, b.memid, b.slots) FROM BOOKINGS B LIMIT 1;
