USE e_commerce_model

DELIMITER //
CREATE FUNCTION add_product(
product_name VARCHAR(255),
price DECIMAL(10,2),
description TEXT) 
RETURNS INT
READS SQL DATA
BEGIN

DECLARE initial_row_count INT;
DECLARE final_row_count INT;
DECLARE success_indicator INT DEFAULT 0;

-- GET INITIAL ROW COUNT
SELECT COUNT(*) INTO initial_row_count FROM products;
-- PERFORM INSERTION
INSERT INTO e_commerce_model.products(product_name, price, description)
VALUES(product_name, price, description);
-- GET FINAL ROW COUNT
SELECT COUNT(*) INTO final_row_count FROM products;

IF(final_row_count > initial_row_count) THEN
SET success_indicator := 1;
END IF;

RETURN success_indicator;
END;
LANGUAGE sql;
DELIMITER;