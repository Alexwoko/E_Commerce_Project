#!/bin/bash

# TestScript.sh
# RUN IN BASH CONTEXT:
# bash /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestInserts.sh
# (bash -u root -p < /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestInserts.sh)

# Set the path to the mysql binary
MYSQL_PATH=/usr/local/mysql-8.2.0-macos13-x86_64/bin/mysql
cd /Users/alextao/ECommerceProject/ECommerceProject/Database/Queries/InsertQueries/


# TEST PRODUCT INSERTION
echo 'Testing product insertion...' 
$MYSQL_PATH -u root -p <<EOF
SET @product_name = 'Shirt';
SET @price = 150.00;
SET @product_description = 'Summer shirt - polka dots';

source AddProduct.sql;

SELECT * FROM Products;
EOF

# TEST ADDRESS INSERTION
echo 'Testing Address insertion...'
$MYSQL_PATH -u root -p <<EOF
SET @street_address = 'Script test street 46';
SET @city = 'Script testville';
SET @zip_code = '2750';
SET @country = 'Denmark';

source AddAddress.sql;

SELECT * FROM Addresses;
EOF

# TEST CUSTOMER INSERTION
Echo 'Testing Customer insertion...'
$MYSQL_PATH -u root -p <<EOF
SET @first_name = 'Alex Tao';
SET @last_name = 'Wogelius';
SET @email = 'alexwoko@gmaol.com';
SET @phone_numer = '31161612';

source AddCustomer.sql;

SELECT * FROM Customer;
EOF

# TEST BillingDetail INSERTION
Echo 'Testing BillingDetail insertion...'
$MYSQL_PATH -u root -p <<EOF
SET @credit_card_number = '112233-4455';
SET @expiration_date = '2025-12-23';

source AddBillingDetail.sql;

SELECT * FROM BillingDetails;
EOF

# TEST ShippingDetail INSERTION
Echo 'Testing ShippingDetail insertion...'
$MYSQL_PATH -u root -p <<EOF

source AddShippingDetail.sql;

SELECT * FROM ShippingDetails;
EOF

# TEST Order INSERTION
Echo 'Testing Order insertion...'
$MYSQL_PATH -u root -p <<EOF
SET @currency = 'DDK';
SET @payment_method = 'credit card';
SET @tracking_number = '1234567';
SET @notes = 'This is coming from my bash test script.';

source AddOrder.sql;

SELECT * FROM Orders;
EOF

# TEST OrderItem INSERTION NR. 1
Echo 'Testing OrderItem insertion nr. 1...'
$MYSQL_PATH -u root -p <<EOF
SET @product_id = 1;
SEt @quantity = 3;

source AddOrderItem.sql;

EOF

# TEST OrderItem INSERTION NR. 2
Echo 'Testing OrderItem insertion nr. 2...'
$MYSQL_PATH -u root -p <<EOF
SET @product_id = 2;
SEt @quantity = 5;

source AddOrderItem.sql;

EOF

# TEST OrderItem INSERTION NR. 3
Echo 'Testing OrderItem insertion nr. 3...'
$MYSQL_PATH -u root -p <<EOF
SET @product_id = 3;
SEt @quantity = 15;

source AddOrderItem.sql;

SELECT * FROM OrderItems;

EOF


# When a customer is created this is the flow:
# Add Customer information
# (Add address                    Not required
# Add shipping details (INSERT)   Not required
# Add billing details) (INSERT)   Not required

# When an order is being made this is the flow:
# Add Order
# Add OrderItems
# Add Address (INSERT)                                Required
# Add ShippingDetails if they don't exist (UPDATE)    Required
# Add BillingDetails if they don't exist (UPDATE)     Required






# WHEN TESTING INSERTION OF ORDER REMEMBER TO FIRST AddOrder.sql, THEN AddOrderItem AND LASTLY UpdOrderTotalPrice!

