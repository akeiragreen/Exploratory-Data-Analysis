--  ---------------------------------------------EXPLORIATORY DATA ANALYSIS --------------------------------------------------------------

-- Identifying Max Layoffs and Full Shutdowns

SELECT *
FROM layoffs_stagging2;


SELECT MAX(total_laid_off),
 MAX(percentage_laid_off)
FROM layoffs_stagging2;

SELECT *
FROM layoffs_stagging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- SQL Logic Summary: Found the maximum number of layoffs and percentage laid off in a single event.
--     Identified companies with 100% layoffs (i.e., went completely out of business).
--     Sorted by highest funds raised to show scale of shutdowns.
-- Insights for Stakeholders: Severe Workforce Cuts: At least one company laid off 12,000 employees in a single event.
--     Business Closures: Multiple companies shut down entirely, laying off all staff despite raising significant funding—highlighting risk in high-burn startups.



-- ----------------------------------------------------------------------------------------

--    Total Layoffs by Company


SELECT company, 
SUM(total_laid_off) AS company_total_layoffs
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;



-- SQL Logic Summary: Aggregated layoffs by company.
--     Sorted companies by total layoffs descending.
-- Insights for Stakeholders: Amazon & Google: Were the top contributors to total layoffs, showing large-scale workforce shifts in major tech firms.
--     Impact Concentration: Layoffs are heavily concentrated among a few large employers, signaling possible strategic overexpansion or restructuring.




-- ---------------------------------------------------------------------------------------------------------------


--            Layoff Time Range


SELECT MIN(`date`) AS layoffs_start_date,
 MAX(`date`) AS layoffs_end_date
FROM layoffs_stagging2;

-- SQL Logic Summary: Retrieved the earliest and latest layoff dates from the dataset.
-- Insights for Stakeholders: Timeline Defined: Layoffs spanned from March 2020 to March 2023—matching global pandemic and post-pandemic market correction periods.



-- -----------------------------------------------------------------------------------

--       Total Layoffs by Country


SELECT country, 
SUM(total_laid_off) AS country_total_layoffs
FROM layoffs_stagging2
GROUP BY 1
ORDER BY 2 DESC;

-- SQL Logic Summary: Summed total layoffs per country and ranked them.
-- Insights for Stakeholders: U.S. Dominance: The U.S. accounted for over 200,000 layoffs—more than 5x that of the next country (India).
-- Global Trends: Layoffs affected multiple regions, but the U.S. tech and startup sectors were disproportionately impacted.


-- --------------------------------------------------------------------------------------------------------


--          Layoffs by Industry


SELECT industry, 
SUM(total_laid_off) AS industry_total_layoffs
FROM layoffs_stagging2
GROUP BY 1
ORDER BY 2 DESC;

-- SQL Logic Summary: Calculated total layoffs by industry.
-- Insights for Stakeholders: Consumer Tech & Retail: Were the hardest-hit sectors, 
--                              possibly due to shifting consumer demand, digital adoption saturation, or economic constraints.

-- ------------------------------------------------------------------------------------------------------------


--          Largest Single-Day Layoffs


SELECT *
FROM layoffs_stagging2;

SELECT  `date`,
 SUM(total_laid_off) AS layoffs_that_day
FROM layoffs_stagging2
GROUP BY 1
ORDER BY 2 DESC;

-- SQL Logic Summary: Grouped total layoffs by date.
--    Sorted to find days with the highest layoffs.
-- Insights for Stakeholders: Major Layoff Spikes: Jan 4, 2023, saw over 16,000 layoffs in one day, followed by Nov 16, 2022.
--    Planning Opportunity: Layoff timing aligns with start-of-year restructuring—critical for HR and policy planners.



-- -------------------------------------------------------------------------------------------------------

--         Total Layoffs by Year


SELECT  YEAR(`date`) AS Year, 
SUM(total_laid_off) AS Year_layoffs_total
FROM layoffs_stagging2
GROUP BY 1
ORDER BY 2 DESC;

-- SQL Logic Summary: Summarized total layoffs for each calendar year.
-- Insights for Stakeholders: 2022 Was the Peak: Highest layoff year with over 160,000 job cuts.
--     2023 Layoffs Still High: Continued into the next year, indicating prolonged market corrections.


-- ---------------------------------------------------------------------------------------------------

--                  Average Layoff Percentage by Company


SELECT company, AVG(percentage_laid_off) AS avg_percent_layoff
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;


-- SQL Logic Summary: Calculated average percent laid off per company.
-- Insights for Stakeholders: Full Shutdowns Identified: Companies with 100% average layoff percentage are confirmed shutdowns.
-- Operational Risk Flag: This metric can highlight unstable or defunct companies quickly.



-- --------------------------------------------------------------------------------------------------------

--                . Monthly Layoff Trends


SELECT substring(`date`,1,7) AS Month ,
SUM(total_laid_off) AS Month_total_layoffs
FROM layoffs_stagging2
WHERE  substring(`date`,1,7) IS NOT NULL
GROUP BY 1
ORDER BY 1 ASC;


WITH rolling_total AS 
(
	SELECT substring(`date`,1,7) AS Month ,
    SUM(total_laid_off) AS total_off
FROM layoffs_stagging2
WHERE  substring(`date`,1,7) IS NOT NULL
GROUP BY 1
ORDER BY 1 ASC
)
SELECT Month , total_off
,SUM(total_off) OVER(ORDER BY MONTH) AS total
FROM rolling_total;

-- SQL Logic Summary: Grouped layoffs by month (YYYY-MM).
--     Computed monthly and rolling totals over time.
-- Insights for Stakeholders: Peak Volatility in 2022–2023: Monthly tracking reveals distinct spikes in layoff activity.
--  2021 Stability: Notably low layoffs, indicating a recovery or boom period mid-pandemic.



-- -----------------------------------------------------------------------------------------------------------------------

--            Company-wise Yearly Layoffs

SELECT company, YEAR(`date`) AS Year
,SUM(total_laid_off) AS Yearly_total_layoffs
FROM layoffs_stagging2
GROUP BY 1, 2
ORDER BY 3 DESC;

-- SQL Logic Summary: Broke down total layoffs per company per year.
-- Insights for Stakeholders: Google 2023 Surge: Laid off 12,000 employees in one year alone.
-- Yearly Impact Distribution: Allows yearly comparison of top workforce reductions by firm.



-- -------------------------------------------------------------------------------------------------------

--              Top 5 Companies with Most Layoffs Each Year


WITH company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, YEAR(`date`)
), company_year_rank AS 
(SELECT *
, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE ranking <=5;


-- SQL Logic Summary: Used CTEs and DENSE_RANK() to rank and filter the top 5 companies by layoff count per year.
-- Insights for Stakeholders: Dynamic Market Impact: Top layoff contributors change yearly—highlighting evolving market shocks.
-- Recurring Players: Some companies appear in top 5 multiple years, indicating recurring instability or pivoting strategies.
