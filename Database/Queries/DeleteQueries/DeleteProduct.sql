USE e_commerce_model;

DELETE FROM Products
WHERE product_id = @product_id;

SELECT ROW_COUNT() AS success_indicator;