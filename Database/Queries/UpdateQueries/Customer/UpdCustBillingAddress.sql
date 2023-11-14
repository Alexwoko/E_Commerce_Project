USE e_commerce_model

UPDATE Customers
SET default_billing_address_id = @default_billing_address_id
WHERE customer_id = @customer_id;

SELECT ROW_COUNT() AS success_indicator;