INSERT INTO clients(fio, phone)
  VALUES('немец', '77777777'),
        ('хохол', '77777776'),
        ('француз', '77777775'),
        ('англ', '77777774'),
        ('русский', '77777773'),
        ('турок', '77777772'),
        ('японец', '77777771');
INSERT INTO fabricators(fabricator)
  VALUES('Фабрика оправ'),
        ('Завод линз'),
        ('Лавочка');
INSERT INTO frames(name, description, price, delivery, fabricator_id)
  VALUES('Черные', NULL, 500, sysdate()+5, 1),
        ('Бежевые', NULL, 1000, sysdate()+5, 1),
        ('Стальная', NULL, 2000, sysdate()+5, 1);
INSERT INTO lenses(dioptres, price, delivery, fabricator_id)
  VALUES(-11, 900, sysdate()+11, 2),
        (-4, 800, sysdate()+7, 2),
        (3, 700, sysdate()+3, 2);
INSERT INTO orders(order_date, payment_date, client_id, frame_id, left_lense_id, right_lense_id)
  VALUES(sysdate(), sysdate(), 1, 1, 4, 4),
        (sysdate(), sysdate(), 2, 2, 5, 5),
        (sysdate(), sysdate(), 3, 3, 6, 6);
        
