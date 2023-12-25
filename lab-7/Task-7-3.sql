use cd;
DELIMITER //

DROP PROCEDURE IF EXISTS F_GET_AREND //
-- Task-7-3. Напишите процедуру, которая считает окупаемость каждого объекта клуба на основании оплаты аренд за месяц. Применить ее к июлю 2012 года.  
CREATE PROCEDURE F_GET_AREND(vFacID INTEGER, vYear INTEGER, vMonth INTEGER) 
  READS SQL DATA
  NOT DETERMINISTIC
BEGIN
  SELECT IF (SUM(p.payment) - f.monthlymaintenance = 0, 10000000000000,
            f.initialoutlay / (SUM(p.payment) - f.monthlymaintenance)) AS income
    FROM payments AS p
    JOIN bookings AS b ON b.bookid = p.bookid
	JOIN facilities AS f ON b.facid = f.facid
	WHERE curfacid = b.facid AND MONTH(starttime) = m AND YEAR(starttime) = y
	GROUP BY b.facid;
END //

DELIMITER ;
