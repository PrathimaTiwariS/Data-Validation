



SELECT 
    HSNNo,
   -- COUNT(DISTINCT ItemName) AS ItemName_Count,
    COUNT(DISTINCT ItemCode) AS ItemCode_Count,
    STRING_AGG(CAST(ItemCode AS NVARCHAR(MAX)), ' | ') AS ItemCodes
FROM (
    SELECT DISTINCT HSNNo, ItemCode, ItemName
    FROM [Copy of Sales Register]
) AS DistinctItems
GROUP BY HSNNo
HAVING COUNT(DISTINCT ItemCode) > 1;


SELECT 
    ItemCode,
    COUNT(DISTINCT ItemName) AS ItemName_Count,
 --   COUNT(DISTINCT ItemCode) AS ItemCode_Count,
    STRING_AGG(CAST(ItemName AS NVARCHAR(MAX)), ' | ') AS ItemCodes
FROM (
    SELECT DISTINCT ItemCode,  HSNNo,  ItemName
    FROM [Copy of Sales Register]
) AS DistinctItems
GROUP BY  ItemCode
HAVING COUNT(DISTINCT ItemName) > 1;