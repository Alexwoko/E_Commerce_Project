USE e_commerce_model

UPDATE Customers
SET email = @email
WHERE customer_id = @customer_id;

SELECT ROW_COUNT() AS success_indicator;