use cd;
-- Task-5-10:  Создайте список общего количества мест, забронированных на один объект в месяц в 2012 году. 
-- Включите выходные строки, содержащие итоговые суммы за все месяцы по каждому объекту а также итоговые суммы за все месяцы для всех объектов. 
-- Выходная таблица должна состоять из идентификатора объекта, месяца и слотов, отсортированных по идентификатору и месяцу. 
-- При вычислении агрегированных значений для всех месяцев и всех facid возвращайте нулевые значения в столбцах месяца и facid.
select IFNULL(facid, 0), IFNULL(st, 0), sm 
  from(SELECT b.facid, month(b.starttime) as st, sum(b.slots) as sm
		  FROM bookings b 
		  group by b.facid, month(b.starttime ) WITH ROLLUP) as qwe;	  