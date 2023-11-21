USE e_commerce_model
/*
UPDATE BillingDetails
SET address_id = @address_id
WHERE billing_details_id = @billing_details_id;

SELECT ROW_COUNT() AS success_indicator;
*/

-- Step 1: Check if the address already exists for the customer
SET @existing_address_id = (
    SELECT address_id
    FROM Addresses 
    WHERE street_address = @street_address
    AND city = @city 
    AND zip_code = @zip_code
    AND country = @country 
    AND address_id IN(
        SELECT address_id
        FROM BillingDetails
        WHERE customer_id = @customer_id
    )
);

-- Step 2: If the address does not exist, insert it
IF @existing_address_id IS NULL THEN
INSERT INTO ADDRESSES(street_address, city, zip_code, country)
VALUES(@street_address, @city, @zip_code, @country);
SET @new_address_id = LAST_INSERT_ID();
ELSE
SET @new_address_id = @existing_address_id;
END IF;

-- Step 3: Update default_billing_address_id in customer table
UPDATE Customers
SET default_billing_address_id = new_address_id
WHERE customer_id = @customer_id;

-- Step 4: Update or insert the billing details in the BillingDetails table
INSERT INTO BillingDetails(shipping_details_id, credit_card_number, ecpiration_date, customer_id, address_id)
VALUES (@shipping_details_id, @credit_card_number, @expiration_date, @customer_id, @address_id)
ON DUPLICATE KEY UPDATE address_id = @new_address_id;
