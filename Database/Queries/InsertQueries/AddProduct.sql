USE e_commerce_model

INSERT INTO Products(product_name, price, product_description)
VALUES(@product_name, @price, @product_description);

SELECT ROW_COUNT() AS success_indicator;
