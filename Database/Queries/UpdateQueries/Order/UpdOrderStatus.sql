USE e_commerce_model

UPDATE Orders
SET order_status = @order_status
WHERE order_id = @order_id;

SELECT ROW_COUNT() AS success_indicator;