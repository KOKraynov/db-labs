CREATE VIEW `overdue_orders` AS
  SELECT op.order_id, op.order_date, 
         op.delivery_date, op.order_price
    FROM order_prices op
    WHERE op.delivery_date > op.order_date