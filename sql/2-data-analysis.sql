-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging;

SELECT MAX(total_laid_off), MIN(total_laid_off)
FROM layoffs_staging
;

SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC
;

SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

SELECT company, SUM(total_laid_off) AS total_off
FROM layoffs_staging
GROUP BY company
ORDER BY total_laid_off DESC
;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging;

SELECT industry, SUM(total_laid_off) AS total_off
FROM layoffs_staging
GROUP BY industry
ORDER BY total_laid_off DESC
;

SELECT country, SUM(total_laid_off) AS total_off
FROM layoffs_staging
GROUP BY country
ORDER BY total_laid_off DESC
;

SELECT stage, SUM(total_laid_off) AS total_off
FROM layoffs_staging
GROUP BY stage
ORDER BY total_laid_off DESC
;

SELECT YEAR(`date`), SUM(total_laid_off) AS total_off
FROM layoffs_staging
GROUP BY YEAR(`date`)
ORDER BY 1 DESC
;

SELECT YEAR(`date`) AS `year`, MONTH(`date`) AS `month`, SUM(total_laid_off) AS total_off
FROM layoffs_staging
WHERE `date` IS NOT NULL
GROUP BY `year`, `month`
ORDER BY 1, 2
;

WITH Rolling_Total_CTE AS (
SELECT YEAR(`date`) AS `year`,
MONTH(`date`) AS `month`,
SUM(total_laid_off) AS total_off
FROM layoffs_staging
WHERE `date` IS NOT NULL
GROUP BY `year`, `month`
ORDER BY 1, 2
)
SELECT `year`, `month`, total_off,
SUM(total_off) OVER(ORDER BY `year`, `month`) AS rolling_total
FROM Rolling_Total_CTE
;

WITH Company_Years(company, years, total_laid_off) AS (
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging
WHERE `date` IS NOT NULL
GROUP BY company, YEAR(`date`)
),
Company_Year_Rank_CTE AS (
SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Years
)
SELECT *
FROM Company_Year_Rank_CTE
WHERE ranking <= 5;










