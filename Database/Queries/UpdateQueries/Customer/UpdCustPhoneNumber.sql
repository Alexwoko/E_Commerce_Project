USE e_commerce_model

UPDATE Customers
SET phone_number = @phone_number
WHERE customer_id = @customer_id;

SELECT ROW_COUNT() AS success_indicator;