USE cd;

START TRANSACTION;
  SET @k = 5; -- Процент на который ускоряем
  CALL Calc_Rent_Change(@k);
  UPDATE facilities
    SET guestcost = guestcost * (SELECT r.new_rent_coef 
									FROM RentChange r
                                    where r.facid = f.facid),
        membercost = membercost * (SELECT r.new_rent_coef 
									FROM RentChange r
                                    where r.facid = f.facid);
-- Обнулим платежи
  UPDATE bookings
    SET payed = 0
    WHERE DATE(starttime) < '2012-09-01' AND DATE(starttime) >= '2012-08-01';
-- Зачтем платежи с новой ценой
  UPDATE bookings
    SET payed = 1
    WHERE DATE(starttime) < '2012-09-01' AND DATE(starttime) >= '2012-08-01';
  CALL Calc_Rent_Change(@k);
ROLLBACK;