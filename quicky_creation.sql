-- UserType Table
CREATE TABLE UserType (
    TypeID SERIAL PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL UNIQUE
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
CREATE TABLE Review (
    ReviewID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    RestaurantID INT REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    Date TIMESTAMP DEFAULT NOW(),
    Reply TEXT
);
