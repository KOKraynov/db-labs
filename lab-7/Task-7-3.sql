use cd;
DELIMITER //

DROP FUNCTION IF EXISTS F_GET_AREND //
-- Task-7-3. Напишите процедуру, которая считает окупаемость каждого объекта клуба на основании оплаты аренд за месяц. Применить ее к июлю 2012 года.  
CREATE FUNCTION F_GET_AREND(vFID INTEGER, vY INTEGER, vM INTEGER) RETURNS FLOAT
  READS SQL DATA
NOT DETERMINISTIC
BEGIN
  DECLARE vAREND FLOAT;
  DECLARE vRENT FLOAT;
  -- Сумма аренд
  SELECT SUM(CASE
               WHEN m.surname like "guest" THEN f.guestcost
		       ELSE f.membercost
		     END * b.slots) INTO vAREND
  FROM members m, bookings b, facilities f
  WHERE b.memid = m.memid
	AND b.facid = f.facid
    AND f.facid = vFID
    AND YEAR(b.starttime) = vY
    AND MONTH(b.starttime) = vM;
  -- Плата за ренту
  SELECT f.monthlymaintenance INTO vRENT
    FROM facilities f
    WHERE f.facid = vFID;
  RETURN(vAREND - vRENT);
END //

DELIMITER ;
