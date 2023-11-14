USE e_commerce_model;
-- DELETES A SINGLE ORDER ITEM/PRODUCT
DELETE FROM OrderItems
WHERE order_item_id = @order_item_id;

SELECT ROW_COUNT() AS success_indicator;