-- 코드를 작성해주세요

SELECT A.ID, 
    CASE 
        WHEN B.RANKING <= (SELECT COUNT(*) FROM ECOLI_DATA) * 0.25
        THEN 'CRITICAL'
        WHEN B.RANKING <= (SELECT COUNT(*) FROM ECOLI_DATA) * 0.5
        THEN 'HIGH'
        WHEN B.RANKING <= (SELECT COUNT(*) FROM ECOLI_DATA) * 0.75
        THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM ECOLI_DATA AS A
JOIN (
    SELECT ID,
        RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS RANKING
    FROM ECOLI_DATA
) AS B ON A.ID = B.ID
ORDER BY A.ID ASC;
