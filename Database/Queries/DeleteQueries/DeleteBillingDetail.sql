USE e_commerce_model;

DELETE FROM BillingDetails
WHERE billing_details_id = @billing_details_id;

SELECT ROW_COUNT() AS success_indicator;