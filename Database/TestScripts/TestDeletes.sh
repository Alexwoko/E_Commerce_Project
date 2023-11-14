#!/bin/bash

# TestScript.sh
# RUN IN BASH CONTEXT:
# bash /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestDeletes.sh
# (bash -u root -p < /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestDeletes.sh)

# Set the path to the mysql binary
MYSQL_PATH=/usr/local/mysql-8.2.0-macos13-x86_64/bin/mysql

# Test product deletion
product_id_to_delete=1

cd /Users/alextao/ECommerceProject/ECommerceProject/Database/Queries/DeleteQueries/
$MYSQL_PATH -u root -p <<EOF
SET @product_id = $product_id_to_delete;
$(< DeleteProduct.sql);
SHOW ERRORS;
SELECT * FROM Products;
EOF