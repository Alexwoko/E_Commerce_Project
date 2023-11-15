DELETE FROM e_commerce_model.Products;
DELETE FROM e_commerce_model.Addresses;
DELETE FROM e_commerce_model.Customers;
DELETE FROM e_commerce_model.ShippingDetails;

ALTER TABLE e_commerce_model.Products AUTO_INCREMENT = 1;
/* Dummy data for testing
products (product_id INT, product_name VARCHAR(255), price DECIMAL(10,2), product_description TEXT, created_at TIMESTAMP)
*/
INSERT INTO e_commerce_model.Products (product_name, price, product_description)
VALUES('Shampoo', 24.95, 'This shampoo is amazing - try it!'),
('Toothpaste', 15.00, 'Keeps your breath fresh'),
('Shaving foam', 19.95, 'Smooth shaving foam with a smell of fresh air'),
('Sun screen', 110.00, 'Protection 40'),
('Sandals', 15.50, 'Size 40'),
('Candle light', 50.00, 'With a smell of lavender'),
('Napkins', 7.50, 'For fine dining');

SELECT * FROM e_commerce_model.Products;


ALTER TABLE e_commerce_model.Addresses AUTO_INCREMENT = 1;

INSERT INTO e_commerce_model.Addresses(street_address, city, zip_code, country)
VALUES('Teststreet 23', 'Testcity', '5000', 'Testland'),
('Imaginestreet 75, 2. th.', 'Imaginecity', '2323-2200', 'Imagineland'),
('Phantomstreet 101', 'Phantomcity', '2323', 'Phantomland'),
('Duckville street 82', 'Duckville', '4001-9000', 'Duckland'),
('Fantasystreet 44', 'Fantacity', '2424', 'Fantasyland'),
('Neumannstreet 1010', 'Neumanncity', '1010-0101', 'Neumannland'),
('Turingstreet 0101', 'Turingcity', '0101-1010', 'Turingland');

SELECT * FROM e_commerce_model.Addresses;



ALTER TABLE e_commerce_model.Customers AUTO_INCREMENT = 1;

INSERT INTO e_commerce_model.Customers(first_name, last_name, email, phone_number)
VALUES ('Test', 'Testesen', 'test@testesen.com', '12345678'),
('Jenny', 'Imagine', 'jenny@imagine.com', '87654321'),
('Poul', 'Phantom', 'poul@phantom.com', '0000-0000'),
('Donald', 'Duck', 'donald@duck.com', '23232323'),
('Irene', 'Fantasy', 'irene@fantasy.com', '44556677'),
('John', 'Von Neumann', 'john@neumann.com', '1010-1010'),
('Allan', 'Turing', 'allan@turing.com', '0101-0101');

SELECT * FROM e_commerce_model.Customers;



ALTER TABLE e_commerce_model.ShippingDetails AUTO_INCREMENT = 1;

INSERT INTO e_commerce_model.ShippingDetails(customer_id, address_id)
VALUES(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

SELECT * FROM e_commerce_model.ShippingDetails;



DELETE FROM e_commerce_model.BillingDetails;
ALTER TABLE e_commerce_model.BillingDetails AUTO_INCREMENT = 1;

INSERT INTO e_commerce_model.BillingDetails(customer_id, credit_card_number, expiration_date, address_id)
VALUES(1, '1111-1111-1111-1111', '2031-01-01', 1),
(2, '2222-2222-2222-2222', '2032-02-02', 2),
(3, '3333-3333-3333-3333', '2033-03-03', 3),
(4, '4444-4444-4444-4444', '2034-04-04', 4),
(5, '5555-5555-5555-5555', '2035-05-05', 5),
(6, '6666-6666-6666-6666', '2036-06-06', 6),
(7, '7777-7777-7777-7777', '2037-07-07', 7);

SELECT * FROM e_commerce_model.BillingDetails;

/*

UPDATE e_commerce_model.Customers
SET default_shipping_address_id = (
    SELECT shipping_details_id
    FROM e_commerce_model.ShippingDetails
    WHERE e_commerce_model.ShippingDetails.customer_id = e_commerce_model.Customers.customer_id
)
WHERE EXISTS (
    SELECT 1
    FROM e_commerce_model.ShippingDetails
    WHERE e_commerce_model.ShippingDetails.customer_id = e_commerce_model.Customers.customer_id
);

UPDATE e_commerce_model.Customers
SET default_billing_address_id = (
    SELECT billing_details_id
    FROM e_commerce_model.BillingDetails
    WHERE e_commerce_model.BillingDetails.customer_id = e_commerce_model.Customers.customer_id
)
WHERE EXISTS (
    SELECT 1
    FROM e_commerce_model.BillingDetails
    WHERE e_commerce_model.BillingDetails.customer_id = e_commerce_model.Customers.customer_id
);

SELECT * FROM e_commerce_model.Customers;

DELETE FROM e_commerce_model.Orders;
ALTER TABLE e_commerce_model.Orders AUTO_INCREMENT = 1;
INSERT INTO e_commerce_model.Orders(customer_id, shipping_details_id, billing_details_id, currency, payment_method,
tracking_number, notes)
VALUES(1,
(SELECT shipping_details_id FROM e_commerce_model.ShippingDetails WHERE customer_id = 1), 
(SELECT billing_details_id FROM e_commerce_model.BillingDetails WHERE customer_id = 1), 
'USD', 'credit card', '123-321',''),
(2,
(SELECT shipping_details_id FROM e_commerce_model.ShippingDetails WHERE customer_id = 2), 
(SELECT billing_details_id FROM e_commerce_model.BillingDetails WHERE customer_id = 2), 
'DDK', 'paypal', '234-432', 'This is a danish customer'),
(3,
(SELECT shipping_details_id FROM e_commerce_model.ShippingDetails WHERE customer_id = 3), 
(SELECT billing_details_id FROM e_commerce_model.BillingDetails WHERE customer_id = 3),
'EUR', 'credit card', '345-543', ''),
(4,
(SELECT shipping_details_id FROM e_commerce_model.ShippingDetails WHERE customer_id = 4),
(SELECT billing_details_id FROM e_commerce_model.BillingDetails WHERE customer_id = 4),
'USD', 'credit card', '456-654', 'This is a premium order'),
(5,
(SELECT shipping_details_id FROM e_commerce_model.ShippingDetails WHERE customer_id = 5),
(SELECT billing_details_id FROM e_commerce_model.BillingDetails WHERE customer_id = 5),
'EUR', 'paypal', '567-765', ''),
(6,
(SELECT shipping_details_id FROM e_commerce_model.ShippingDetails WHERE customer_id = 6),
(SELECT billing_details_id FROM e_commerce_model.BillingDetails WHERE customer_id = 6),
'DDK', 'paypal', '678-876', 'Thanks for the great service!'),
(7,
(SELECT shipping_details_id FROM e_commerce_model.ShippingDetails WHERE customer_id = 7),
(SELECT billing_details_id FROM e_commerce_model.BillingDetails WHERE customer_id = 7),
'USD', 'credit card', '789-987',''
);

SELECT * FROM e_commerce_model.Orders;

DELETE FROM e_commerce_model.OrderItems;
ALTER TABLE e_commerce_model.OrderItems AUTO_INCREMENT = 1;

INSERT INTO e_commerce_model.OrderItems(order_id, product_id, quantity, unit_price)
VALUES(1, 1, 2,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 1)),
(1, 2, 1,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 2)),
(1, 3, 7,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 3)),
(2, 4, 4,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 4)),
(2, 5, 1,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 5)),
(2, 6, 2,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 6)),
(3, 7, 20,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 7)),
(3, 1, 10,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 1)),
(3, 2, 3,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 2)),
(4, 3, 1,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 3)),
(4, 4, 6,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 4)),
(4, 5, 2,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 5)),
(5, 6, 7,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 6)),
(5, 7, 5,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 7)),
(5, 1, 16,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 1)),
(6, 2, 6,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 2)),
(6, 3, 3,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 3)),
(6, 4, 8,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 4)),
(7, 5, 1,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 5)),
(7, 6, 1,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 6)),
(7, 7, 1,
(SELECT price FROM e_commerce_model.Products WHERE product_id = 7));

SELECT * FROM e_commerce_model.OrderItems;

UPDATE e_commerce_model.Orders
SET total_amount = (
SELECT SUM(unit_price * quantity)
FROM e_commerce_model.OrderItems
WHERE order_id = 1
)
Where order_id = 1;

UPDATE e_commerce_model.Orders
SET total_amount = (
SELECT SUM(unit_price * quantity)
FROM e_commerce_model.OrderItems
WHERE order_id = 2
)
Where order_id = 2;

UPDATE e_commerce_model.Orders
SET total_amount = (
SELECT SUM(unit_price * quantity)
FROM e_commerce_model.OrderItems
WHERE order_id = 3
)
Where order_id = 3;

UPDATE e_commerce_model.Orders
SET total_amount = (
SELECT SUM(unit_price * quantity)
FROM e_commerce_model.OrderItems
WHERE order_id = 4
)
Where order_id = 4;

UPDATE e_commerce_model.Orders
SET total_amount = (
SELECT SUM(unit_price * quantity)
FROM e_commerce_model.OrderItems
WHERE order_id = 5
)
Where order_id = 5;

UPDATE e_commerce_model.Orders
SET total_amount = (
SELECT SUM(unit_price * quantity)
FROM e_commerce_model.OrderItems
WHERE order_id = 6
)
Where order_id = 6;

UPDATE e_commerce_model.Orders
SET total_amount = (
SELECT SUM(unit_price * quantity)
FROM e_commerce_model.OrderItems
WHERE order_id = 7
)
Where order_id = 7;

SELECT * FROM e_commerce_model.Orders;

-- Finish by updating total amount in orders by summing OrderItems unit_price * amount

*/