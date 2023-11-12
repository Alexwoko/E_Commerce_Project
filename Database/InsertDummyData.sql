DELETE FROM e_commerce_model.products;

/* Dummy data for testing
products (product_id INT, product_name VARCHAR(255), price DECIMAL(10,2), description TEXT, created_at TIMESTAMP)
*/
INSERT INTO e_commerce_model.products (product_name, price, description)
VALUES('Shampoo', 24.95, 'This shampoo is amazing - try it!'),
('Toothpaste', 15.00, 'Keeps your breath fresh'),
('Shaving foam', 19.95, 'Smooth shaving foam with a smell of fresh air'),
('Sun screen', 110.00, 'Protection 40'),
('Sandals', 15.50, 'Size 40'),
('Candle light', 50.00, 'With a smell of lavender'),
('Napkins', 7.50, 'For fine dining');

