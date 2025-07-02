INSERT INTO UserType (TypeName) VALUES ('Customer');
INSERT INTO UserType (TypeName) VALUES ('Admin');
INSERT INTO UserType (TypeName) VALUES ('DeliveryPerson');
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Norma Fisher', 'ysullivan@yahoo.com', '5938242194', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Nicholas Nolan', 'wcastro@yahoo.com', '9387784080', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Samantha Cook', 'leeashley@gmail.com', '8711587148', 1);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Thomas Harris', 'zdavis@yahoo.com', '9342320947', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Tammy Kirby', 'aimee33@hotmail.com', '9477515917', 3);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Nicholas Wilson', 'laura56@garcia.com', '9891013991', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Audrey Jacobs', 'jennifermendoza@owen.biz', '4131456208', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('William Gonzalez', 'kmassey@gmail.com', '0225841972', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Shelly Lowery', 'qmonroe@gmail.com', '7150842375', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Stephanie Nash', 'paul61@wheeler.com', '3376960696', 2);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('Michael Griffin', 'hensontroy@yahoo.com', '0638120665', 3);
INSERT INTO Users (Name, Email, Phone, TypeID) VALUES ('April Carson', 'davidbanks@ramirez-good.com', '6104714285', 1);
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES (9, '34855 Meghan Squares, Josephmouth, NE 49318', 'East Nicholas', '38647');
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES (3, '5551 Chan Camp, West Frankshire, MN 52247', 'West Danny', '96251');
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES (5, '2814 Houston Hills, Rodriguezside, NJ 62629', 'Marymouth', '16796');
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES (3, '0452 Courtney Lane Apt. 113, North Paul, MO 73439', 'Shanefort', '77163');
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES (2, '1534 Ryan Knolls, North Lynntown, NC 59694', 'North Tyler', '34118');
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES (10, '92137 Ward Views, North Vanessa, FL 74413', 'Littlechester', '68819');
INSERT INTO Addresses (UserID, Address, City, ZipCode) VALUES (5, '7389 Alec Squares Suite 508, Port Jonathan, FL 50177', 'Jenniferfort', '09198');
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Black Inc', '40752 Misty Mount, Williamhaven, AZ 75719', '8916348967', 5.0);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Sandoval Inc', '945 Trevor Greens Suite 666, East Danielleberg, LA 96111', '0076279125', 3.9);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Garcia and Sons', '518 Lee Tunnel, Rodriguezton, UT 61736', '1942641830', 3.2);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Clarke-Jones', '4089 Jerry Trail, Hunterville, NE 74689', '1161162076', 4.8);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('King, Gomez and Martinez', '2035 Candace Divide Apt. 031, West Miketown, IN 19098', '7175420355', 4.4);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Murphy, Watkins and Miller', '62235 Joel Ferry Suite 560, New Andrew, UT 10096', '6486296451', 3.6);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Ortiz-Butler', '3547 Stephanie Underpass Apt. 418, Port Jacqueline, HI 55774', '2375825717', 4.8);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Murray, Robinson and Wilson', 'Unit 4892 Box 6717, DPO AE 71770', '4014004689', 4.8);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Savage-Chambers', '14485 Alyssa Gateway, North Robert, LA 68636', '9838168644', 4.2);
INSERT INTO Restaurants (Name, Location, Contact, Rating) VALUES ('Terry Group', '84576 Thomas Square Suite 707, Douglasfort, RI 28775', '5760811605', 3.7);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (1, 'East', 313.03, 'Combo', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (1, 'Today', 224.06, 'Main Course', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (1, 'Treatment', 288.86, 'Main Course', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (2, 'Man', 344.35, 'Dessert', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (2, 'Imagine', 277.08, 'Combo', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (2, 'Low', 124.91, 'Combo', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (3, 'Something', 436.04, 'Main Course', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (3, 'Cut', 431.23, 'Beverage', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (3, 'Lose', 392.11, 'Main Course', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (4, 'Wide', 188.68, 'Dessert', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (4, 'Treat', 136.49, 'Beverage', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (4, 'Garden', 143.62, 'Combo', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (5, 'Write', 318.98, 'Combo', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (5, 'Unit', 485.54, 'Combo', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (5, 'On', 278.0, 'Combo', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (6, 'Public', 196.84, 'Dessert', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (6, 'Newspaper', 428.59, 'Main Course', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (6, 'Article', 290.61, 'Main Course', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (7, 'Then', 469.35, 'Main Course', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (7, 'Say', 435.15, 'Combo', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (7, 'List', 308.72, 'Dessert', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (8, 'Skin', 335.92, 'Starter', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (8, 'Entire', 280.23, 'Beverage', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (8, 'Health', 229.73, 'Main Course', False);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (9, 'Production', 234.11, 'Dessert', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (9, 'Certainly', 106.48, 'Beverage', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (9, 'Close', 382.13, 'Beverage', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (10, 'About', 426.37, 'Main Course', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (10, 'Expect', 442.13, 'Dessert', True);
INSERT INTO MenuItems (RestaurantID, Name, Price, Category, Availability) VALUES (10, 'Tv', 426.85, 'Combo', True);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (12, 2, '2024-07-20 18:11:04', 'Delivered', 368.46, 7);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (3, 1, '2024-10-09 06:39:28', 'Cancelled', 573.7, 5);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (6, 9, '2024-09-22 00:03:03', 'Delivered', 293.77, 4);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (3, 9, '2024-12-07 12:09:59', 'Cancelled', 209.95, 6);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (12, 7, '2024-12-16 22:11:21', 'Cancelled', 264.58, 5);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (2, 5, '2024-12-05 08:14:57', 'Cancelled', 326.15, 5);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (11, 7, '2025-01-13 00:03:55', 'Delivered', 202.71, 1);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (11, 2, '2025-04-05 17:06:08', 'Pending', 419.77, 4);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (9, 6, '2024-09-13 21:52:47', 'Delivered', 950.75, 7);
INSERT INTO Orders (UserID, RestaurantID, OrderDate, Status, TotalAmount, AddressID) VALUES (1, 3, '2025-03-14 21:25:29', 'Pending', 417.1, 3);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (1, 30, 1, 317.69);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (1, 20, 1, 434.36);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (2, 23, 4, 718.96);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (2, 12, 4, 1741.32);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (3, 1, 4, 1490.04);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (3, 29, 5, 2249.6);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (4, 11, 1, 317.73);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (4, 5, 2, 809.74);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (5, 23, 3, 492.09);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (5, 8, 4, 1005.84);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (6, 30, 5, 1707.95);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (6, 1, 1, 297.83);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (6, 10, 4, 479.76);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (7, 27, 5, 1724.1);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (7, 7, 1, 343.34);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (8, 28, 3, 460.11);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (8, 17, 3, 438.12);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (9, 28, 5, 1810.7);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (9, 23, 4, 1424.24);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (10, 23, 1, 235.3);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (10, 20, 1, 116.48);
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES (10, 6, 2, 985.54);
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (1, 12, 368.46, 'UPI', 'Pending', '49b564fb-92a6-41d7-8069-c54224039721', '2024-10-03 00:20:17');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (2, 3, 573.7, 'Card', 'Failed', '62565a95-5487-45c3-b762-6f4975fd3537', '2024-12-13 14:54:42');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (3, 6, 293.77, 'Net Banking', 'Failed', '3239d04b-cbab-4b51-b85c-5fdcbad3116b', '2025-03-11 14:21:46');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (4, 3, 209.95, 'Cash', 'Completed', '636abf8c-e7e3-452c-8cbf-404db5c25d42', '2024-12-13 23:15:32');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (5, 12, 264.58, 'Cash', 'Pending', 'b475e15e-162d-4c72-9ccd-3e1f4c2abdaa', '2025-03-26 08:50:06');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (6, 2, 326.15, 'Cash', 'Pending', 'b440ffe0-4137-40e2-bd7d-e1f57460d20d', '2025-03-07 16:57:01');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (7, 11, 202.71, 'Card', 'Completed', '6581f934-9bcf-41c4-b87e-356038dfe76b', '2025-02-24 21:52:25');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (8, 11, 419.77, 'Card', 'Completed', '85a1282a-0761-485b-8168-705a533c9a31', '2025-04-06 18:56:21');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (9, 9, 950.75, 'Net Banking', 'Failed', '864696c1-deb4-46c4-b5a7-c6ed14827a89', '2025-01-26 04:28:38');
INSERT INTO Payments (OrderID, UserID, Amount, PaymentMethod, Status, TransactionID, Timestamp) VALUES (10, 1, 417.1, 'Net Banking', 'Completed', 'baa172ac-ac33-4644-8053-b188339d78f5', '2025-04-19 14:27:50');
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (1, 1, '2025-04-24 06:44:52', 'Delivered', 38.06);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (2, 3, '2025-04-24 23:08:56', 'Assigned', 77.99);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (3, 2, '2025-04-24 13:56:34', 'In Transit', 70.26);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (4, 3, '2025-04-24 16:06:36', 'In Transit', 60.4);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (5, 2, '2025-04-24 19:46:47', 'Delivered', 54.05);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (6, 3, '2025-04-24 14:45:17', 'Delivered', 78.71);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (7, 2, '2025-04-25 08:06:22', 'Delivered', 78.71);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (8, 1, '2025-04-24 12:54:48', 'Assigned', 22.44);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (9, 1, '2025-04-24 12:44:33', 'Assigned', 42.53);
INSERT INTO Delivery (OrderID, DeliveryPersonID, EstimatedTime, Status, DeliveryFee) VALUES (10, 2, '2025-04-24 21:00:36', 'Delivered', 27.78);
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, Date, Reply) VALUES (3, 1, 2, 'Possible reach challenge value challenge firm.', '2024-12-29 09:25:50', 'Know smile home southern.');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, Date, Reply) VALUES (3, 9, 3, 'That hair sea quality.', '2025-01-21 18:19:26', NULL);
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, Date, Reply) VALUES (12, 7, 2, 'In approach recent program possible natural.', '2025-03-10 12:57:05', NULL);
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, Date, Reply) VALUES (2, 5, 1, 'Entire analysis clear about pressure cell.', '2025-02-26 09:41:00', NULL);
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, Date, Reply) VALUES (11, 7, 4, 'Fund bill third some follow.', '2025-04-11 11:59:16', NULL);
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, Date, Reply) VALUES (1, 3, 4, 'Might his lot the drive.', '2025-03-29 17:43:28', 'Authority leave right answer speak without leave.');











INSERT INTO UserType (TypeName) VALUES 
('Customer'), 
('Admin'), 
('DeliveryPerson');

INSERT INTO Users (Name, Email, Phone, TypeID) VALUES
-- Customers
('Ravi Kumar', 'ravi@example.com', '9876543210', 1),
('Anita Sharma', 'anita@example.com', '9123456789', 1),
('Mohammed Ali', 'ali@example.com', '9988776655', 1),
('Sneha Reddy', 'sneha@example.com', '9112233445', 1),
('Amit Joshi', 'amit@example.com', '9001122334', 1),
('Pooja Nair', 'pooja@example.com', '8899001122', 1),

-- Admin
('Admin One', 'admin@example.com', '9999999999', 2),

-- Delivery Persons
('Rajeev Yadav', 'rajeev@delivery.com', '8881234567', 3),
('Kiran Mehta', 'kiran@delivery.com', '7779876543', 3),
('Sonal Bhatia', 'sonal@delivery.com', '7765432109', 3),
('Deepak Verma', 'deepak@delivery.com', '7654321987', 3);



CREATE TABLE Delivery (
  DeliveryID SERIAL PRIMARY KEY,
  OrderID INT REFERENCES Orders(OrderID),
  DeliveryPersonID INT REFERENCES Users(UserID), -- Must have TypeID = 3 (DeliveryPerson)
  EstimatedTime TIME,
  Status VARCHAR(50),
  DeliveryFee DECIMAL(6,2)
);

-- UserType Table
CREATE TABLE UserType (
  TypeID SERIAL PRIMARY KEY,
  TypeName VARCHAR(50) UNIQUE -- 'Customer', 'Admin', 'DeliveryPerson'
);

-- Users Table
CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    TypeID INT REFERENCES UserType(TypeID) ON DELETE SET NULL
);

-- Addresses Table
CREATE TABLE Addresses (
    AddressID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    Address TEXT NOT NULL,
    City VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL
);

-- Restaurants Table
CREATE TABLE Restaurants (
    RestaurantID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location TEXT NOT NULL,
    Contact VARCHAR(15) UNIQUE NOT NULL,
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 0 AND 5) DEFAULT 0
);

-- MenuItems Table
CREATE TABLE MenuItems (
    ItemID SERIAL PRIMARY KEY,
    RestaurantID INT REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Category VARCHAR(50) NOT NULL,
    Availability BOOLEAN DEFAULT TRUE
);

-- Orders Table
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    RestaurantID INT REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE,
    OrderDate TIMESTAMP DEFAULT NOW(),
    Status VARCHAR(20) DEFAULT 'Pending',
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0),
    AddressID INT REFERENCES Addresses(AddressID) ON DELETE SET NULL
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID) ON DELETE CASCADE,
    ItemID INT REFERENCES MenuItems(ItemID) ON DELETE CASCADE,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Subtotal DECIMAL(10,2) CHECK (Subtotal >= 0)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID) ON DELETE CASCADE,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    PaymentMethod VARCHAR(50) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    TransactionID VARCHAR(50) UNIQUE NOT NULL,
    Timestamp TIMESTAMP DEFAULT NOW()
);

-- DeliveryPerson Table
CREATE TABLE DeliveryPerson (
    DeliveryPersonID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    VehicleType VARCHAR(50) NOT NULL
);

-- Delivery Table
CREATE TABLE Delivery (
    DeliveryID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID) ON DELETE CASCADE,
    DeliveryPersonID INT REFERENCES DeliveryPerson(DeliveryPersonID) ON DELETE SET NULL,
    EstimatedTime TIMESTAMP,
    Status VARCHAR(20) DEFAULT 'Assigned',
    DeliveryFee DECIMAL(10,2) CHECK (DeliveryFee >= 0)
);

-- Review Table
CREATE TABLE Reviews(
    ReviewID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    RestaurantID INT REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    Date TIMESTAMP DEFAULT NOW(),
    Reply TEXT
);

