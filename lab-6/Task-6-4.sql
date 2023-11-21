use cd;
-- Task-6-4.  Выведите список членов клуба, отформатированных как 'Surname, Firstname'
SELECT concat(upper(left(m.surname, 1)), lower(right(m.surname, length(m.surname)-1)), ', ',
              upper(left(m.firstname, 1)), lower(right(m.firstname, length(m.firstname)-1)))
  FROM members m