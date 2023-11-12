USE mysql;
DROP SCHEMA IF EXISTS e_commerce_model;
CREATE SCHEMA IF NOT EXISTS e_commerce_model;


-- Create product table

CREATE TABLE e_commerce_model.Products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
description TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE e_commerce_model.Orders(
order_id INT AUTO_INCREMENT PRIMARY KEY, 
customer_id INT NOT NULL,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Multiple rows can point to a single order id, cointaining many products/OrderItems
CREATE TABLE e_commerce_model.OrderItems(
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

CREATE TABLE e_commerce_model.ShippingDetails(
shipping_details_id INT AUTO_INCREMENT PRIMARY KEY,    
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address_1 VARCHAR(50) NOT NULL,
address_2 VARCHAR(50),
zip_code VARCHAR(20) NOT NULL,
city VARCHAR(50) NOT  NULL,
country VARCHAR(50) NOT NULL
);
