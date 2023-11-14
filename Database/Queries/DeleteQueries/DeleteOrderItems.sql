USE e_commerce_model;
-- DELETES A FULL ORDER / ALL PRODUCTS FROM ORDER (Used when an order is deleted?)
DELETE FROM OrderItems
WHERE order_id = @order_id;

SELECT ROW_COUNT() AS success_indicator;