use cd;
-- Task-3-6: Выберите список бронирований на 14 сентября 2012 г., стоимость которых более 30. Включите в выходные данные название заведения, имя участника, отформатированное как одиночное столбец, и стоимость. Упорядочивайте по убыванию стоимости и не используйте подзапросы.
-- Помните, что у гостей разные затраты по сравнению с участниками (указанные затраты указаны за получасовой «интервал»), а идентификатор гостя всегда имеет идентификатор 0. 
SELECT f.facility,
       concat(m.surname, ' ', m.firstname) as member_name,
       case
         when m.zipcode = 0 then f.guestcost
         else f.membercost
	   end as cost
  FROM bookings b, members m, facilities f
  WHERE b.memid = m.memid
    AND b.facid = f.facid
    AND DATE(b.starttime) = '2012-09-14'
    AND ((m.zipcode = 0 and f.guestcost > 30)
	  OR (m.zipcode <> 0 and f.membercost > 30))
  ORDER BY 3 DESC