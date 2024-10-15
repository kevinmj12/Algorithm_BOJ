-- 코드를 작성해주세요

SELECT A.ID, COALESCE(B.CHILD_COUNT, 0) AS CHILD_COUNT
FROM ECOLI_DATA AS A
LEFT JOIN (
    SELECT PARENT_ID, COUNT(PARENT_ID) AS CHILD_COUNT
    FROM ECOLI_DATA
    GROUP BY PARENT_ID
    HAVING PARENT_ID IS NOT NULL
) AS B ON A.ID = B.PARENT_ID
ORDER BY ID ASC;

