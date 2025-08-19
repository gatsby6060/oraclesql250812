
SELECT ROWNUM, S.* 
FROM STUDENT S
WHERE ROWNUM BETWEEN 1 AND 5;

--서브쿼리로 ROWNUM을 끌어와야 인간(우리)의 의도대로 할 수 있다. 
SELECT *
FROM (
    SELECT ROWNUM AS RN, S.*
    FROM STUDENT S
)
WHERE RN >= 3;


SELECT ROWNUM , S.*
FROM STUDENT S
ORDER BY STU_HEIGHT DESC;

-- 학생테이블에서 키가 큰 상위 5명만 출력
SELECT T2.RN1, T2.STU_NAME, T2.STU_HEIGHT
FROM 
(
SELECT 
ROWNUM AS RN1, 
T.* 
FROM(
    SELECT ROWNUM , S.*
    FROM STUDENT S
    ORDER BY STU_HEIGHT DESC
    ) T
    WHERE STU_HEIGHT IS NOT NULL
    ORDER BY STU_HEIGHT DESC
) T2
WHERE 1=1
AND T2.RN1 <= 5;



SELECT ROWNUM, S.*
FROM(
    SELECT *
    FROM STUDENT 
    WHERE STU_HEIGHT IS NOT NULL
    ORDER BY STU_HEIGHT DESC
    ) S
WHERE ROWNUM <= 5;


-- 평균 급여가 2번째로 큰 부서의 부서명, 평균급여 출력
SELECT 
T2.RN1, 
T2.* ,
d.dname
FROM 
(
SELECT ROWNUM RN1, T1.AVGG, DEPTNO
        FROM(
                SELECT  E.DEPTNO AS DEPTNO , ROUND(AVG(SAL),1)  AS AVGG
                FROM EMP E
                GROUP BY  E.DEPTNO 
                ORDER BY AVGG
        ) T1
) T2
INNER JOIN DEPT D
ON T2.deptno = d.deptno
WHERE T2.RN1 = 2;


-- 평균 급여가 2번째로 큰 부서의 부서명, 평균급여 출력
-- 
-- DNAME으로만 해결
-- 평균급여가 2번째로 큰 부서의 부서명, 평균급여 출력
-- ROWNUM // ROW_NUMBER(), OFFSET ~ FETCH, RANK()
-- ROWNUM으로만 해결
SELECT DNAME, 평균급여
FROM (
    SELECT ROWNUM RN, S.*
    FROM (
        SELECT DNAME, ROUND(AVG(SAL)) 평균급여
        FROM EMP E
        INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
        GROUP BY DNAME
        ORDER BY 평균급여 DESC
    ) S
) S
WHERE RN = 2;

