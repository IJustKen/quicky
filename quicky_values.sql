-- Role for Customers
CREATE ROLE customer_role NOINHERIT;
-- Role for Admins
CREATE ROLE admin_role NOINHERIT;
-- Role for Delivery Personnel
CREATE ROLE delivery_role NOINHERIT;

-- Grant privileges
GRANT SELECT, INSERT ON Users, Orders, Payments, Reviews TO customer_role;
GRANT SELECT ON Restaurants, MenuItems, RestaurantMenus TO customer_role;

-- Grant EXECUTE on specific functions
GRANT EXECUTE ON FUNCTION GetRestaurantMenu(TEXT) TO customer_role;
GRANT EXECUTE ON FUNCTION RecordPayment(INT, INT, NUMERIC, TEXT, TEXT, TEXT) TO customer_role;
GRANT EXECUTE ON FUNCTION GetRestaurantsByCuisine(TEXT) TO customer_role;

-- Full access to all base tables
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO admin_role;

-- Execute all functions
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO admin_role;  --execute once more


-- Allow reading their deliveries and status updates
GRANT SELECT, UPDATE ON Delivery TO delivery_role;
GRANT SELECT ON Orders TO delivery_role;

-- Allow function execution
GRANT EXECUTE ON FUNCTION GetDeliveryStatus(INT) TO delivery_role;


CREATE OR REPLACE VIEW RestaurantMenus AS
SELECT 
    r.Name AS RestaurantName,
    m.Name AS ItemName,
    m.Price,
    m.Category,
    m.Availability
FROM 
    Restaurants r
JOIN 
    MenuItems m ON r.RestaurantID = m.RestaurantID;

CREATE OR REPLACE VIEW CustomerOrders AS
SELECT 
    o.OrderID,
    u.Name AS CustomerName,
    r.Name AS RestaurantName,
    o.OrderDate,
    o.TotalAmount,
    o.Status
FROM 
    Orders o
JOIN 
    Users u ON o.UserID = u.UserID
JOIN 
    Restaurants r ON o.RestaurantID = r.RestaurantID;


CREATE OR REPLACE VIEW DeliveryStatusView AS
SELECT 
    d.OrderID,
    u.Name AS CustomerName,
    dp.Name AS DeliveryPerson,
    dp.VehicleType,
    d.EstimatedTime,
    d.Status
FROM 
    Delivery d
JOIN 
    Orders o ON d.OrderID = o.OrderID
JOIN 
    Users u ON o.UserID = u.UserID
JOIN 
    DeliveryPerson dp ON d.DeliveryPersonID = dp.DeliveryPersonID;

CREATE or replace VIEW PendingDeliveries AS
SELECT
    d.DeliveryID,
    d.OrderID,
    o.Status AS OrderStatus,
    d.EstimatedTime,
    d.Status AS DeliveryStatus
FROM Delivery d
JOIN Orders o ON d.OrderID = o.OrderID
WHERE d.Status != 'Completed';

CREATE or replace VIEW UserOrderSummary AS
SELECT
    u.Name AS UserName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.Status,
    r.Name AS RestaurantName
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID;


CREATE OR REPLACE FUNCTION GetRestaurantMenu(restaurant_name TEXT)
RETURNS TABLE (
    ItemName VARCHAR(100),
    Price NUMERIC,
    Category VARCHAR(50),
    Availability BOOLEAN
)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.Name, m.Price, m.Category, m.Availability
    FROM 
        MenuItems m
    JOIN 
        Restaurants r ON m.RestaurantID = r.RestaurantID
    WHERE 
        r.Name = restaurant_name;
END; $$;

DROP FUNCTION getrestaurantmenu(text)

CREATE OR REPLACE PROCEDURE RecordPayment(
    p_order_id INT,
    p_user_id INT,
    p_amount NUMERIC,
    p_method TEXT,
    p_status TEXT,
    p_transaction_id TEXT
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID)
    VALUES (p_order_id, p_user_id, p_amount, p_method, p_status, p_transaction_id);
END;
$$;


drop procedure Recordpayment

CREATE OR REPLACE FUNCTION GetDeliveryStatus(p_order_id INT)
RETURNS TABLE (
    OrderID INT,
    DeliveryStatus VARCHAR(20),
    EstimatedTime TIMESTAMP,
    DeliveryPerson VARCHAR(100)
)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT 
        d.OrderID,
        d.Status,
        d.EstimatedTime,
        u.Name
    FROM Delivery d
    JOIN Users u ON d.DeliveryPersonID = u.UserID
    WHERE d.OrderID = p_order_id;
END;
$$;

DROP FUNCTION getdeliverystatus(integer)


CREATE OR REPLACE FUNCTION GetRestaurantsByCuisine(cuisine TEXT)
RETURNS TABLE (
    RestaurantName TEXT,s
    Location TEXT,
    Rating NUMERIC
)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT r.Name, r.Location, r.Rating
    FROM Restaurants r
    JOIN MenuItems m ON r.RestaurantID = m.RestaurantID
    WHERE m.Category ILIKE cuisine;
END; $$;

drop function GetRestaurantsByCuisine;


CREATE OR REPLACE FUNCTION AddMenuItem(
    rest_id INT,
    item_name TEXT,
    price NUMERIC,
    category TEXT,
    availability BOOLEAN
)
RETURNS VOID
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability)
    VALUES (rest_id, item_name, price, category, availability);
END; $$;





-- Function
CREATE OR REPLACE FUNCTION UpdateOrderTotal()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Orders
    SET TotalAmount = (
        SELECT SUM(Subtotal)
        FROM OrderDetails
        WHERE OrderID = NEW.OrderID
    )
    WHERE OrderID = NEW.OrderID;
    
    RETURN NEW;
END; $$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_update_order_total
AFTER INSERT OR UPDATE ON OrderDetails
FOR EACH ROW
EXECUTE FUNCTION UpdateOrderTotal();



-- Function
CREATE OR REPLACE FUNCTION PreventUnavailableItems()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM MenuItems 
        WHERE ItemID = NEW.ItemID AND Availability = FALSE
    ) THEN
        RAISE EXCEPTION 'Item is not available for ordering.';
    END IF;
    
    RETURN NEW;
END; $$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_prevent_unavailable_items
BEFORE INSERT ON OrderDetails
FOR EACH ROW
EXECUTE FUNCTION PreventUnavailableItems();



-- Function
CREATE OR REPLACE FUNCTION SetDefaultReviewDate()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Date IS NULL THEN
        NEW.Date := NOW();
    END IF;
    
    RETURN NEW;
END; $$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_set_review_date
BEFORE INSERT ON Reviews
FOR EACH ROW
EXECUTE FUNCTION SetDefaultReviewDate();


-- Function
CREATE OR REPLACE FUNCTION SyncDeliveryWithOrder()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Status = 'Delivered' THEN
        UPDATE Delivery
        SET Status = 'Completed'
        WHERE OrderID = NEW.OrderID;
    END IF;
    
    RETURN NEW;
END; $$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_sync_delivery_status
AFTER UPDATE ON Orders
FOR EACH ROW
WHEN (NEW.Status = 'Delivered')
EXECUTE FUNCTION SyncDeliveryWithOrder();


CREATE INDEX idx_menuitems_category ON MenuItems(Category);

CREATE INDEX idx_restaurants_name ON Restaurants(Name);

CREATE INDEX idx_orders_status ON Orders(Status);

CREATE INDEX idx_delivery_person ON Delivery(DeliveryPersonID);


TRUNCATE TABLE 
  OrderDetails,
  Payments,
  Delivery,
  Orders,
  Reviews,
  MenuItems,
  Addresses,
  Users,
  Restaurants,
  DeliveryPerson,
  UserType
RESTART IDENTITY CASCADE;

-- 1. UserType
INSERT INTO UserType (TypeID, TypeName) VALUES
(1, 'Customer'),
(2, 'Admin'),
(3, 'DeliveryPerson');

-- 2. Users (Including DeliveryPersons)
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES
-- Customers
('Ravi Kumar', 'ravi@example.com', '9876543210', 1),
('Anita Sharma', 'anita@example.com', '9123456789', 1),
('Mohammed Ali', 'ali@example.com', '9988776655', 1),
('Sneha Reddy', 'sneha@example.com', '9112233445', 1),
('Amit Joshi', 'amit@example.com', '9001122334', 1),
('Pooja Nair', 'pooja@example.com', '8899001122', 1),
('Ravi Patel', 'ravi.patel@example.com', '9988776654', 1),
('Sanjay Verma', 'sanjay.verma@example.com', '9876543217', 1),
('Neha Gupta', 'neha.gupta@example.com', '9966332200', 1),
('Rajesh Singh', 'rajesh.singh@example.com', '9955221100', 1),
('Simran Kaur', 'simran.kaur@example.com', '9845223300', 1),

-- Admins
('Admin One', 'admin@example.com', '9999999999', 2),
('Admin Two', 'admin2@example.com', '9998887777', 2),

-- Delivery Persons (New Entries)
('Rajeev Yadav', 'rajeev@delivery.com', '8881234567', 3),
('Kiran Mehta', 'kiran@delivery.com', '7779876543', 3),
('Sonal Bhatia', 'sonal@delivery.com', '7765432109', 3),
('Deepak Verma', 'deepak@delivery.com', '7654321987', 3),
('Vijay Mehta', 'vijay@delivery.com', '7755443322', 3),
('Sandeep Roy', 'sandeep@delivery.com', '7744332211', 3);

-- 3. DeliveryPerson (Now Populated)
INSERT INTO DeliveryPerson (DeliveryPersonID, Name, Phone, VehicleType) VALUES
(1, 'Rajeev Yadav', '8881234567', 'Bike'),
(2, 'Kiran Mehta', '7779876543', 'Car'),
(3, 'Sonal Bhatia', '7765432109', 'Bike'),
(4, 'Deepak Verma', '7654321987', 'Car'),
(5, 'Vijay Mehta', '7755443322', 'Scooter'),
(6, 'Sandeep Roy', '7744332211', 'Scooter');

-- 4. Addresses
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES
(1, 'MG Road', 'Mumbai', '400001'),
(2, 'BTM Layout', 'Bangalore', '560076'),
(3, 'Juhu Beach Road', 'Mumbai', '400049'),
(4, 'Koramangala', 'Bangalore', '560034'),
(5, 'Rajajinagar', 'Bangalore', '560010'),
(6, 'Sector 15', 'Noida', '201301'),
(7, 'MG Road', 'Chennai', '600001'),
(8, 'Churchgate', 'Mumbai', '400020'),
(9, 'Alambagh', 'Lucknow', '226005'),
(10, 'Indira Nagar', 'Lucknow', '226016');

-- 5. Restaurants
INSERT INTO Restaurants (RestaurantID, Name, Location, Contact, Rating) VALUES
(1, 'Spicy Treat', 'Delhi', '9999988888', 4.5),
(2, 'Tandoori Nights', 'Mumbai', '9999977777', 4.2),
(3, 'South Masala', 'Chennai', '9999966666', 4.6),
(4, 'Mamma Mia', 'Kolkata', '8888777777', 4.8),
(5, 'The Royal Feast', 'Pune', '7777666666', 4.4),
(6, 'Ocean Grill', 'Goa', '6666555555', 4.7),
(7, 'Pasta Bella', 'Hyderabad', '5555444444', 4.2),
(8, 'Cafe Delight', 'Kochi', '4444333333', 4.3);

-- 6. MenuItems
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES
(1, 'Paneer Butter Masala', 220, 'North Indian', TRUE),
(1, 'Garlic Naan', 40, 'North Indian', TRUE),
(2, 'Chicken Biryani', 250, 'Mughlai', TRUE),
(2, 'Roti', 20, 'Indian', TRUE),
(3, 'Dosa', 80, 'South Indian', TRUE),
(3, 'Sambar Rice', 90, 'South Indian', TRUE),
(1, 'Chole Bhature', 120, 'North Indian', TRUE),
(2, 'Butter Chicken', 270, 'Mughlai', TRUE),
(3, 'Rasam', 60, 'South Indian', TRUE),
(4, 'Margherita Pizza', 350, 'Italian', TRUE),
(4, 'Penne Arrabbiata', 220, 'Italian', TRUE),
(5, 'Butter Garlic Lobster', 550, 'Seafood', TRUE),
(5, 'Chicken Tikka Masala', 280, 'Indian', TRUE),
(6, 'Goan Fish Curry', 350, 'Seafood', TRUE),
(6, 'Prawn Masala', 400, 'Seafood', TRUE),
(7, 'Vegetable Lasagna', 280, 'Italian', TRUE),
(7, 'Spaghetti Bolognese', 300, 'Italian', TRUE),
(8, 'Chicken Caesar Salad', 220, 'Salad', TRUE),
(8, 'Veg Sandwich', 150, 'Snack', TRUE);

-- 7. Orders
INSERT INTO Orders (OrderID, UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES
(1, 1, 1, '2025-04-22', 'Preparing', 300, 1),
(2, 2, 2, '2025-04-22', 'Delivered', 290, 2),
(3, 3, 4, '2025-04-23', 'Delivered', 570, 3),
(4, 4, 5, '2025-04-23', 'Delivered', 480, 4),
(5, 5, 6, '2025-04-23', 'Preparing', 700, 5),
(6, 6, 7, '2025-04-23', 'Preparing', 580, 6),
(7, 7, 8, '2025-04-23', 'Delivered', 370, 7);

-- 8. OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ItemID, Quantity, Subtotal) VALUES
(1, 1, 1, 1, 220),
(2, 1, 2, 2, 80),
(3, 2, 3, 1, 250),
(4, 2, 4, 2, 40),
(5, 3, 5, 1, 350),
(6, 3, 6, 1, 220),
(7, 4, 7, 1, 280),
(8, 4, 8, 1, 200),
(9, 5, 9, 2, 700),
(10, 6, 10, 3, 450),
(11, 7, 11, 1, 220),
(12, 7, 12, 1, 150);

-- 9. Payments
INSERT INTO Payments (PaymentID, OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES
(1, 1, 1, 300, 'UPI', 'Success', 'TXN12345', '2025-04-22 10:30:00'),
(2, 2, 2, 290, 'Card', 'Success', 'TXN12346', '2025-04-22 11:00:00'),
(3, 3, 3, 570, 'Cash', 'Success', 'TXN12347', '2025-04-23 13:00:00'),
(4, 4, 4, 480, 'UPI', 'Success', 'TXN12348', '2025-04-23 13:30:00'),
(5, 5, 5, 700, 'Card', 'Pending', 'TXN12349', '2025-04-23 14:00:00'),
(6, 6, 6, 580, 'UPI', 'Success', 'TXN12350', '2025-04-23 14:30:00'),
(7, 7, 7, 370, 'Cash', 'Success', 'TXN12351', '2025-04-23 15:00:00');

-- 10. Delivery (Updated DeliveryPersonID values)
INSERT INTO Delivery (DeliveryID, OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES
(1, 1, 1, '2025-04-22 11:15:00', 'On the Way', 30),
(2, 2, 2, '2025-04-22 10:45:00', 'Delivered', 25),
(3, 3, 3, '2025-04-23 14:15:00', 'On the Way', 35),
(4, 4, 4, '2025-04-23 14:45:00', 'Delivered', 40),
(5, 5, 5, '2025-04-23 15:00:00', 'Assigned', 30),
(6, 6, 6, '2025-04-23 15:30:00', 'On the Way', 25),
(7, 7, 6, '2025-04-23 16:00:00', 'Delivered', 20); -- Replaced DeliveryPersonID=7 with 6


-- 11. Review
INSERT INTO Reviews (ReviewID, UserID, RestaurantID, Rating, Comment, Date, Reply) VALUES
(1, 1, 1, 5, 'Delicious food!', '2025-04-22', 'Thank you!'),
(2, 2, 2, 4, 'Nice taste, will order again.', '2025-04-22', 'Glad you liked it!'),
(3, 3, 4, 5, 'Amazing pizza! Loved the crust.', '2025-04-23', 'Thanks for the feedback!'),
(4, 4, 5, 4, 'Delicious but a bit too spicy.', '2025-04-23', 'Glad you enjoyed!'),
(5, 5, 6, 5, 'Seafood was fresh and tasty.', '2025-04-23', 'Thank you for your review!'),
(6, 6, 7, 4, 'Good but can improve the taste.', '2025-04-23', 'We are working on it!'),
(7, 7, 8, 5, 'Best sandwich I had in a while.', '2025-04-23', 'Thank you!');


SELECT * FROM RestaurantMenus;

SELECT * FROM CustomerOrders;

SELECT * FROM DeliveryStatusView;

SELECT * FROM PendingDeliveries;

SELECT * FROM UserOrderSummary;



SELECT * FROM GetRestaurantMenu('South Masala');

SELECT * FROM GetRestaurantsByCuisine('Italian');

SELECT AddMenuItem(1, 'Cheese Pizza', 12.99, 'Pizza', TRUE);

SELECT * FROM Getdeliverystatus(6);

SELECT * FROM GetRestaurantMenu('Tandoori Nights');

SELECT AddMenuItem(1, 'Paneer Biryani', 220.00, 'Indian', TRUE);

SELECT * FROM GetDeliveryStatus(5);

SELECT * FROM RestaurantMenus WHERE RestaurantName = 'Spicy Treat';

ALTER TABLE Payments 
DROP COLUMN PaymentID;

ALTER TABLE Payments 
ADD COLUMN PaymentID SERIAL PRIMARY KEY;

select * from payments;

call RecordPayment(2, 4, 450.00, 'UPI', 'Success', 'TXN839283');



