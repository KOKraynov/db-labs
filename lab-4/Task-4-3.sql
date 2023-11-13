use cd;
-- Task-4-3: Добавьте еще одно spa с такими же характеристиками как в задании 1, сгенерировав новое ID.
INSERT INTO facilities(FACID, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
  SELECT (select max(FACID)+1 from facilities) as new_fac_id,  
         f.facility, f.membercost, f.guestcost, 
         f.initialoutlay, f.monthlymaintenance
    FROM facilities f
    where f.facility = 'spa'
	limit 1;
COMMIT;
-- Эта конструкция может бесконечно добавлять с новыми ID