# EV Charging Station Usage and Grid Load SQL Analysis

## 1. Project Overview
A comprehensive SQL data analysis project designed to explore electric vehicle (EV) charging behavior, infrastructure performance, and grid load dynamics across multiple city zones. This project provides actionable insights into energy consumption, peak load risks, and station efficiencies.

## 2. Short Description / Purpose
The EV Charging Analytics Project is a structured SQL-based case study built to examine 2,800 charging session records. It focuses on evaluating zone-level vehicle volumes, station type efficiencies, and electrical grid load stress factors. This tool is intended for use by data analysts, energy strategists, and urban infrastructure planners seeking to optimize EV charging networks and manage power grid stability.

## 3. Tech Stack
The project was built using the following tools and technologies:
*  **Relational Database (MySQL):** Used for database creation, table schema setup, and raw data storage.
*  **SQL Data Cleaning:** Implemented conditional deletion logic to remove anomalous session records and ensure data integrity.
*  **Aggregations & Grouping:** Utilized `GROUP BY`, `SUM`, `AVG`, and `ROUND` to calculate metrics across categories.
*  **Subqueries & Filtering:** Employed nested subqueries to evaluate performance against overall baseline averages without relying on complex window functions.

## 4. Data Source
More info on where the data comes from and how it's structured:
* **Source:** Kaggle (EV Charging Station Usage and Grid Load Analysis Dataset)[cite: 1].
* **Structure:** Contains 2,800 records and 10 columns covering timestamps, city zones (*Central, South, West, North, East*), station types (*Supercharger, Fast, Normal*), vehicles charged, energy dispensed (kWh), grid load (MW), renewable energy percentages, and peak load risk categories (*Low, Medium, High*).

## 5. Features / Highlights
The project follows a rigorous data analysis framework:

* **Business Problem**
  Rapid EV adoption puts immense strain on urban power grids. City planners and operators lack clear visibility into which zones and station types drive peak load risks and energy consumption spikes.

* **Goal of the Analysis**
  To use fundamental SQL queries (`JOIN`s, aggregations, subqueries) to clean data, identify high-risk overload zones, evaluate station energy output, and highlight infrastructure inefficiencies.

* **Walkthrough of Key Queries**
  * *Data Validation & Hygiene:* Scanned for `NULL` values across all columns and filtered out erroneous negative or zero-duration sessions.
  * *Volume Breakdown:* Grouped sessions by city zone to rank top regions by total cumulative vehicles charged.
  * *Grid Load Benchmarking:* Used subqueries to isolate sessions where grid load exceeded the overall city-wide average.
  * *Risk Identification:* Aggregated high-risk peak load sessions to pinpoint exact zones contributing maximum strain to the electrical grid.

* **Business Impact & Insights**
  * Pinpointed the specific city zones contributing the highest cumulative grid load during high-risk overload windows.
  * Evaluated station type efficiencies, demonstrating how superchargers vs. normal chargers scale energy distribution.
  * Delivered a clean, reproducible SQL script optimized for technical recruiters and internship portfolio reviews.
