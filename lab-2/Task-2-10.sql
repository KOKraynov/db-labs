-- Task-2-10: Выберите 10 фамилий членов клуба упорядочите их по алфавиту без повторов.
USE cd;
SELECT surname
  FROM (SELECT DISTINCT surname
          FROM members 
          limit 10) AS MEM2
  ORDER BY surname