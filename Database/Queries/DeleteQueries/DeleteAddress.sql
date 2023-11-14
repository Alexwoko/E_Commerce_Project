USE e_commerce_model;

DELETE FROM Addresses
WHERE address_id_id = @address_id;

SELECT ROW_COUNT() AS success_indicator;