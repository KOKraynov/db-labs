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
         1 AS new_rent_coef,
         SUM(p.payment) AS income,
         ceil(DATEDIFF(sysdate(), MIN(b.starttime))*12/365)  as count_month,
         f.initialoutlay, f.monthlymaintenance,
         0 AS month_before_profit
    FROM bookings b
    LEFT JOIN facilities f ON b.facid = f.facid
    LEFT JOIN payments p ON b.bookid = p.bookid
    GROUP BY b.facid;
-- income суммарые поступления, count_month месяцы эксплуатации, initialoutlay цена объекта, monthlymaintenance цена месяца эксплуатации
-- Посчитаем сколько месяцев будет окупаться при тек цене
  UPDATE RentChange 
	SET month_before_profit = 
      CASE 
        -- не окупается в принципе, никогда
		WHEN (count_month * monthlymaintenance >= income) THEN -1 
        -- Цена здания / (доход-расход) * кол-во прошедших месяцев
        ELSE CEIL((initialoutlay) / (income - count_month * monthlymaintenance) * count_month)
      END;
  -- Расчет изменения стоимости аренды
  UPDATE RentChange 
	SET new_rent_coef = 
      CASE 
        -- не окупается в принципе, цену не меняем
		WHEN (count_month * monthlymaintenance >= income) THEN 1 
        --  (срок окупаемости - прошедшие месяцы) / (срок окупаемости + нужный нам % - прошедшие месяцы)
        --  -% и цена взлетает наверх, срок быстрее, цена выше, все ок.
        ELSE (month_before_profit-count_month)/((month_before_profit)*(1 + in_percentage_change / 100)-count_month)
      END;
  -- Возвращение сообщения об успешном завершении
  RETURN 'Изменения аренды рассчитаны и сохранены в sql файл';
END//

DELIMITER ;
SELECT Calc_Rent_Change(10.54);
SELECT * FROM RentChange;