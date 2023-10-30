-- Task-2-10: Выберите 10 фамилий членов клуба упорядочите их по алфавиту без повторов.
use cd;
SELECT DISTINCT surname
  FROM (SELECT surname
          FROM members 
          limit 10) AS MEM2
  ORDER BY surname