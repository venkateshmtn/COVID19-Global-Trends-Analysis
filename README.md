# 📊 COVID-19 Global Intelligence Dashboard
**Strategic Data Analysis & Predictive Pandemic Modeling**

## 🎯 Executive Summary
This project transforms raw global healthcare data into an interactive decision-support tool. It addresses the challenge of monitoring disparate pandemic metrics across 200+ regions, providing a unified view of recovery rates, vaccination efficacy, and regional mortality trends. 

The solution focuses on **automated ETL workflows** and **advanced DAX modeling** to ensure data accuracy and report performance.

---

## 🚀 Key Business Insights
* **Vaccination Impact:** Correlation analysis between booster rollouts and the stabilization of infection rates.
* **Risk Hotspots:** Automated identification of regions with a >15% week-over-week increase in active cases.
* **Healthcare Infrastructure:** Comparative study of recovery durations across different global economic zones.

---

## 🛠️ Technical Deep-Dive
### 1. Data Architecture & Modeling
* **Schema:** Implemented a **Star Schema** with a centralized Fact table and dedicated Dimension tables (Date, Geography, and Metrics) to optimize filter context.
* **Time Intelligence:** Developed a custom Date Table to support Year-over-Year (YoY) and Month-to-Date (MTD) comparisons.

### 2. Advanced DAX (Data Analysis Expressions)
* **Rolling Averages:** Created 7-day and 14-day moving averages to smooth out reporting lags.
* **Dynamic Measures:** Built "Switch" measures allowing users to toggle the entire dashboard between 'Total Cases', 'Total Deaths', and 'Vaccination Rates' using a single slicer.
* **Fatality Rate Logic:** ```dax
  Case Fatality Rate = 
  DIVIDE(
      SUM('Fact_COVID'[Total_Deaths]), 
      SUM('Fact_COVID'[Total_Cases]), 
      0
  )
