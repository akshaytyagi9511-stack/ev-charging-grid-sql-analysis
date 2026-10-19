USE project;

#Create the main table schema for EV charging records
CREATE TABLE ev (
    record_id INT PRIMARY KEY,
    date_time TIMESTAMP,
    city_zone VARCHAR(50),
    station_type VARCHAR(50),
    vehicles_charged INT,
    avg_charging_duration_minutes DECIMAL(10, 2),
    energy_dispensed_kwh DECIMAL(10, 2),
    grid_load_mw DECIMAL(10, 2),
    renewable_energy_used_percent DECIMAL(5, 2),
    peak_load_risk VARCHAR(20)
);



# DATA EXPLORATION & VALIDATION


# total row count 
SELECT COUNT(*) FROM ev;

#Preview the first 20 records
SELECT * FROM ev 
LIMIT 20;

#Check for any missing (NULL) values 
SELECT * FROM ev
 WHERE record_id IS NULL
 OR 
 city_zone IS NULL
 OR 
 date_time IS NULL
 OR 
 station_type IS NULL
 OR 
 vehicles_charged IS NULL
 OR 
 avg_charging_duration_minutes IS NULL
 OR
 energy_dispensed_kwh IS NULL 
 OR 
 grid_load_mw IS NULL
 OR 
renewable_energy_used_percent IS NULL
 OR 
 peak_load_risk IS NULL;
 
 

#DIFFERENT TYPES OF STATIONS
SELECT DISTINCT station_type FROM ev;



#DIFFERENT CITY ZONES
SELECT DISTINCT city_zone FROM ev;



#Count records by peak load risk
SELECT peak_load_risk, COUNT(*) AS risk_count
 FROM ev 
 GROUP BY peak_load_risk;
 
 


#STEP 3: DATA CLEANING


# REMOVAL OF UNWANTED/WRONG RECORDES
DELETE FROM ev 
 WHERE avg_charging_duration_minutes = 0 OR avg_charging_duration_minutes < 0;



# BUSINESS INSIGHTS & ANALYTICAL QUERIES


#Find the top 3 city zones with the highest total cumulative vehicles charged
SELECT city_zone, SUM(vehicles_charged) AS total_vehicles_charged
FROM ev 
GROUP BY city_zone
ORDER BY total_vehicles_charged DESC
LIMIT 3;



#Find all charging sessions where the grid load exceeds the overall average grid load (Subquery)
SELECT * FROM ev 
WHERE grid_load_mw > (SELECT AVG(grid_load_mw) FROM ev);



#Calculate average energy dispensed (in kWh) grouped by station type
SELECT station_type, AVG(energy_dispensed_kwh) AS avg_energy_dispensed
FROM ev
GROUP BY station_type
ORDER BY AVG(energy_dispensed_kwh) DESC;



#Calculate rounded average charging duration grouped by station type
SELECT station_type, ROUND(AVG(avg_charging_duration_minutes), 2) AS avg_duration_minutes
FROM ev
GROUP BY station_type
ORDER BY ROUND(AVG(avg_charging_duration_minutes), 2) ASC;



#Calculate average energy dispensed per city zone in ascending order
SELECT city_zone, AVG(energy_dispensed_kwh) AS avg_energy_dispensed
FROM ev
GROUP BY city_zone
ORDER BY AVG(energy_dispensed_kwh) ASC;



#Find the single city zone with the lowest average energy dispensed
SELECT city_zone, AVG(energy_dispensed_kwh) AS lowest_avg_energy
FROM ev
GROUP BY city_zone
ORDER BY AVG(energy_dispensed_kwh) ASC
LIMIT 1;

