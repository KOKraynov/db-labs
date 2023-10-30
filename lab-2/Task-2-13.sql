-- Task-2-13: Выберите имя, фамилию и дату вступления в клуб последних из всех вступивших.
use cd;
SELECT surname, firstname, joindate
  FROM members 
  where joindate in (select max(joindate) 
                       from members);