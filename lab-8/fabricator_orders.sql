CREATE VIEW `fabricator_orders` AS
  WITH lense_fabr as (
		SELECT l.fabricator_id, YEAR(l.delivery) fyear, 
			   MONTH(l.delivery) fmonth, SUM(l.price) as lense_price
		  FROM lenses l
		  GROUP BY l.fabricator_id, YEAR(l.delivery), MONTH(l.delivery)),
       frame_fabr as (
		SELECT f.fabricator_id, YEAR(f.delivery) fyear, 
			   MONTH(f.delivery) fmonth, SUM(f.price) as frame_price
		  FROM frames f
		  GROUP BY f.fabricator_id, YEAR(f.delivery), MONTH(f.delivery))
  SELECT lf.fabricator_id,
         lf.fyear as order_year,
         lf.fmonth as order_month,
         IFNULL(lf.lense_price, 0) + IFNULL(ff.frame_price, 0) as order_price
    FROM lense_fabr lf
    LEFT JOIN frame_fabr ff
      ON lf.fabricator_id = ff.fabricator_id 
        AND lf.fyear = ff.fyear AND lf.fmonth = ff.fmonth
  UNION ALL
  SELECT ff.fabricator_id,
         ff.fyear as order_year,
         ff.fmonth as order_month,
         IFNULL(lf.lense_price, 0) + IFNULL(ff.frame_price, 0) as order_price
    FROM lense_fabr lf
    RIGHT JOIN frame_fabr ff
      ON lf.fabricator_id = ff.fabricator_id 
        AND lf.fyear = ff.fyear AND lf.fmonth = ff.fmonth
	WHERE lf.fabricator_id IS NULL