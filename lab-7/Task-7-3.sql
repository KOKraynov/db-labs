use cd;
DELIMITER //

DROP FUNCTION IF EXISTS F_GET_AREND //
-- Task-7-3. Напишите процедуру, которая считает окупаемость каждого объекта клуба на основании оплаты аренд за месяц. Применить ее к июлю 2012 года.  
CREATE FUNCTION F_GET_AREND(vFacID INTEGER, vYear INTEGER, vMonth INTEGER) RETURNS FLOAT
  READS SQL DATA
NOT DETERMINISTIC
BEGIN
  DECLARE vAREND FLOAT;
  DECLARE vRENT FLOAT;
  -- Сумма аренд
  SELECT SUM(F_GET_AREND(b.bookid, b.facid, b.memid)) INTO vAREND
    FROM bookings b
    WHERE b.facid = vFacID
      AND YEAR(b.starttime) = vYear
      AND MONTH(b.starttime) = vMonth;
  -- Значение ренты
  SELECT f.monthlymaintenance INTO vRENT
    FROM facilities f
    WHERE f.facid = vFacID;
  RETURN(vAREND - vRENT);
END //

DELIMITER ;
