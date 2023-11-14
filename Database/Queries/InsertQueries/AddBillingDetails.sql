USE e_commerce_model

INSERT INTO BillingDetails(customer_id, credit_card_number, expiration_date, address_id)
VALUES(@customer_id, @credit_card_number, @expiration_date, @address_id);

SELECT ROW_COUNT() AS success_indicator;
