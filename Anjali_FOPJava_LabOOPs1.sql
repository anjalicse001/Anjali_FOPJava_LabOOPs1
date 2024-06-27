CREATE TABLE supplier (
  SUPP_ID INT PRIMARY KEY,
  SUPP_NAME VARCHAR(50) NOT NULL,
  SUPP_CITY VARCHAR(50) NOT NULL,
  SUPP_PHONE VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
  CUS_ID INT PRIMARY KEY,
  CUS_NAME VARCHAR(20) NOT NULL,
  CUS_PHONE VARCHAR(10) NOT NULL,
  CUS_CITY VARCHAR(30) NOT NULL,
  CUS_GENDER CHAR
);

CREATE TABLE category (
  CAT_ID INT PRIMARY KEY,
  CAT_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE product (
  PRO_ID INT PRIMARY KEY,
  PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
  PRO_DESC VARCHAR(60),
  CAT_ID INT,
  FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

CREATE TABLE supplier_pricing (
  PRICING_ID INT PRIMARY KEY,
  PRO_ID INT,
  SUPP_ID INT,
  SUPP_PRICE INT DEFAULT 0,
  FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE `order` (
  ORD_ID INT PRIMARY KEY,
  ORD_AMOUNT INT NOT NULL,
  ORD_DATE DATE NOT NULL,
  CUS_ID INT,
  PRICING_ID INT,
  FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
  FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE rating (
  RAT_ID INT PRIMARY KEY,
  ORD_ID INT,
  RAT_RATSTARS INT NOT NULL,
  FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);



CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE supplier (
  SUPP_ID INT PRIMARY KEY,
  SUPP_NAME VARCHAR(50) NOT NULL,
  SUPP_CITY VARCHAR(50) NOT NULL,
  SUPP_PHONE VARCHAR(50) NOT NULL
);

INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES
  (1, 'Rajesh Retails', 'Delhi', '1234567890'),
  (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
  (3, 'Knome products', 'Banglore', '9785462315'),
  (4, 'Bansal Retails', 'Kochi', '8975463285'),
  (5, 'Mittal Ltd.', 'Lucknow', '7898456532');
  
  
  
-- Insert data into supplier table
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES
  (1, 'Rajesh Retails', 'Delhi', '1234567890'),
  (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
  (3, 'Knome products', 'Banglore', '9785462315'),
  (4, 'Bansal Retails', 'Kochi', '8975463285'),
  (5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- Insert data into customer table  
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES
  (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
  (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
  (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
  (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
  (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

-- Insert data into category table
INSERT INTO category (CAT_ID, CAT_NAME) VALUES
  (1, 'BOOKS'),
  (2, 'GAMES'),
  (3, 'GROCERIES'),
  (4, 'ELECTRONICS'),
  (5, 'CLOTHES');

-- Insert data into product table
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES
  (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
  (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
  (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
  (4, 'OATS', 'Highly Nutritious from Nestle', 3),
  (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
  (6, 'MILK', '1L Toned MIlk', 3),
  (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
  (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
  (9, 'Project IGI', 'compatible with windows 7 and above', 2),
  (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
  (11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
  (12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- Insert data into supplier_pricing table
INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) VALUES
  (1, 1, 2, 1500),
  (2, 3, 5, 30000),
  (3, 5, 1, 3000),
  (4, 2, 3, 2500),
  (5, 4, 1, 1000),
  (6, 12, 2, 780),
  (7, 12, 4, 789),
  (8, 3, 1, 31000),
  (9, 1, 5, 1450),
  (10, 4, 2, 999),
  (11, 7, 3, 549),
  (12, 7, 4, 529),
  (13, 6, 2, 105),
  (14, 6, 1, 99),
  (15, 2, 5, 2999),
  (16, 5, 2, 2999);

-- Insert data into order table
INSERT INTO `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) VALUES
  (101, 1500, '2021-10-06', 2, 1),
  (102, 1000, '2021-10-12', 3, 5),
  (103, 30000, '2021-09-16', 5, 2),
  (104, 1500, '2021-10-05', 1, 1),
  (105, 3000, '2021-08-16', 4, 3),
  (106, 1450, '2021-08-18', 1, 9),
  (107, 789, '2021-09-01', 3, 7),
  (108, 780, '2021-09-07', 5, 6),
  (109, 3000, '2021-00-10', 5, 3),
  (110, 2500, '2021-09-10', 2, 4),
  (111, 1000, '2021-09-15', 4, 5),
  (112, 789, '2021-09-16', 4, 7),
  (113, 31000, '2021-09-16', 1, 8),
  (114, 1000, '2021-09-16', 3, 5),
  (115, 3000, '2021-09-16', 5, 3),
  (116, 99, '2021-09-17', 2, 14);

-- Insert data into rating table
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES
  (1, 101, 4),
  (2, 102, 3),
  (3, 103, 1),
  (4, 104, 2),
  (5, 105, 4),
  (6, 106, 3),
  (7, 107, 4),
  (8, 108, 4),
  (9, 109, 3),
  (10, 110, 5),
  (11, 111, 3),
  (12, 112, 4),
  (13, 113, 2),
  (14, 114, 1),
  (15, 115, 1),
  (16, 116, 0);










4. Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
sql
SELECT 
    CUS_GENDER, COUNT(*) AS TOTAL_CUSTOMERS
FROM
    customer c
        JOIN
    `order` o ON c.CUS_ID = o.CUS_ID
WHERE
    o.ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;

This query joins the customer and order tables to find customers who have placed orders of at least Rs.3000. It then groups the results by CUS_GENDER and counts the number of customers in each group.
5. Display all the orders along with product name ordered by a customer having Customer_Id=2
sql
SELECT 
    o.ORD_ID, p.PRO_NAME
FROM
    `order` o
        JOIN
    supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
        JOIN
    product p ON sp.PRO_ID = p.PRO_ID
WHERE
    o.CUS_ID = 2;

This query joins the order, supplier_pricing and product tables to get the ORD_ID and PRO_NAME for all orders placed by the customer with CUS_ID=2.
6. Display the Supplier details who can supply more than one product.
sql
SELECT 
    s.*
FROM
    supplier s
        JOIN
    supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
GROUP BY s.SUPP_ID
HAVING COUNT(DISTINCT sp.PRO_ID) > 1;

This query joins the supplier and supplier_pricing tables to get all suppliers. It groups the results by SUPP_ID and uses HAVING to filter for suppliers who have supplied more than one distinct product.
7. Find the least expensive product from each category and print the table with category id, name, product name and price of the product
sql
SELECT 
    c.CAT_ID, c.CAT_NAME, p.PRO_NAME, MIN(sp.SUPP_PRICE) AS PRICE
FROM
    category c
        JOIN
    product p ON c.CAT_ID = p.CAT_ID
        JOIN
    supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
GROUP BY c.CAT_ID
ORDER BY c.CAT_ID;

This query joins the category, product and supplier_pricing tables to get the category details and product prices. It groups the results by CAT_ID and uses MIN() to find the minimum price for each category. The ORDER BY clause sorts the results by CAT_ID.
8. Display the Id and Name of the Product ordered after "2021-10-05".
sql
SELECT DISTINCT
    p.PRO_ID, p.PRO_NAME
FROM
    product p
        JOIN
    supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
        JOIN
    `order` o ON sp.PRICING_ID = o.PRICING_ID
WHERE
    o.ORD_DATE > '2021-10-05';

This query joins the product, supplier_pricing and order tables to get the product details for orders placed after '2021-10-05'. The DISTINCT keyword ensures we only get unique product IDs and names.
9. Display customer name and gender whose names start or end with character 'A'.
sql
SELECT 
    CUS_NAME, CUS_GENDER
FROM
    customer
WHERE
    CUS_NAME LIKE 'A%'
        OR CUS_NAME LIKE '%A';

This query selects the CUS_NAME and CUS_GENDER columns from the customer table where the CUS_NAME starts or ends with 'A' using the LIKE operator with wildcard characters.
10. Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and Type_of_Service.
sql
DELIMITER //
CREATE PROCEDURE get_supplier_ratings()
BEGIN
    SELECT 
        s.SUPP_ID, s.SUPP_NAME, AVG(r.RAT_RATSTARS) AS RATING,
        CASE
            WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service' 
            WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS TYPE_OF_SERVICE
    FROM
        supplier s
            JOIN
        supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
            JOIN
        `order` o ON sp.PRICING_ID = o.PRICING_ID
            JOIN
        rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY s.SUPP_ID;
END //
DELIMITER ;

CALL get_supplier_ratings();

This stored procedure joins the supplier, supplier_pricing, order and rating tables to calculate the average rating for each supplier. It uses a CASE statement to categorize the service type based on the average rating. The DELIMITER commands are used to change the default delimiter to // for creating the procedure