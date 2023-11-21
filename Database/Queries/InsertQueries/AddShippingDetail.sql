USE e_commerce_model

INSERT INTO ShippingDetails(first_name, last_name, address_id)
VALUES(@first_name, @last_name, (SELECT address_id FROM Addresses WHERE customer_id = @customer_id));

-- VALUES(@first_name, @last_name, @address_id);

SELECT ROW_COUNT() AS success_indicator;
