CREATE VIEW `order_prices` AS
  SELECT o.order_id, f.price + l.price + r.price as 'order_price', o.order_date,
         CASE 
           WHEN (l.delivery >= r.delivery)AND(l.delivery >= f.delivery) THEN l.delivery
           WHEN (r.delivery >= l.delivery)AND(r.delivery >= f.delivery) THEN r.delivery
           ELSE f.delivery
		 END AS 'delivery_date'
    FROM orders o, lenses l, lenses r, frames f
    WHERE o.left_lense_id = l.lense_id
      AND o.right_lense_id = r.lense_id
      AND o.frame_id = f.frame_id