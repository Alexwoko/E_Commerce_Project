USE e_commerce_model

UPDATE Products
SET product_name = @product_name
WHERE product_id = @product_id;

SELECT ROW_COUNT() AS success_indicator;