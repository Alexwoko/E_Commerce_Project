USE e_commerce_model

UPDATE Customers
SET lastt_name = @last_name
WHERE customer_id = @customer_id;

SELECT ROW_COUNT() AS success_indicator;