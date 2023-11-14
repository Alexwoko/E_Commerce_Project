USE e_commerce_model

UPDATE Orders
SET payment_status = @payment_status
WHERE order_id = @order_id;

SELECT ROW_COUNT() AS success_indicator;