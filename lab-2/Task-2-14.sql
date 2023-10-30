-- Task-2-14: Выберите самый дорогой и самый дешевый объект.
use cd;
select facility, 
       CASE
         WHEN monthlymaintenance < 100 THEN 'Дешевый'
         ELSE 'Дорогой'
       END as COST_NAME
  from facilities
  where monthlymaintenance in (select min(monthlymaintenance) from facilities)
	or monthlymaintenance in (select max(monthlymaintenance) from facilities);