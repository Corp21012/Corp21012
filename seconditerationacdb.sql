-- Aircraft Table: Contains information about each aircraft.
CREATE TABLE Aircraft (
    Aircraft_ID SERIAL PRIMARY KEY,
    Serial_Number VARCHAR(50),
    Model VARCHAR(50),
    Manufacturer VARCHAR(50),
    Year_Of_Manufacture INT CHECK (Year_Of_Manufacture <= EXTRACT(YEAR FROM CURRENT_TIMESTAMP)),
    Engine_Program VARCHAR(50),
    Airframe_Total_Time DECIMAL(12,2),
    Ask_Price DECIMAL(12,2),
    Take_Price DECIMAL(12,2),
    Engine1_Total_Time DECIMAL(12,2) NULL,
    Engine2_Total_Time DECIMAL(12,2) NULL,
    Engine3_Total_Time DECIMAL(12,2) NULL,
    Paint_Year INT NULL DEFAULT Year_Of_Manufacture,
    Interior_Year INT NULL DEFAULT Year_Of_Manufacture,
    PAX_Count INT,
    Domestic_WiFi VARCHAR(50),
    Satellite_WiFi VARCHAR(50),
    Broker_Dealer VARCHAR(50),
    Status VARCHAR(50) CHECK (Status IN ('For Sale', 'For Sale OMKT', 'Deal Pending OMKT', 'Deal Pending', 'For Lease', 'Not For Sale'))
);

-- Owners Table: Contains information about each owner.
CREATE TABLE Owners (
    Owner_ID SERIAL PRIMARY KEY,
    Owner_Name VARCHAR(50),
    Country VARCHAR(50)
);

-- Ownership Table: Links aircraft and owners.
CREATE TABLE Ownership (
    Aircraft_ID INT REFERENCES Aircraft(Aircraft_ID),
    Owner_ID INT REFERENCES Owners(Owner_ID),
    Purchase_Date DATE,
    Sale_Date DATE,
    PRIMARY KEY (Aircraft_ID, Owner_ID)
);

-- Equipment Table: Contains information about each piece of equipment.
CREATE TABLE Equipment (
    Equipment_ID SERIAL PRIMARY KEY,
    Equipment_Name VARCHAR(50),
    Equipment_Manufacturer VARCHAR(50),
    Equipment_Cost DECIMAL(12,2)
);

-- Aircraft_Equipment Table: Links aircraft and equipment.
CREATE TABLE Aircraft_Equipment (
    Aircraft_ID INT REFERENCES Aircraft(Aircraft_ID),
    Equipment_ID INT REFERENCES Equipment(Equipment_ID),
    Quantity INT CHECK (Quantity > 0),
    PRIMARY KEY (Aircraft_ID, Equipment_ID)
);
