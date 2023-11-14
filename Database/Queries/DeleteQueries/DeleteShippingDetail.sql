USE e_commerce_model;

DELETE FROM ShippingDetails
WHERE shipping_details_id = @shipping_details_id;

SELECT ROW_COUNT() AS success_indicator;