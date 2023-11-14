USE e_commerce_model

INSERT INTO OrderItems(order_id, product_id, quantity, unit_price)
VALUES(@order_id, @product_id, @quantity, @unit_price);

SELECT ROW_COUNT() AS success_indicator;
