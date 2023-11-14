USE e_commerce_model

UPDATE Addresses
SET street_address = @street_address, city = @city, zip_code = @zip_code, country = @country
WHERE address_id = @address_id;

SELECT ROW_COUNT() AS success_indicator;