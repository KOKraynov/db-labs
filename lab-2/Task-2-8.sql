-- Task-2-8: Выбрать имена объектов с их качественной стоимостью (качественной стоимостью == ‘дешевый’ 
-- если monthlymaintenance < 100 и ‘дорогой’ в противном случае
use cd;
SELECT facility,
       CASE
         WHEN monthlymaintenance < 100 THEN 'Дешевый'
         ELSE 'Дорогой'
       END as COST_NAME
  FROM facilities; 