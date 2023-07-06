CREATE TABLE airplanes (
  id INTEGER PRIMARY KEY,
  manufacturer VARCHAR(255),
  model VARCHAR(255),
  range_in_miles INTEGER,
  seating_capacity INTEGER
);

CREATE TABLE FLEET_DATA (
  id INTEGER PRIMARY KEY,
  airplane_id INTEGER,
  serial_number VARCHAR(255),
  date_of_manufacture DATE,
  current_owner VARCHAR(255),
  Ask_Price INTEGER,
  Net_Price INTEGER,
  Registration VARCHAR(255),
  Airframe_Total_Time INTEGER,
  Engine_program VARCHAR(255),
  Paint_Year INTEGER,
  Interior_Year INTEGER,
  Domestic_Wifi BOOLEAN,
  International_Wifi BOOLEAN,
  PAX INTEGER,
  Date_Listed DATE,
  Days_On_Market INTEGER
);

CREATE TABLE airplane_specs (
  id INTEGER PRIMARY KEY,
  airplane_id INTEGER,
  maximum_speed INTEGER,
  FOREIGN KEY (airplane_id) REFERENCES airplanes(id)
);

ALTER TABLE serial_numbers
ADD FOREIGN KEY (airplane_id) REFERENCES airplanes(id);

INSERT INTO airplanes (manufacturer, model)
VALUES ('Embraer', 'Legacy 500');

INSERT INTO airplanes (manufacturer, model)
VALUES ('Bombardier', 'Challenger 300');

INSERT INTO airplanes (manufacturer, model)
VALUES ('Bombardier', 'Challenger 350');

INSERT INTO airplanes (manufacturer, model)
VALUES ('Bombardier', 'Challenger 604');

INSERT INTO airplanes (manufacturer, model)
VALUES ('Beechcraft', '400A');

INSERT INTO airplanes (manufacturer, model)
VALUES ('Bombardier', 'Challenger 605');


