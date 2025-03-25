
-- Create Project database--

CREATE DATABASE QuickEatsDB;
USE QuickEatsDB;

-- Create Tables --

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(300)
);

CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(50) NOT NULL,
    Cusine VARCHAR(50) NOT NULL
);

CREATE TABLE Food (
    FoodID INT PRIMARY KEY,
    FoodName VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL
);

CREATE TABLE DeliveryPartner (
    PartnerID INT PRIMARY KEY,
    PartnerName VARCHAR(50) NOT NULL
);

CREATE TABLE FoodOrder (
    OrderID INT PRIMARY KEY,
    UserID INT NOT NULL,
    RestaurantID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    OrderDate DATE,
    PartnerID INT NOT NULL,
    Rating INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID),
    FOREIGN KEY (PartnerID) REFERENCES DeliveryPartner(PartnerID)
);

-- Create Junction tables --

CREATE TABLE Menu (
    RestaurantID INT NOT NULL,
    FoodID INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (RestaurantID, FoodID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID),
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    FoodID INT NOT NULL,
    Quantity INT,
    PRIMARY KEY (OrderID, FoodID),
    FOREIGN KEY (OrderID) REFERENCES FoodOrder(OrderID),
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);


-- Insert Data --

INSERT INTO DeliveryPartner (PartnerID, PartnerName) VALUES
(1, 'Gunther'),(2, 'Janice'),(3, 'David'),(4, 'Ben'),(5, 'Carol');

INSERT INTO User (UserID, FirstName, LastName, Email, Address) VALUES
(1, 'Joey', 'Tribbiani', 'joeyt@gmail.com', '1996 4th Street, Apt 2B, New York, NY 10001'),
(2, 'Chandler', 'Bing', 'bing@gmail.com', '1996 4th Street, Apt 2B, New York, NY 10001'),
(3, 'Ross', 'Geller', 'geller@gmail.com', '495 Grove Street, Apt 20, New York, NY 10002'),
(4, 'Phoebe', 'Buffay', 'phoebe@gmail.com', '7 Lullaby Lane, New York, NY 10003'),
(5, 'Monica', 'Geller', 'monica@gmail.com', '1996 4th Street, Apt 2A, New York, NY 10001'),
(6, 'Rachel', 'Green', 'rachel@gmail.com', '1996 4th Street, Apt 2A, New York, NY 10001'),
(7, 'Mike', 'Hannigan', 'mike@gmail.com', '22 Love Lane, New York, NY 10005');

INSERT INTO Restaurant (RestaurantID, RestaurantName, Cusine) VALUES
(1, 'Dominos', 'Italian'),(2, 'KFC', 'American'),(3, 'Chipotle', 'Mexican'),
(4, 'Indian Darbar', 'Indian'),(5, 'China Town', 'Chinese');

INSERT INTO Food (FoodID, FoodName, Category) VALUES
(1, 'Chicken Pizza', 'Non-veg'),(2, 'Mushroom Pizza', 'Veg'),(3, 'Sandwich', 'Veg'),(4, 'Chicken Wings', 'Non-veg'),
(5, 'Chicken Popcorn', 'Non-veg'),(6, 'Chicken Bowl', 'Non-veg'),(7, 'Burrito', 'Non-veg'),(8, 'Butter Chicken', 'Non-veg'),
(9, 'Dal Tadka', 'Veg'),(10, 'Fried Rice', 'Veg'),(11, 'Kung Pao Chicken', 'Non-veg');

INSERT INTO Menu (RestaurantID, FoodID, Price) VALUES
(1, 1, 15),(1, 2, 12),(1, 3, 9),(2, 3, 10),(2, 4, 9),(2, 5, 8),(3, 5, 12),(3, 6, 9),(3, 7, 14),
(4, 4, 13),(4, 8, 18),(4, 9, 10),(4, 10, 12),(5, 5, 15),(5, 6, 12),(5, 10, 10),(5, 11, 12);

INSERT INTO FoodOrder (OrderID, UserID, RestaurantID, Amount, OrderDate, PartnerID, Rating) VALUES
(1001, 1, 1, 24, '2024-05-10', 1, 5),(1002, 1, 2, 19, '2024-05-26', 1, 5),(1003, 2, 3, 21, '2024-06-15', 5, 4),
(1004, 2, 5, 22, '2024-06-29', 4, 3),(1005, 3, 5, 22, '2024-05-10', 1, 1),(1006, 3, 1, 26, '2024-06-10', 2, 5),
(1007, 4, 2, 19, '2024-06-23', 3, 1),(1008, 4, 3, 23, '2024-07-07', 5, 4),(1009, 5, 4, 31, '2024-07-17', 4, 5),
(1010, 6, 5, 34, '2024-05-30', 1, 1),(1011, 6, 1, 15, '2024-06-10', 2, 3),(1012, 6, 4, 18, '2024-07-20', 5, 4);

INSERT INTO OrderDetails (OrderID, FoodID, Quantity) VALUES
(1001, 1, 1),(1001, 3, 1),(1002, 4, 1),(1002, 3, 1),(1003, 6, 1),(1003, 5, 1),(1004, 6, 1),(1004, 10, 1),(1005, 10, 1),
(1005, 11, 1),(1006, 1, 1),(1006, 2, 1),(1006, 3, 1),(1007, 4, 1),(1007, 3, 1),(1008, 6, 1),(1008, 7, 1),(1009, 4, 1),
(1009, 8, 1),(1010, 6, 1),(1010, 10, 1),(1010, 11, 1),(1011, 1, 1),(1012, 8, 1);


-- Run Queries --

-- 1 Retrieve the data from each table by using the SELECT * statement and order by PK column(s) --

SELECT * FROM User ORDER BY UserID;

SELECT * FROM Restaurant ORDER BY RestaurantID;

SELECT * FROM Food ORDER BY FoodID;

SELECT * FROM DeliveryPartner ORDER BY PartnerID;

SELECT * FROM FoodOrder ORDER BY OrderID;

SELECT * FROM Menu ORDER BY RestaurantID, FoodID;

SELECT * FROM OrderDetails ORDER BY OrderID, FoodID;

-- 2 Query with INNER JOIN using junction table and two related tables --

SELECT Restaurant.RestaurantName, Food.FoodName, Menu.Price
FROM Menu
INNER JOIN Restaurant ON Menu.RestaurantID = Restaurant.RestaurantID
INNER JOIN Food ON Menu.FoodID = Food.FoodID
ORDER BY Restaurant.RestaurantName, Food.FoodName;

-- 3 Query with LEFT OUTER JOIN --

SELECT User.FirstName, User.LastName, FoodOrder.OrderID, FoodOrder.Amount, FoodOrder.OrderDate
FROM User
LEFT OUTER JOIN FoodOrder ON User.UserID = FoodOrder.UserID
ORDER BY User.UserID;

-- 4 Single-row subquery --

SELECT Food.FoodName, Menu.Price
FROM Menu
INNER JOIN Food ON Menu.FoodID = Food.FoodID
WHERE Menu.Price = (SELECT MAX(Price) FROM Menu)
ORDER BY Food.FoodName;

-- 5 Multiple-row subquery --

SELECT Restaurant.RestaurantName
FROM Restaurant
WHERE Restaurant.RestaurantID IN (
    SELECT Menu.RestaurantID
    FROM Menu
    WHERE Menu.Price > (SELECT AVG(Price) FROM Menu))
ORDER BY Restaurant.RestaurantName;

-- 6 Aggregate results with multiple columns -- 

SELECT DeliveryPartner.PartnerName, SUM(FoodOrder.Amount) AS TotalRevenue, AVG(FoodOrder.Rating) AS AvgRating
FROM DeliveryPartner
INNER JOIN FoodOrder ON DeliveryPartner.PartnerID = FoodOrder.PartnerID
GROUP BY DeliveryPartner.PartnerName
ORDER BY DeliveryPartner.PartnerName;

-- 7 Subquery using NOT IN operator --

SELECT User.FirstName, User.LastName
FROM User
WHERE User.UserID NOT IN (SELECT FoodOrder.UserID FROM FoodOrder)
ORDER BY User.UserID;

-- 8 Query using CASE statement --

SELECT Menu.RestaurantID, Food.FoodName, Menu.Price,
    CASE 
        WHEN Menu.Price >= 11 THEN 'Expensive'
        ELSE 'Affordable'
    END AS PriceCategory
FROM Menu
INNER JOIN Food ON Menu.FoodID = Food.FoodID
ORDER BY Menu.RestaurantID, Food.FoodName;

-- 9 Query using NOT EXISTS operator --

SELECT Restaurant.RestaurantID, Restaurant.RestaurantName
FROM Restaurant
WHERE NOT EXISTS (
    SELECT 1
    FROM Menu
    INNER JOIN Food ON Menu.FoodID = Food.FoodID
    WHERE Food.Category = 'Non-veg' AND Menu.RestaurantID = Restaurant.RestaurantID)
ORDER BY Restaurant.RestaurantID;

-- 10 Subquery using NOT NULL operator --

SELECT FoodOrder.OrderID, FoodOrder.UserID, FoodOrder.Amount, FoodOrder.OrderDate
FROM FoodOrder
WHERE FoodOrder.OrderID IN (
    SELECT DISTINCT OrderDetails.OrderID
    FROM OrderDetails
    WHERE OrderDetails.Quantity IS NOT NULL)
ORDER BY FoodOrder.OrderID;


-- Show the DDL for the table
SHOW CREATE TABLE User;

SHOW CREATE TABLE Food;

SHOW CREATE TABLE Restaurant;

SHOW CREATE TABLE Menu;

SHOW CREATE TABLE DeliveryPartner;

SHOW CREATE TABLE FoodOrder;

SHOW CREATE TABLE OrderDetails;




