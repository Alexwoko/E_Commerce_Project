USE e_commerce_model

INSERT INTO Orders(customer_id, total_amount, shipping_details_id, billing_details_id, currency, payment_method, tracking_number, 
notes)
VALUES(@customer_id, @total_amount, @shipping_details_id, @billing_details_id, @currency, @payment_method, @tracking_number, @notes);

SELECT ROW_COUNT() AS success_indicator;
