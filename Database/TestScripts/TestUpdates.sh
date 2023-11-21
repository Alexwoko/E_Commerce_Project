#!/bin/bash

# TestScript.sh
# RUN IN BASH CONTEXT:
# bash /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestUpdates.sh
# (bash -u root -p < /Users/alextao/ECommerceProject/ECommerceProject/Database/TestScripts/TestUpdates.sh)

# Set the path to the mysql binary
MYSQL_PATH=/usr/local/mysql-8.2.0-macos13-x86_64/bin/mysql
cd /Users/alextao/ECommerceProject/ECommerceProject/Database/Queries/UpdateQueries/Order/


# Total amount should be updated after OrderItems insert!!!!!!!!
# TEST ORDER TotalAmount UPDATE
Echo 'Testing order TotalAmount Update...'
$MYSQL_PATH -u root -p <<EOF

source UpdOrderTotalAmount.sql

SELECT * FROM Orders;
EOF


# REMEMBER TO CHANGE DIRECTORY cd... COMMAND FOR EVERY FOLDER IN UPDATE FOLDER!!!!!

: '
customer_id_to_update=1
customer_new_first_name="John"

cd /Users/alextao/ECommerceProject/ECommerceProject/Database/Queries/UpdateQueries/Customer/
$MYSQL_PATH -u root -p <<EOF
SET @customer_id = $customer_id_to_update;
SET @first_name = $customer_new_first_name;
$(< UpdCustFirstName.sql);
SHOW ERRORS;
SELECT * FROM Products;
EOF
' 