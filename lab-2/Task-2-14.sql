use cd;
select facility
  from facilities
  where monthlymaintenance in (select min(monthlymaintenance) from facilities)
	or monthlymaintenance in (select max(monthlymaintenance) from facilities);