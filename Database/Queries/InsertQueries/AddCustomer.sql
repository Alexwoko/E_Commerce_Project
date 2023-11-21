USE e_commerce_model

INSERT INTO Customers(first_name, last_name, default_shipping_address_id, default_billing_address_id, email, phone_number)
VALUES(@first_name, @last_name, @address_id, @address_id, @email, @phone_number);

SELECT ROW_COUNT() AS success_indicator;
