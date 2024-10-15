-- 코드를 입력하세요
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as DATE_FORMAT, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE
WHERE MONTH(SALES_DATE) = 3

UNION DISTINCT

SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as DATE_FORMAT, PRODUCT_ID, NULL AS USER_ID, SALES_AMOUNT
FROM OFFLINE_SALE
WHERE MONTH(SALES_DATE) = 3

ORDER BY DATE_FORMAT ASC, PRODUCT_ID ASC, USER_ID ASC

