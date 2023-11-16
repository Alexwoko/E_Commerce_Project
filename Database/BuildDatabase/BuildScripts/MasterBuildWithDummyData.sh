#!/bin/bash


# Run in bash context: bash /Users/alextao/ECommerceProject/ECommerceProject/Database/BuildDatabase/BuildScripts/MasterBuildWithDummyData.sh

# Set the path to the mysql binary
MYSQL_PATH=/usr/local/mysql-8.2.0-macos13-x86_64/bin/mysql

echo 'Creating tables...'
cd /Users/alextao/ECommerceProject/ECommerceProject/Database/BuildDatabase/SQLBuildQueries/

$MYSQL_PATH -u root -p13471n06r03m4n e_commerce_model < TableCreation.sql

echo 'Inserting dummy data...'

$MYSQL_PATH -u root -p13471n06r03m4n e_commerce_model < InsertDummyData.sql




