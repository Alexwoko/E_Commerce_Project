USE e_commerce_model

INSERT INTO ShippingDetails(first_name, last_name, address_id)
VALUES(@first_name, @last_name, @address_id);

SELECT ROW_COUNT() AS success_indicator;
