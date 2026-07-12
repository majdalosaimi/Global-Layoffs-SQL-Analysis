# Global Layoffs Data Analysis using SQL

## 📌 Project Overview
This project showcases a complete data workflow using SQL, focusing on data cleaning and exploratory data analysis (EDA). The dataset contains information about global corporate layoffs (`layoffs.csv`). The objective is to transform raw, unstructured data into a clean, reliable format, and then query it to extract meaningful business insights regarding layoff trends across different industries, locations, and timeframes.

## 📂 Repository Structure
- `data/`: Contains the raw dataset (`layoffs.csv`).
- `sql_scripts/`: 
  - `1_data_cleaning.sql`: SQL queries used to clean and standardize the data.
  - `2_data_analysis.sql`: SQL queries used for data exploration and analysis.

## 🛠️ Phase 1: Data Cleaning
In this phase, the raw data was processed to ensure accuracy and consistency. The following data quality issues were addressed:
1. **Removing Duplicates:** Identified and removed duplicate records to prevent skewed analysis.
2. **Standardizing Data:** Formatted text fields, corrected spelling anomalies, and ensured consistent data types (e.g., standardizing industry names and date formats).
3. **Handling Null and Missing Values:** - Populated missing values where possible by referencing other rows with identical company data.
   - Replaced unresolvable empty fields with `'Unknown'` to maintain data integrity.
4. **Removing Unnecessary Columns:** Dropped columns and rows that provided no analytical value or lacked sufficient data for evaluation.

## 📊 Phase 2: Exploratory Data Analysis (EDA)
Following the data cleaning process, a retrospective analysis was conducted to uncover historical trends and extract actionable insights. Key areas explored in the `2_data_analysis.sql` script include:

* **Dataset Timeframe:** Queried the minimum and maximum dates to establish the exact chronological scope of the layoff events.
* **Macro-Level Impact:** Aggregated total layoffs by `industry` and `country` to identify which sectors and geographical regions were most severely affected.
* **Impact by Company Stage:** Analyzed layoff volumes grouped by company funding `stage` (e.g., Post-IPO, Series B) to understand where job instability was most concentrated.
* **Temporal Trends & Rolling Totals:** Tracked layoff trends on a yearly and monthly basis. Calculated a cumulative rolling total of layoffs over time using Common Table Expressions (CTEs) and Window Functions.
* **Top Layoffs by Year:** Developed an advanced query utilizing CTEs and the `DENSE_RANK()` window function to accurately isolate and rank the top 5 companies with the highest number of layoffs for each distinct year.

## 💻 Technologies Used
- **SQL** (Data Cleaning, Data Manipulation, Data Aggregation)
