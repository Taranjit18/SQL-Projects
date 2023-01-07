--Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
SELECT SUM(AmountinUSD)
FROM indian_startup_funding
WHERE CityLocation = "Bengaluru"

--Write SQL query to sort the table by startup name DESC
SELECT * 
FROM indian_startup_funding
ORDER BY lower(StartupName) DESC


--Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
--and AmountinUSD>380000

SELECT SUM(AmountinUSD)
FROM indian_startup_funding
WHERE CityLocation = "Bengaluru" AND
AmountinUSD>380000

--Write SQL query to get all CityLocations that has an AmountinUSD >380000
SELECT CityLocation
FROM indian_startup_funding
WHERE AmountinUSD>380000

--Write SQL query to get only unique CityLocations that has an AmountinUSD >380000
SELECT DISTINCT(CityLocation)
FROM indian_startup_funding
WHERE AmountinUSD>380000


--Write SQL query to get all StartupNames where AmountinUSD<380000
SELECT StartupName
FROM indian_startup_funding
WHERE AmountinUSD<380000


--Write SQL query to sort the output from the previous question DESC
SELECT StartupName
FROM indian_startup_funding
WHERE AmountinUSD<380000
ORDER BY lower(StartupName) DESC


--Write SQL query to get the City location that has the maximum funding amount “Note that is the
--data is not cleaned properly you will get non logical result”
SELECT CityLocation
FROM indian_startup_funding
WHERE AmountinUSD =(SELECT MAX(AMOUNTINUSD)
					FROM indian_startup_funding)

--Write SQL query to get the total funding AmountinUSD for each IndustryVertical
SELECT IndustryVertical, SUM(AMOUNTINUSD)
FROM indian_startup_funding 
GROUP BY IndustryVertical


--Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with
--letter “A”
SELECT IndustryVertical, SUM(AMOUNTINUSD)
FROM indian_startup_funding
WHERE IndustryVertical LIKE "A%" 
GROUP BY IndustryVertical

--Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with
--letter “A” and sort the output DESC by the total AmountinUSD
SELECT IndustryVertical, SUM(AMOUNTINUSD)AS TOTALAMTINUSD
FROM indian_startup_funding
WHERE IndustryVertical LIKE "A%" 
GROUP BY IndustryVertical
ORDER BY TOTALAMTINUSD DESC

--Write SQL query to count all the start_ups in the Education field
SELECT Count(StartupName)
FROM indian_startup_funding
WHERE IndustryVertical = "Education"

--Write SQL query to count all the start_Ups in the E-Commerce field
SELECT Count(StartupName)
FROM indian_startup_funding
WHERE IndustryVertical = "E-Commerce"

--Write SQL query to count all the start_Ups in the E-Commerce field, where city location equals
--“Bengaluru”
SELECT Count(StartupName)
FROM indian_startup_funding
WHERE IndustryVertical = "E-Commerce" AND 
CityLocation = "Bengaluru"

--For each Industry Vertical find the total funding amount
SELECT IndustryVertical, SUM(AMOUNTINUSD)
FROM indian_startup_funding
group by IndustryVertical


--For each Industry Vertical find the total funding amount as “Total_fund” and the average
--funding amount as “Avg_Fund”. In this question provide two answer 1- using group by Industry
--Vertical, 2- using sub_queries

--groupby
SELECT IndustryVertical, SUM(AMOUNTINUSD) AS TOTAL_FUND , AVG(AMOUNTINUSD) AS AVG_FUND
FROM indian_startup_funding
GROUP BY IndustryVertical

--USING SUB QUERIES
WITH CTE1 AS(
SELECT IndustryVertical, SUM(AMOUNTINUSD)AS TOT
FROM indian_startup_funding
GROUP BY IndustryVertical
),
CTE2 AS (
SELECT IndustryVertical, AVG(AMOUNTINUSD)AS AVGINUSD
FROM indian_startup_funding
GROUP BY IndustryVertical
)
SELECT CTE1.IndustryVertical,CTE1.TOT,CTE2.AVGINUSD
FROM CTE1 JOIN CTE2
ON CTE1.IndustryVertical = CTE2.IndustryVertical


--Write SQL query to get the minimum value of funding for the “Uniphore” start_up
SELECT MIN(AMOUNTINUSD)
FROM indian_startup_funding
WHERE StartupName = "Uniphore"

--Write SQL query to get the length of the city location names 
SELECT CityLocation, length(CITYLOCATION)
FROM indian_startup_funding

--Write SQL query to convert start_ups names into uppercase if the funding amount is >380,000
SELECT UPPER(StartupName)
FROM indian_startup_funding
WHERE AmountinUSD >380000

--Write SQL query to select distinct industry vertical names, knowing that names are mix of
--lowercase and uppercase values
SELECT DISTINCT(LOWER(INDUSTRYVERTICAL))
FROM indian_startup_funding


