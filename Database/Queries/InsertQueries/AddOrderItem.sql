USE e_commerce_model

INSERT INTO OrderItems(order_id, product_id, quantity)
VALUES(@order_id, @product_id, @quantity, (SELECT price FROM Products WHERE product_id = @product_id));
--VALUES(@order_id, @product_id, @quantity, @unit_price);

SELECT ROW_COUNT() AS success_indicator;
