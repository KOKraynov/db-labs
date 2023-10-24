use cd;
SELECT facility,
       CASE
         WHEN monthlymaintenance < 100 THEN 'Дешевый'
         ELSE 'Дорогой'
       END as COST_NAME
  FROM facilities 
  ORDER BY facility; 