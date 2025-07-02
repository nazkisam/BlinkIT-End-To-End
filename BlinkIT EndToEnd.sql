--1 Check the number of lines 
SELECT COUNT(*) AS total_row_count
FROM BlinkIT_Data

--2 Explore the data
SELECT * FROM BlinkIT_Data

--3 need to updae this col with the uniform value. convert lower cases to upper cases.
UPDATE BlinkIT_Data
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content = 'low fat' OR Item_Fat_Content = 'LF'


--4 now we will update the other cols but with different approach, using case statements.
UPDATE BlinkIT_Data
SET Item_Fat_Content = 

CASE 
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content  = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

--5 lets check whether the values have been updated.

SELECT DISTINCT(Item_Fat_Content) FROM BlinkIT_Data

--6 Total sales in millions

SELECT CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)) AS Total_sales_Million
FROM BlinkIT_Data

--7 Average Sales
SELECT ROUND(AVG(Sales),0) AS Average_sales
FROM BlinkIT_Data

--8 Number of items
SELECT COUNT( DISTINCT Item_Type) AS Number_of_items
FROM BlinkIT_Data

--9 Average Rating
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_rating
FROM BlinkIT_Data

--10 Total sales for low fat items.
SELECT ROUND(SUM(Sales),0) AS total_sales_for_LOW_FAT
FROM BlinkIT_Data
WHERE Item_Fat_Content = 'Low Fat'



--11 Total sales for outlet establishment year (2022)
SELECT CAST(SUM(Sales)/1000000 AS decimal(10,2)) AS sales_for_2022
FROM BlinkIT_Data
WHERE Outlet_Establishment_year = '2022'



--12 Sales and other insights by fat content 
SELECT Item_Fat_Content, 

ROUND(SUM(Sales),0) AS Sales,
ROUND(AVG(sales),0) AS Avg_Sales,
COUNT(*) AS Total_items,
ROUND(AVG(Rating),2) AS Avg_Rating 

FROM BlinkIT_Data
GROUP BY Item_Fat_Content


-- 13 Total Sales by item type
SELECT  Item_Type, 
CAST(SUM(Sales) AS decimal(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
COUNT(*) AS Number_of_items,
ROUND(AVG(rating),2) AS AVG_RATING
FROM BlinkIT_Data
GROUP BY Item_Type
ORDER BY 2 DESC

--14 Show top 5 items by sales.
SELECT  TOP 5 Item_Type, 
CAST(SUM(Sales) AS decimal(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
COUNT(*) AS Number_of_items,
ROUND(AVG(rating),2) AS AVG_RATING
FROM BlinkIT_Data
GROUP BY Item_Type
ORDER BY Total_Sales DESC



--15 total sales, item type and outlet
SELECT Outlet_Identifier,
Item_Fat_Content,

CAST(SUM(Sales) AS decimal(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
COUNT(*) AS Number_of_items,
ROUND(AVG(rating),2) AS AVG_RATING
FROM BlinkIT_Data
GROUP BY Outlet_Identifier , Item_Fat_Content

--16 Fat content by outlet for sales table.
-- Here we are pivoting the table.
SELECT Outlet_Location_Type,
ISNULL([Low Fat],0) AS Low_Fat,
ISNULL([Regular],0) AS Regular
FROM
(
SELECT Outlet_Location_Type, Item_Fat_Content,
CAST(SUM(Sales) AS DECIMAL(10,2))AS Total_Sales
FROM BlinkIT_Data
GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable

PIVOT
(
SUM(Total_Sales)
FOR Item_Fat_Content IN ([Low Fat],[Regular])
)AS PivotTable
ORDER BY Outlet_Location_Type

--17 total sales by outlet establishment year.

SELECT Outlet_Establishment_Year, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM BlinkIT_Data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year  ASC

--18 Sales percentage by outlet size.
SELECT OutLet_Size,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST((SUM(Sales) *100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM BlinkIT_Data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC


--19 Sales by outlet location.
SELECT 







--1 Check the number of lines 
SELECT COUNT(*) AS total_row_count
FROM BlinkIT_Data

--2 Explore the data
SELECT * FROM BlinkIT_Data

--3 need to updae this col with the uniform value. convert lower cases to upper cases.
UPDATE BlinkIT_Data
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content = 'low fat' OR Item_Fat_Content = 'LF'


--4 now we will update the other cols but with different approach, using case statements.
UPDATE BlinkIT_Data
SET Item_Fat_Content = 

CASE 
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content  = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

--5 lets check whether the values have been updated.

SELECT DISTINCT(Item_Fat_Content) FROM BlinkIT_Data

--6 Total sales in millions

SELECT CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)) AS Total_sales_Million
FROM BlinkIT_Data

--7 Average Sales
SELECT ROUND(AVG(Sales),0) AS Average_sales
FROM BlinkIT_Data

--8 Number of items
SELECT COUNT( DISTINCT Item_Type) AS Number_of_items
FROM BlinkIT_Data

--9 Average Rating
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_rating
FROM BlinkIT_Data

--10 Total sales for low fat items.
SELECT ROUND(SUM(Sales),0) AS total_sales_for_LOW_FAT
FROM BlinkIT_Data
WHERE Item_Fat_Content = 'Low Fat'



--11 Total sales for outlet establishment year (2022)
SELECT CAST(SUM(Sales)/1000000 AS decimal(10,2)) AS sales_for_2022
FROM BlinkIT_Data
WHERE Outlet_Establishment_year = '2022'



--12 Sales and other insights by fat content 
SELECT Item_Fat_Content, 

ROUND(SUM(Sales),0) AS Sales,
ROUND(AVG(sales),0) AS Avg_Sales,
COUNT(*) AS Total_items,
ROUND(AVG(Rating),2) AS Avg_Rating 

FROM BlinkIT_Data
GROUP BY Item_Fat_Content


-- 13 Total Sales by item type
SELECT  Item_Type, 
CAST(SUM(Sales) AS decimal(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
COUNT(*) AS Number_of_items,
ROUND(AVG(rating),2) AS AVG_RATING
FROM BlinkIT_Data
GROUP BY Item_Type
ORDER BY 2 DESC

--14 Show top 5 items by sales.
SELECT  TOP 5 Item_Type, 
CAST(SUM(Sales) AS decimal(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
COUNT(*) AS Number_of_items,
ROUND(AVG(rating),2) AS AVG_RATING
FROM BlinkIT_Data
GROUP BY Item_Type
ORDER BY Total_Sales DESC



--15 total sales, item type and outlet
SELECT Outlet_Identifier,
Item_Fat_Content,

CAST(SUM(Sales) AS decimal(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
COUNT(*) AS Number_of_items,
ROUND(AVG(rating),2) AS AVG_RATING
FROM BlinkIT_Data
GROUP BY Outlet_Identifier , Item_Fat_Content

--16 Fat content by outlet for sales table.
-- Here we are pivoting the table.
SELECT Outlet_Location_Type,
ISNULL([Low Fat],0) AS Low_Fat,
ISNULL([Regular],0) AS Regular
FROM
(
SELECT Outlet_Location_Type, Item_Fat_Content,
CAST(SUM(Sales) AS DECIMAL(10,2))AS Total_Sales
FROM BlinkIT_Data
GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable

PIVOT
(
SUM(Total_Sales)
FOR Item_Fat_Content IN ([Low Fat],[Regular])
)AS PivotTable
ORDER BY Outlet_Location_Type

--17 total sales by outlet establishment year.

SELECT Outlet_Establishment_Year, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM BlinkIT_Data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year  ASC

--18 Sales percentage by outlet size.
SELECT OutLet_Size,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST((SUM(Sales) *100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM BlinkIT_Data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC


--19 Sales by outlet location.
SELECT Outlet_Location_Type,

CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST((SUM(Sales)*100 /SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
COUNT(*) AS numberOfItems,

CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 

FROM BlinkIT_Data
WHERE Outlet_Establishment_Year = 2022
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC







SELECT * FROM BlinkIT_Data





































