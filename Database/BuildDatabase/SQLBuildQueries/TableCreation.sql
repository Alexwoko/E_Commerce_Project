USE mysql;
DROP SCHEMA IF EXISTS e_commerce_model;
CREATE SCHEMA IF NOT EXISTS e_commerce_model;


-- Create product table

CREATE TABLE e_commerce_model.Products(
product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
product_description TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ALWAYS STORE ADDRESS DATA FIRST!
CREATE TABLE e_commerce_model.Addresses(
    address_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE e_commerce_model.Customers(
customer_id BIGINT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
default_shipping_address_id BIGINT,
default_billing_address_id BIGINT,
email VARCHAR(100) NOT NULL UNIQUE,
phone_number VARCHAR(15),
registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(default_shipping_address_id) REFERENCES Addresses(address_id),
FOREIGN KEY(default_billing_address_id) REFERENCES Addresses(address_id)
);

CREATE TABLE e_commerce_model.ShippingDetails(
shipping_details_id BIGINT AUTO_INCREMENT PRIMARY KEY,    
customer_id BIGINT,
address_id BIGINT,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY(address_id) REFERENCES Addresses(address_id)
);

CREATE TABLE e_commerce_model.BillingDetails(
    billing_details_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT,
    credit_card_number VARCHAR(20) NOT NULL,
    expiration_date DATE NOT NULL,
    address_id BIGINT,
    FOREIGN KEY(address_id) REFERENCES Addresses(address_id)
);

CREATE TABLE e_commerce_model.Orders(
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    customer_id BIGINT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 00.00 CHECK (total_amount >= 0),
    order_status VARCHAR(20) DEFAULT 'processing' CHECK (order_status IN ('processing', 'shipped', 'delivered')),
    payment_status VARCHAR(20) DEFAULT 'pending' CHECK (payment_status IN ('pending', 'paid', 'failed')),
    shipping_details_id BIGINT NOT NULL,
    billing_details_id BIGINT NOT NULL, 
    discount_amount DECIMAL(10,2) DEFAULT 0.00 NOT NULL CHECK (discount_amount >= 0),
    shipping_fee DECIMAL(10,2) DEFAULT 0.00 NOT NULL CHECK (shipping_fee >= 0),
    currency VARCHAR (3) NOT NULL, 
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit card', 'paypal')),
    tracking_number VARCHAR(20) NOT NULL,
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (shipping_details_id) REFERENCES Addresses(address_id) ON DELETE CASCADE,
    FOREIGN KEY (billing_details_id) REFERENCES Addresses(address_id) ON DELETE CASCADE
);


CREATE TABLE e_commerce_model.OrderItems(
    order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT,
    product_id BIGINT,
    quantity INT NOT NULL CHECK (quantity >= 0), 
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);
