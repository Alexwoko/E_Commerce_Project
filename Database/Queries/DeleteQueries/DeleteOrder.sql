USE e_commerce_model;

DELETE FROM Orders
WHERE order_id = @order_id;

SELECT ROW_COUNT() AS success_indicator;