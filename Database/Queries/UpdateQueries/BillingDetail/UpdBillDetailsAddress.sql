USE e_commerce_model

UPDATE BillingDetails
SET address_id = @address_id
WHERE billing_details_id = @billing_details_id;

SELECT ROW_COUNT() AS success_indicator;