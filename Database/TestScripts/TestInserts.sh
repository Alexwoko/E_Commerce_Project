#!/bin/bash

# TestScript.sh
# RUN IN BASH CONTEXT:
# bash /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestInserts.sh
# (bash -u root -p < /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestInserts.sh)

# Set the path to the mysql binary
MYSQL_PATH=/usr/local/mysql-8.2.0-macos13-x86_64/bin/mysql

# Test Product Creation
cd /Users/alextao/ECommerceProject/ECommerceProject/Database/Queries/InsertQueries/
$MYSQL_PATH -u root -p <<EOF
SET @product_name = 'Shirt';
SET @price = 150.00;
SET @product_description = 'Summer shirt - polka dots';

source AddProduct.sql;

SELECT * FROM Products;
EOF

