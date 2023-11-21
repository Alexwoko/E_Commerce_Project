USE e_commerce_model

UPDATE Orders
SET total_amount =(
    SELECT SUM(unit_price * quantity)
    FROM OrderItems
    WHERE order_id = @order_id 
)
WHERE order_id = @order_id;


