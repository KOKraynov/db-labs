/*Напишите функцию, которая будет рассчитывать увеличение/уменьшение стоимость аренды объекта 
на последующие месяцы  для изменения ( увеличения или уменьшения) срока окупаемость на заданную долю 
(в процентах) на основании расчета окупаемости за уже оплаченные периоды. Сохраните расчет в виде csv 
или sql файла (например, используя временные таблицы).*/
USE cd;

DELIMITER //

DROP FUNCTION IF EXISTS Calc_Rent_Change // 
CREATE FUNCTION Calc_Rent_Change(in_percentage_change DECIMAL(5,2))
RETURNS TEXT
DETERMINISTIC
BEGIN
  -- Создание временной таблицы для расчета
  CREATE TEMPORARY TABLE IF NOT EXISTS RentChange AS
  SELECT b.facid,
         SUM(CASE 
               WHEN b.memid = 0 THEN f.guestcost * b.slots
               ELSE f.membercost * b.slots
             END) AS rent,
         SUM(p.payment) - f.monthlymaintenance AS profit
    FROM bookings b
    LEFT JOIN facilities f ON b.facid = f.facid
    LEFT JOIN payments p ON b.bookid = p.bookid
    GROUP BY b.facid;

  -- Расчет изменения стоимости аренды
  UPDATE RentChange 
	SET rent = CASE 
                 WHEN (profit <= 0 OR rent <= 0) THEN 0
                 ELSE rent * (1 + in_percentage_change / 100)
               END;
  -- Возвращение сообщения об успешном завершении
  RETURN 'Изменения аренды рассчитаны и сохранены в sql файл';
END//

DELIMITER ;
SELECT Calc_Rent_Change(10.54);
SELECT * FROM RentChange;