#1. No. Of Distinct Countries

SELECT COUNT (DISTINCT country_name) FROM debtdata

#2. Distinct Debt Indicators

SELECT COUNT (DISTINCT indicator_name) FROM debtdata


SELECT DISTINCT indicator_code , indicator_name FROM debtdata


#3. Total Debt owed by countries

SELECT SUM(debt) AS total_debt FROM debtdata

#4. Country with highest debt

SELECT country_name, SUM (debt) AS total_debt FROM debtdata
GROUP BY country_name ORDER BY total_debt DESC
LIMIT 1;

#5. Average amount of debt across indicators

SELECT indicator_code AS debt_indicator, 
indicator_name, AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name ORDER BY average_debt DESC

#6 Highest Amount of principal Payments

SELECT country_name, indicator_name
FROM debtdata
WHERE debt= (SELECT MAX(debt) FROM debtdata
 WHERE indicator_code='DT.AMT.DLXF.CD'
 GROUP BY country_name, indicator_code 
 ORDER BY MAX(debt) DESC
 LIMIT 1);

#7. Most common debt indicator

SELECT indicator_code , COUNT(indicator_code) AS indicator_count
FROM debtdata
GROUP BY indicator_code ORDER BY indicator_count DESC
LIMIT 1;

#8. Other Viable Debt issues and conclusion

SELECT country_name,indicator_name,indicator_code, debt
FROM debtdata
GROUP by country_name, indicator_code, indicator_name, debt
ORDER BY debt DESC
LIMIT 10; 
