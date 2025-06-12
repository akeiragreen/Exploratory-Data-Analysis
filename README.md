# 📉 SQL Exploratory Data Analysis: Global Layoffs (2020–2023)

## 🧾 Project Overview
This SQL project performs an in-depth exploratory data analysis (EDA) on a dataset of global company layoffs from 2020 to 2023. The goal is to uncover patterns, identify high-impact companies and countries, analyze layoff trends over time, and extract meaningful business insights from the data.

---

## 📂 Dataset Description
The analysis is based on a cleaned staging table: `layoffs_stagging2`. Key columns include:

- `company`: Name of the company performing the layoffs
- `location`: Geographic location of the company
- `industry`: Industry classification
- `total_laid_off`: Number of employees laid off
- `percentage_laid_off`: Proportion of the company laid off
- `date`: Date of the layoff
- `stage`: Business stage of the company (e.g., Series A, Public)
- `country`: Country where the company operates
- `funds_raised_millions`: Total capital raised by the company (in millions)

---

## ❓ Business Questions Addressed
- Which companies had the highest total layoffs?
- What were the maximum layoffs recorded in a single day?
- Which companies shut down entirely?
- Which countries and industries were most impacted?
- What is the monthly and yearly trend of layoffs?
- When did the layoffs begin and end?
- What percentage of each company’s workforce was laid off on average?
- Who were the top 5 companies with the most layoffs each year?

---

## 📈 Insights Summary

- **Severe Workforce Cuts**: Some companies laid off as many as 12,000 employees in one event.
- **Business Closures**: Several companies laid off 100% of staff despite high funding levels, showing fragility in high-burn startups.
- **Top Layoff Companies**: Amazon and Google led in total layoffs, reflecting major restructuring in Big Tech.
- **US Market Hit Hardest**: The U.S. accounted for over 200,000 layoffs—far more than any other country.
- **Industries Most Affected**: Consumer tech and retail were the most disrupted sectors.
- **Layoff Peaks**: January 2023 and November 2022 had the highest single-day layoffs.
- **Yearly Trends**: 2022 saw the most layoffs overall; 2021 was the most stable year.
- **Recurring Risk Signals**: Companies appearing in top 5 layoffs across multiple years show persistent instability.
- **Layoff Timing**: Restructuring events often cluster at the start of the year, especially in Q1.

---

## 🛠️ Tools Used
- **SQL**: MySQL Workbench
- **Functions**: `GROUP BY`, `SUM()`, `AVG()`, `MAX()`, `MIN()`, `DENSE_RANK()`, `CTEs`, `Window Functions`
- **Data Prep**: Cleaned and staged data from original table to `layoffs_stagging2`

---

## 💼 Business Implications
- **HR and Workforce Strategy**: Insights can support talent retention planning and proactive risk assessment of partner companies.
- **Market Forecasting**: Identifying trends in layoffs across industries and countries helps forecast future downturns or growth rebounds.
- **Investor Due Diligence**: High layoff ratios and closures signal potential instability, especially in startups with high capital burn.
- **Policy & Timing**: Knowing layoff timing helps HR and compliance teams prepare for workforce changes during typical Q1 restructurings.

---

## 👤 Author & Contact
**Author**: *Akeira Green 
**LinkedIn**: www.linkedin.com/in/akeira-green

---

## ✅ Project Status
✅ Complete — Dataset cleaned and fully analyzed using SQL. Ready for use in dashboards (e.g., Tableau, Power BI) or further predictive modeling.
