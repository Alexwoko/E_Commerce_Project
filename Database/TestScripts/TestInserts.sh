#!/bin/bash

# TestScript.sh
# RUN IN BASH CONTEXT:
# bash /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestInserts.sh
# (bash -u root -p < /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestInserts.sh)

# Set the path to the mysql binary
MYSQL_PATH=/usr/local/mysql-8.2.0-macos13-x86_64/bin/mysql
cd /Users/alextao/ECommerceProject/ECommerceProject/Database/Queries/InsertQueries/
# Test Product insertion
echo 'Test product insertion...' 
$MYSQL_PATH -u root -p <<EOF
SET @product_name = 'Shirt';
SET @price = 150.00;
SET @product_description = 'Summer shirt - polka dots';

source AddProduct.sql;

SELECT * FROM Products;
EOF

# Test Address insertion
echo 'Test Address insertion...'
$MYSQL_PATH -u root -p <<EOF
SET @street_address = 'Script test street 46';
SET @city = 'Script testville';
SET @zip_code = '2750';
SET @country = 'Denmark';

source AddAddress.sql;

SELECT * FROM Addresses;
EOF

# Test Customer insertion
Echo 'Test Customer insertion...'
$MYSQL_PATH -u root -p <<EOF
SET @first_name = 'Alex Tao';
SET @last_name = 'Wogelius';
SET @email = 'alexwoko@gmaol.com';
SET @phone_numer = '31161612';

source AddCustomer.sql;

SELECT * FROM Customer;
EOF

# Insert Shipping details og Billing details skal blive kørt af UpdShip...sql og UpdBill....sql scripts kun! 
# Derfor testes de ikke her, men i update tests. 






# WHEN TESTING INSERTION OF ORDER REMEMBER TO FIRST AddOrder.sql, THEN AddOrderItem AND LASTLY UpdOrderTotalPrice!

