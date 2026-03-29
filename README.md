# 🌍 End-to-End COVID-19 Data Analysis & Strategic Dashboard (SQL + Power BI)

## 📌 Project Overview
This project presents a complete end-to-end data analytics solution combining advanced SQL data processing with an interactive Power BI dashboard to analyze global COVID-19 trends.

It demonstrates how raw data can be transformed into actionable insights and executive-ready dashboards, covering:
- Infection trends
- Mortality rates
- Vaccination progress

This project reflects a real-world analytics workflow:
Data Extraction → Transformation → Analysis → Visualization

---

## 🧠 Project Architecture

Step 1: SQL Data Processing
- Data cleaning and transformation
- Advanced querying
- Creation of reusable database objects

Step 2: Power BI Visualization
- Interactive dashboard development
- KPI tracking
- Data storytelling

---

## 🛠️ SQL Analysis (Backend)

### Key Techniques Used
- Window Functions
  - LAG() for growth rate analysis
  - DENSE_RANK() for peak infection ranking

- Data Cleaning
  - CAST, TRY_CAST for type conversion
  - NULLIF to prevent division errors

- CTEs & Temporary Tables
  - Structured multi-step queries
  - Temporary storage (#PercentPopulationVaccinated)

- Database Objects
  - Stored Procedure for dynamic reporting
  - View for Power BI integration

---

## 🔍 SQL Analysis Highlights

### Death Percentage Calculation
(CAST(total_deaths AS FLOAT) / NULLIF(CAST(total_cases AS FLOAT), 0)) * 100.0

### Growth Rate Analysis
Tracks daily increase in cases using LAG() function.

### Peak Infection Days
Identifies top 3 highest infection days per country using DENSE_RANK().

### Vaccination Tracking
- Rolling total of vaccinations per location
- Stored in:
  - Temporary Table (#PercentPopulationVaccinated)
  - View for dashboard usage

### Stored Procedure
EXEC GetCountryCovidStats @LocationName = 'India';

---

## 📊 Power BI Dashboard (Frontend)

### Key Features
- Dynamic filtering by continent and country
- Time-series analysis of cases and deaths
- Interactive visuals and drill-down capability

### Executive KPIs
- Total Cases
- Total Deaths
- Total Vaccinations

### Visual Components
- Line charts for trends
- Bar charts for regional comparisons

---

## 🧮 DAX Measures
- Mortality Rate (%)
- Vaccination Percentage (%)
- Trend-based calculations

---

## ⚡ Performance Optimization
- Efficient data modeling
- Optimized visuals
- Smooth interaction with large datasets

---

## 🔄 Data Flow

Raw Data  
↓  
SQL Data Cleaning & Transformation  
↓  
Views / Stored Procedures  
↓  
Power BI Dashboard  

---

## 📂 Dataset Structure

### CovidDeaths
- Total cases
- Total deaths
- Population

### CovidVaccinations
- Vaccination data
- Booster data

---

## 🚀 How to Run This Project

### SQL Setup
1. Import datasets into:
   - CovidDeaths
   - CovidVaccinations
2. Run SQL scripts to create:
   - Views
   - Stored Procedures

### Power BI Setup
3. Open the .pbix file in Power BI Desktop
4. Connect to SQL dataset (or use provided data)
5. Interact with dashboard

---

## 📈 Business Value

- Converts raw data into actionable insights
- Demonstrates end-to-end analytics workflow
- Builds executive-level dashboards
- Supports data-driven decision making

---

## 💡 Skills Demonstrated

- Advanced SQL
- Data Cleaning & Transformation
- Power BI Development
- DAX Calculations
- Data Modeling
- Data Visualization
- Performance Optimization

---

## 🔗 Future Enhancements

- Real-time data pipeline
- Forecasting models
- Drill-through dashboards
- Cloud integration (Azure / AWS)

---

## ⭐ Why This Project Stands Out

- End-to-end project (SQL → Power BI)
- Business-focused insights
- Strong combination of backend + frontend skills
- Real-world use case implementation
