USE e_commerce_model;

DELETE FROM Customers
WHERE customer_id = @customer_id;

SELECT ROW_COUNT() AS success_indicator;