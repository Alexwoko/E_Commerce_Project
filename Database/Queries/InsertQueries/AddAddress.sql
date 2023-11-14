USE e_commerce_model

INSERT INTO Addresses(street_address, city, zip_code, country)
VALUES(@street_address, @city, @zip_code, @country);

SELECT ROW_COUNT() AS success_indicator;
