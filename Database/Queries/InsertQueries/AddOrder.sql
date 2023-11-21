USE e_commerce_model

INSERT INTO Orders(customer_id, shipping_details_id, billing_details_id, currency, payment_method, tracking_number, 
notes)
VALUES(@customer_id, 
(SELECT shipping_details_id FROM ShippingDetails WHERE customer_id = @customer_id), 
(SELECT billing_details_id FROM BillingDetails WHERE customer_id = @customer_id), 
@currency, @payment_method, @tracking_number, @notes);

SELECT ROW_COUNT() AS success_indicator;

-- Capture ID for OrderItems inserts
SELECT LAST_INSERT_ID() AS order_id;

