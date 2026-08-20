-- ============================================================
-- MEESHO E-COMMERCE BUSINESS ANALYSIS
-- SQL BUSINESS ANALYSIS QUERIES
-- ============================================================
-- Dataset table: meesho_orders
-- SQL style: MySQL-compatible
-- ============================================================


-- 1. TOTAL ORDERS
SELECT
    COUNT(Order_ID) AS Total_Orders
FROM meesho_orders;


-- 2. TOTAL QUANTITY
SELECT
    SUM(Quantity) AS Total_Quantity
FROM meesho_orders;


-- 3. TOTAL SALES VALUE
SELECT
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders;


-- 4. ORDER STATUS DISTRIBUTION
SELECT
    Order_Status,
    COUNT(Order_ID) AS Total_Orders
FROM meesho_orders
GROUP BY Order_Status
ORDER BY Total_Orders DESC;


-- 5. SALES BY CATEGORY
SELECT
    Category,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Category
ORDER BY Total_Sales_Value DESC;


-- 6. ORDERS BY CATEGORY
SELECT
    Category,
    COUNT(Order_ID) AS Total_Orders
FROM meesho_orders
GROUP BY Category
ORDER BY Total_Orders DESC;


-- 7. AVERAGE SALE PRICE BY CATEGORY
SELECT
    Category,
    AVG(Sale_Price) AS Average_Sale_Price
FROM meesho_orders
GROUP BY Category
ORDER BY Average_Sale_Price DESC;


-- 8. SALES BY CUSTOMER STATE
SELECT
    Customer_State,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Customer_State
ORDER BY Total_Sales_Value DESC;


-- 9. ORDERS BY CUSTOMER STATE
SELECT
    Customer_State,
    COUNT(Order_ID) AS Total_Orders
FROM meesho_orders
GROUP BY Customer_State
ORDER BY Total_Orders DESC;


-- 10. SALES BY PAYMENT MODE
SELECT
    Payment_Mode,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Payment_Mode
ORDER BY Total_Sales_Value DESC;


-- 11. ORDERS BY PAYMENT MODE
SELECT
    Payment_Mode,
    COUNT(Order_ID) AS Total_Orders
FROM meesho_orders
GROUP BY Payment_Mode
ORDER BY Total_Orders DESC;


-- 12. RETURN RATE
SELECT
    ROUND(
        SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(Order_ID),
        2
    ) AS Return_Rate
FROM meesho_orders;


-- 13. RETURN RATE BY CATEGORY
SELECT
    Category,
    ROUND(
        SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(Order_ID),
        2
    ) AS Return_Rate
FROM meesho_orders
GROUP BY Category
ORDER BY Return_Rate DESC;


-- 14. RETURN RATE BY CUSTOMER STATE
SELECT
    Customer_State,
    ROUND(
        SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(Order_ID),
        2
    ) AS Return_Rate
FROM meesho_orders
GROUP BY Customer_State
ORDER BY Return_Rate DESC;


-- 15. SELLER SALES
SELECT
    Seller_Name,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Seller_Name
ORDER BY Total_Sales_Value DESC;


-- 16. TOP SELLERS BY SALES
SELECT
    Seller_Name,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Seller_Name
ORDER BY Total_Sales_Value DESC
LIMIT 10;


-- 17. SELLER RETURN RATE
SELECT
    Seller_Name,
    ROUND(
        SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(Order_ID),
        2
    ) AS Return_Rate
FROM meesho_orders
GROUP BY Seller_Name
ORDER BY Return_Rate DESC;


-- 18. SALES BY DISCOUNT BAND
SELECT
    CASE
        WHEN Discount_Percent < 10 THEN '0-10%'
        WHEN Discount_Percent < 20 THEN '10-20%'
        WHEN Discount_Percent < 30 THEN '20-30%'
        ELSE '30%+'
    END AS Discount_Band,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY
    CASE
        WHEN Discount_Percent < 10 THEN '0-10%'
        WHEN Discount_Percent < 20 THEN '10-20%'
        WHEN Discount_Percent < 30 THEN '20-30%'
        ELSE '30%+'
    END
ORDER BY Total_Sales_Value DESC;


-- 19. TOP 5 PRODUCTS BY SALES
SELECT
    Product_Name,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Product_Name
ORDER BY Total_Sales_Value DESC
LIMIT 5;


-- 20. SALES BY ORDER STATUS
SELECT
    Order_Status,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Order_Status
ORDER BY Total_Sales_Value DESC;


-- 21. RETURNED ORDERS
SELECT
    COUNT(Order_ID) AS Returned_Orders
FROM meesho_orders
WHERE Return_Status = 'Returned';


-- 22. REFUND AMOUNT BY RETURN STATUS
SELECT
    Return_Status,
    SUM(Refund_Amount) AS Total_Refund_Amount
FROM meesho_orders
GROUP BY Return_Status
ORDER BY Total_Refund_Amount DESC;


-- 23. SALES AND QUANTITY BY CATEGORY
SELECT
    Category,
    SUM(Sales_Value) AS Total_Sales_Value,
    SUM(Quantity) AS Total_Quantity
FROM meesho_orders
GROUP BY Category
ORDER BY Total_Sales_Value DESC;


-- 24. SALES BY SELLER AND CATEGORY
SELECT
    Seller_Name,
    Category,
    SUM(Sales_Value) AS Total_Sales_Value
FROM meesho_orders
GROUP BY Seller_Name, Category
ORDER BY Total_Sales_Value DESC;


-- 25. BASIC DATA CHECK
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Order_ID) AS Orders_With_ID,
    COUNT(DISTINCT Order_ID) AS Distinct_Order_IDs
FROM meesho_orders;
