use cd;
-- Task-6-7. Подсчитайте количество участников, чья фамилия начинается на определенную букву, отсортировав по буквам в порядке убывания. 
SELECT substr(surname, 1, 1) AS fl, COUNT(*)
  FROM members
  GROUP BY fl
  ORDER BY fl DESC;