USE e_commerce_model

UPDATE ShippingDetails
SET address_id = @address_id
WHERE shipping_details_id = @shipping_details_id;

SELECT ROW_COUNT() AS success_indicator;