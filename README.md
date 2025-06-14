# 📉 SQL Exploratory Data Analysis: Global Layoffs (2020–2023)

> *From raw numbers to ripple effects — uncovering workforce instability and global economic signals through data.*

---

## 🧾 Project Overview

This SQL project performs an in-depth **Exploratory Data Analysis (EDA)** on global tech layoffs from **2020 to 2023**, turning rows of layoffs into strategic insights for HR, investors, and operations leaders.

Using **MySQL**, the project focuses on identifying layoff patterns across time, geography, industries, and funding stages — drawing out not just what happened, but *why it matters*.

---

## 📂 Dataset Description

The analysis was conducted using a cleaned and staged table: `layoffs_stagging2`.

**Key Columns:**
- `company`: Company name
- `location`: HQ city or region
- `industry`: Industry sector
- `total_laid_off`: Employees laid off
- `percentage_laid_off`: Workforce % affected
- `date`: Date of the layoff
- `stage`: Company growth stage (e.g., Seed, Series A, Public)
- `country`: Operating country
- `funds_raised_millions`: Total capital raised

---

## ❓ Business Questions Explored

- 🏢 **Which companies had the highest total layoffs?**
- 📆 **What were the peak single-day layoff events?**
- 🛑 **Which companies shut down entirely?**
- 🌍 **Which countries and industries were hit hardest?**
- 📊 **How did layoff trends shift month-to-month and year-to-year?**
- 💼 **Which companies repeatedly appeared in top 5 yearly layoffs?**
- 📉 **How much of a company’s workforce was laid off on average?**
- 🕒 **When did the layoff waves begin — and did they end?**

---

## 📈 Insight Highlights

> *From local decisions to global ripples — each row of data has consequences.*

- **12,000+ Employees** laid off in some single events.
- **100% Layoffs** in multiple VC-backed companies — shutdowns despite major funding.
- **Amazon & Google** led in total layoffs, signaling major structural shifts in Big Tech.
- **200,000+ U.S. Layoffs** — the U.S. saw the highest volume, dwarfing other countries.
- **Most Affected Industries**: Consumer Tech and Retail.
- **Layoff Peaks**: November 2022 and January 2023 saw historic surges.
- **2022 = Worst Year**, while **2021 remained stable** in comparison.
- **Recurring Companies** in top layoff lists showed persistent operational risk.
- **Layoffs Cluster in Q1** — suggesting annual budget resets and restructuring cycles.

---

## 🛠️ Tools & Techniques

- **SQL Platform**: MySQL Workbench
- **Techniques Used**:
  - `GROUP BY`, `SUM()`, `AVG()`, `MAX()`, `MIN()`
  - `DENSE_RANK()`, `ROW_NUMBER()`
  - **Window Functions** & **CTEs**
- **Data Prep**: Cleaned and transformed data from raw table to `layoffs_stagging2`

---

## 💼 Business Impact

> *Small patterns, big signals — strategic uses for business units:*

- **Talent Strategy**: Helps HR anticipate layoff trends and develop retention strategies.
- **Investor Due Diligence**: Layoff frequency and percentage can highlight risky startups.
- **Workforce Forecasting**: Identifies when and where economic slowdowns may ripple next.
- **Compliance & Legal**: Understand layoff cycles to prepare for Q1 restructuring events.

---

## 👤 Author & Contact

**Author**: Akeira Green  
**LinkedIn**: [www.linkedin.com/in/akeira-green](https://www.linkedin.com/in/akeira-green)

---

## ✅ Project Status

**✅ Complete**  
Dataset fully cleaned, transformed, and analyzed using SQL.  
Ready for data storytelling in Tableau, Power BI, or further predictive modeling.

---

