#creating database
DROP DATABASE walmart_db;
CREATE DATABASE walmart_db;

#using database walmart
USE walmart_db;

/* DDL- Create Tables */
CREATE TABLE user_t (
    UserID INT NOT NULL AUTO_INCREMENT,
    Password VARCHAR(30) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    DOB DATE NOT NULL,
    AccountType VARCHAR(30) NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (UserID)
) ;

CREATE TABLE seller_t (
    SellerID INT NOT NULL,
    SellerName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Reviews VARCHAR(50),
    CONSTRAINT seller_pk PRIMARY KEY (SellerID)
);

CREATE TABLE user_details_t (
    UserID INT,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    CONSTRAINT user_details_pk PRIMARY KEY (UserID, PhoneNumber, Email),
    CONSTRAINT user_details_fk FOREIGN KEY (UserID)
        REFERENCES user_t (UserID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE product_t (
    ProductID INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(30) NOT NULL,
    Description VARCHAR(50),
    Price INT NOT NULL,
    Category VARCHAR(30),
    SellerID INT,
    CONSTRAINT product_pk PRIMARY KEY (ProductID),
    CONSTRAINT product_fk FOREIGN KEY (SellerID)
        REFERENCES seller_t (SellerID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE order_t (
    OrderID INT NOT NULL AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    OrderTime VARCHAR(50) NOT NULL,
    Amount INT NOT NULL,
    OrderStatus VARCHAR(30) NOT NULL,
    UserID INT,
    CONSTRAINT order_pk PRIMARY KEY (OrderID),
    CONSTRAINT order_fk1 FOREIGN KEY (UserID)
        REFERENCES user_t (UserID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE order_details_t (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    CONSTRAINT order_details_pk PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT order_details_fk1 FOREIGN KEY (OrderID)
        REFERENCES order_t (OrderID)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT order_details_fk2 FOREIGN KEY (ProductID)
        REFERENCES product_t (ProductID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE payment_t (
    PaymentID INT NOT NULL AUTO_INCREMENT,
    PaymentDate DATE NOT NULL,
    PaymentTime VARCHAR(50) NOT NULL,
    Amount INT NOT NULL,
    ModeOfPayment VARCHAR(30) NOT NULL,
    UserID INT,
    OrderID INT,
    CONSTRAINT payment_pk PRIMARY KEY (PaymentID),
    CONSTRAINT payment_fk1 FOREIGN KEY (UserID)
        REFERENCES user_t (UserID)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT payment_fk2 FOREIGN KEY (OrderID)
        REFERENCES order_t (OrderID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE walmart_plus_t (
    WPID INT NOT NULL AUTO_INCREMENT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Points INT NOT NULL,
    UserID INT,
    CONSTRAINT walmart_plus_pk PRIMARY KEY (WPID),
    CONSTRAINT walmart_plus_fk FOREIGN KEY (UserID)
        REFERENCES user_t (UserID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE discount_t (
    DiscountID INT NOT NULL AUTO_INCREMENT,
    Validity DATE NOT NULL,
    Type VARCHAR(50) NOT NULL,
    WPID INT,
    CONSTRAINT discount_pk PRIMARY KEY (DiscountID),
    CONSTRAINT discount_fk FOREIGN KEY (WPID)
        REFERENCES walmart_plus_t (WPID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE special_discount_t (
    DiscountID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Percentage INT NOT NULL,
    CONSTRAINT special_discount_pk PRIMARY KEY (DiscountID),
    CONSTRAINT special_discount_fk FOREIGN KEY (DiscountID)
        REFERENCES discount_t (DiscountID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE regular_discount_t (
    DiscountID INT,
    Percentage INT NOT NULL,
    CONSTRAINT regular_discount_pk PRIMARY KEY (DiscountID),
    CONSTRAINT regular_discount_fk FOREIGN KEY (DiscountID)
        REFERENCES discount_t (DiscountID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE normal_account_t (
    UserID INT,
    CONSTRAINT normal_account_pk PRIMARY KEY (UserID),
    CONSTRAINT normal_account_fk FOREIGN KEY (UserID)
        REFERENCES user_t (UserID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/* DML - Insert Data into tables */

INSERT INTO user_t (UserID, Password, FirstName, LastName, Address, DOB, AccountType) VALUES
(1, 'abcd1234', 'Y', 'D', 'San Francisco', '1995-06-11', 'WP'),
(2, 'efgh1234', 'An', 'Pn', 'San Jose', '1997-08-15', 'WP'),
(3, 'ijkl1234', 'Ji', 'Ba', 'Union City', '1998-09-26', 'Normal'),
(4, 'mnop1234', 'Ly', 'Ro', 'Fremont', '1995-12-06', 'Normal'),
(5, 'qrst1234', 'Kan', 'Ma', 'Fremont', '1995-02-07', 'WP'),
(6, 'uvwx1234', 'Nari', 'R', 'Hayward', '1997-12-04', 'Normal'),
(7, 'abcd5678', 'Ay', 'Gg', 'San Francisco', '2000-01-01', 'WP'),
(8, 'efgh5678', 'Ga', 'She', 'Hayward', '1999-04-06', 'WP'),
(9, 'ijkl5678', 'Aia', 'Ki', 'Union City', '1996-09-03', 'WP'),
(10, 'mnop5678', 'Ri', 'Par', 'Dublin', '1996-08-08', 'Normal'),
(11, 'qrst5678', 'Saj', 'War', 'Pleasanton', '1994-10-07', 'WP'),
(12, 'uvwx1234', 'Chi', 'Dia', 'San Francisco', '1998-02-03', 'Normal'),
(13, 'abcd1357', 'Ma', 'Da', 'San Francisco', '1995-12-02', 'WP'),
(14, 'abcd2468', 'Ja', 'Doa', 'San Francisco', '1992-09-09', 'WP'),
(15, 'efgh2468', 'Mi', 'Ni', 'Fremont', '1994-10-05', 'Normal');


INSERT INTO seller_t (SellerID, SellerName, Address, Reviews) VALUES
(111, 'ABC Enterprise', 'Fremont', 'Good'),
(112, 'DEF Inc', 'Fremont', 'Very Good'),
(113, 'GHI Enterprise', 'Hayward', 'Excellent'),
(114, 'JKL Retail', 'Dublin', 'Moderate'),
(115, 'MNO Inc', 'Pleasanton', 'Excellent'),
(116, 'PQR Enterprise', 'Union City', 'Good'),
(117, 'STU Inc', 'San Jose', 'Very Good'),
(118, 'VWX Retail', 'San Francisco', 'Below Average'),
(119, 'YZA Company', 'San Jose', 'Average'),
(120, 'BCD Enterprise', 'Daly City', 'Very Good');

INSERT INTO user_details_t (UserID, PhoneNumber, Email) VALUES
(1, '5109948903', 'ya@outlook.com'),
(2, '5109948924', 'an1@gmail.com'),
(3, '5109948923', 'ji2@yahoo.com'),
(4, '5109948932', 'ly3@icloud.com'),
(5, '5109948941', 'kn4@outlook.com'),
(6, '5109948951', 'ny5@gmail.com'),
(7, '5109948961', 'ai12@icloud.com'),
(8, '5109948971', 'gau@outlook.com'),
(9, '5109948981', 'ai7@gmail.com'),
(10,'5109948901', 'ri89@icloud.com'),
(11, '5109948963', 'saj4@outlook.com'),
(12, '5109948973', 'chia7@yahoo.com'),
(13, '5109948928', 'ma@icloud.com'),
(14, '5109948920', 'ja@gmail.com'),
(15, '5109948912', 'mi@outlook.com');



INSERT INTO product_t (ProductID, ProductName, Description, Price, Category, SellerID) VALUES
(10, 'Amazon Alexa', 'Automated Voice Recongnition Machine', 100, 'Music',111),
(11, 'Telivison', 'Smart TV', 600, 'Electronics',112),
(12, 'Washing Machine', 'To wash clothes', 800, 'Appliances',113),
(13, 'Think like a monk', 'Motivational book', 60, 'Books',114),
(14, 'Office desk', 'To do office work', 100, 'Office',115),
(15, 'Notepad', 'Write important notes', 10, 'Stationary',116),
(16, 'Apple Iphone', 'Smartphone', 1000, 'Electronics',112),
(17, 'Refrigerator', 'Storage of Groceries', 1500, 'Appliances',113),
(18, 'Google Home Mini', 'Automated Voice Recongnition Machine', 75, 'Music',117),
(19, 'Apple Macbook', 'Laptop', 1200, 'Electronics',118),
(20, 'The Alchemist', 'Motivational book', 30, 'Books',119),
(21, 'Study Table', 'For study purpose', 50, 'Office',120);


INSERT INTO order_t (OrderID, OrderDate, OrderTime, Amount, OrderStatus, UserID) VALUES
(100, '2020-01-05', '11:05 PM', 150, 'Order Placed', 1),
(101, '2020-02-10', '12:08 AM', 800, 'Delivered', 2),
(102, '2020-03-15', '02:09 PM', 100, 'Order Processed', 3),
(103, '2020-04-20', '04:02 PM', 1000, 'In Transit', 4),
(104, '2020-05-25', '07:12 PM', 1200, 'Delivered', 5),
(105, '2020-06-30', '09:35 AM', 30, 'Order Processed', 6),
(106, '2020-01-07', '12:46 PM', 50, 'Delivered', 7),
(107, '2020-02-14', '01:57 AM', 1500, 'Delivered', 8),
(108, '2020-07-21', '02:22 PM', 75, 'In Transit', 9),
(109, '2020-10-28', '03:33 AM', 60, 'Order Processed', 10),
(110, '2020-11-04', '04:44 PM', 1400, 'Order Processed', 11),
(111, '2020-02-08', '07:55 AM', 105, 'In Transit', 12),
(112, '2020-04-12', '09:12 PM', 150, 'Delivered', 13),
(113, '2020-06-16', '11:24 PM', 100, 'In Transit', 14),
(114, '2020-12-20', '12:36 AM', 160, 'Order Processed', 15),
(115, '2021-01-24', '11:48 PM', 1500, 'Delivered', 1),
(116, '2021-10-28', '10:00 AM', 1200, 'In Transit', 2),
(117, '2021-12-03', '11:14 AM', 70, 'Delivered', 4),
(118, '2021-07-06', '10:28 AM', 90, 'Order Processed', 7),
(119, '2021-09-09', '06:42 PM', 1600, 'Delivered', 3);


INSERT INTO order_details_t (OrderID, ProductID, Quantity) VALUES
(100, 18, 2),
(101, 12, 1),
(102, 10, 1),
(103, 16, 1),
(104, 19, 1),
(105, 20, 1),
(106, 21, 1),
(107, 17, 1),
(108, 18, 1),
(109, 13, 1),
(110, 11, 1),
(110, 12, 1),
(111, 18, 1),
(111, 20, 1),
(112, 18, 2),
(113, 14, 1),
(114, 13, 1),
(114, 14, 1),
(115, 17, 1),
(116, 19, 1),
(117, 15, 7),
(118, 13, 1),
(118, 20, 1),
(119, 12, 2);


INSERT INTO payment_t (PaymentID, PaymentDate, PaymentTime, Amount, ModeOfPayment, UserID, OrderID) VALUES
(1000, '2020-01-05', '11:07 PM', 150, 'Credit Card', 1, 100),
(1001, '2020-02-10', '12:10 AM', 800, 'Debit Card', 2, 101),
(1002, '2020-03-15', '02:11 PM', 100, 'Bank Transfer', 3, 102),
(1003, '2020-04-20', '04:03 PM', 1000, 'Paypal', 4, 103),
(1004, '2020-05-25', '07:13 PM', 1200, 'Debit Card', 5, 104),
(1005, '2020-06-30', '09:35 AM', 30, 'Credit Card', 6, 105),
(1006, '2020-01-07', '12:47 PM', 50, 'Credit Card', 7, 106),
(1007, '2020-02-14', '01:59 AM', 1500, 'Debit Card', 8, 107),
(1008, '2020-07-21', '02:24 PM', 75, 'Credit Card', 9, 108),
(1009, '2020-10-28', '03:36 AM', 60, 'Debit Card', 10, 109),
(1010, '2020-11-04', '04:45 PM', 1400, 'Paypal', 11, 110),
(1011, '2020-02-08', '07:57 AM', 105, 'Bank Transfer', 12, 111),
(1012, '2020-04-12', '09:13 PM', 150, 'Credit Card', 13, 112),
(1013, '2020-06-16', '11:25 PM', 100, 'Debit Card', 14, 113),
(1014, '2020-12-20', '12:39 AM', 160, 'Credit Card', 15, 114),
(1015, '2021-01-24', '11:51 PM', 1500, 'Credit Card', 1, 115),
(1016, '2021-10-28', '10:02 AM', 1200, 'Debit Card', 2, 116),
(1017, '2021-12-03', '11:15 AM', 70, 'Credit Card', 4, 117),
(1018, '2021-07-06', '10:28 AM', 90, 'Paypal', 7, 118),
(1019, '2021-09-09', '06:43 PM', 1600, 'Credit Card', 3, 119);


INSERT INTO walmart_plus_t (WPID, StartDate, EndDate, Points, UserID) VALUES
(200, '2019-01-24', '2022-01-23', 10000, 1),
(201, '2019-02-28', '2022-02-27', 1500, 2),
(202, '2019-03-12', '2022-03-11', 7600, 3),
(203, '2019-04-18', '2022-04-17', 8000, 4),
(204, '2019-05-06', '2022-05-05', 6200, 5),
(205, '2019-06-03', '2022-06-02', 12000, 6),
(206, '2019-04-09', '2022-04-08', 1300, 7),
(207, '2019-03-05', '2022-03-04', 9400, 8),
(208, '2019-04-21', '2022-04-20', 7200, 9),
(209, '2019-03-27', '2022-03-26', 6600, 10),
(210, '2019-02-14', '2022-02-13', 4600, 11),
(211, '2019-02-07', '2022-02-06', 13000, 12),
(212, '2019-08-28', '2022-08-27', 1400, 13),
(213, '2019-10-01', '2022-09-30', 5000, 14),
(214, '2019-12-02', '2022-12-01', 3600, 15);


INSERT INTO discount_t (DiscountID, Validity, Type, WPID) VALUES
(1, '2025-01-01', 'Special', 200),
(2, '2024-12-31', 'Special', 201),
(3, '2025-01-01', 'Special', 202),
(4, '2025-06-15', 'Special', 203),
(5, '2025-01-01', 'Regular', 204),
(6, '2024-12-31', 'Special', 205),
(7, '2024-12-31', 'Regular', 206),
(8, '2025-01-01', 'Special', 207),
(9, '2024-12-31', 'Regular', 208),
(10, '2025-01-01', 'Special', 209),
(11, '2025-06-15', 'Regular', 210),
(12, '2025-01-01', 'Special', 211),
(13, '2024-12-31', 'Regular', 212),
(14, '2025-01-01', 'Regular', 213),
(15, '2025-06-15', 'Special', 214);


INSERT INTO special_discount_t (DiscountID, StartDate, EndDate, Percentage) VALUES
(1, '2019-01-01', '2025-01-01', 50),
(2, '2019-01-01', '2024-12-31', 20),
(3, '2019-01-01', '2025-01-01', 30),
(4, '2019-01-01', '2025-06-15', 40),
(6, '2019-01-01', '2024-12-31', 25),
(8, '2019-01-01', '2025-01-01', 15),
(10, '2019-01-01', '2025-01-01', 35),
(12, '2019-01-01', '2025-01-01', 60),
(15, '2019-01-01', '2025-06-15', 40);


INSERT INTO regular_discount_t (DiscountID, Percentage) VALUES
(5, 08),
(7, 10),
(9, 12),
(11, 15),
(13, 15),
(14, 20);


INSERT INTO normal_account_t (UserID) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);



/* Alter Table - Rename */
ALTER TABLE user_t
RENAME COLUMN DOB TO DateOfBirth;


/* Drop Table */
DROP TABLE normal_account_t;


/* Rename Table */
ALTER TABLE product_t rename to product_details_t;


/* DML - Update Records */
UPDATE user_t
set AccountType = 'WP'
where UserID = 3;


/* DML - Delete Records */
DELETE FROM user_t where FirstName = 'Ji';


/* DML - Select Records */
SELECT * FROM order_t
WHERE orderID = 100;



/* Joins - Natural Join */
/* List unique product name, product price and product price after 10% discount of all products that exist in order_details */
SELECT DISTINCT prd.productName, prd.Price, .9*prd.Price as "After Discount" 
FROM product_details_t prd
NATURAL JOIN order_details_t ordl;

/* Joins - Inner Join */
/* Select User information whose order is delivered successfully */
SELECT user.* from user_t user
INNER JOIN order_t ord on (user.UserId = ord.Userid)
WHERE upper(OrderStatus) = upper('Delivered');

/* Joins - Left Join */
/* Display ProductID which is ordered more than once*/
SELECT ordl.ProductID FROM order_details_t ordl
LEFT JOIN product_details_t prd on (prd.productID = ordl.productID)
GROUP BY ordl.productID
HAVING count(ordl.productID) > 1;

/* Joins - Equi Join */
/* List customer information for customers that have placed orders after 2020-12-31 */
select user.*,ord.* from user_t user, order_t ord
where user.UserId = ord.Userid
and OrderDate > '2020-12-31';


/* Views */
/* Create view to display user information of users having Walmart Plus or WP Account Type
and First name starting with 'A' */
CREATE OR REPLACE VIEW user_view as
SELECT user_t.* from user_t
WHERE UPPER(AccountType) = upper('WP')
AND UPPER(FirstName) LIKE UPPER('A%');

SELECT * FROM user_view;


/* Views */
/* Create view to display product information of products whose price is between 500 and 1000 and whose quantity is more than 1 in order_details table*/
CREATE OR REPLACE VIEW product_view as
SELECT prd.* from product_details_t prd
join order_details_t ordl
WHERE prd.price between 500 and 1000
AND ordl.quantity > 1;

SELECT * FROM product_view;
