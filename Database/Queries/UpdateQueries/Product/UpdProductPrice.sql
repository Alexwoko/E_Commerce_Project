USE e_commerce_model

UPDATE Products
SET price = @price
WHERE product_id = @product_id;

SELECT ROW_COUNT() AS success_indicator;