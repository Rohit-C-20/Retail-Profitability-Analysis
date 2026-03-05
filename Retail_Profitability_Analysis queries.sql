CREATE DATABASE retail_project;
USE retail_project;

USE retail_project;

SELECT Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Margin_Pct
FROM superstore_clean
GROUP BY Category
ORDER BY Margin_Pct DESC;

SELECT Category, `Sub-Category`,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS Rank_In_Category
FROM superstore_clean
GROUP BY Category, `Sub-Category`;

SELECT Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Discount)*100, 1) AS Avg_Discount_Pct
FROM superstore_clean
GROUP BY Region
ORDER BY Total_Profit DESC;

SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low'
        WHEN Discount <= 0.4 THEN 'Medium'
        ELSE 'High'
    END AS Discount_Band,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    COUNT(*) AS Orders
FROM superstore_clean
GROUP BY 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low'
        WHEN Discount <= 0.4 THEN 'Medium'
        ELSE 'High'
    END
ORDER BY Avg_Profit DESC;



SELECT Category, `Sub-Category`,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS Rank_In_Category
FROM superstore_clean
GROUP BY Category, `Sub-Category`;