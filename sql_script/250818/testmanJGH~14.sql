
-- UNION UNION ALL
-- SELECT 쿼리 실행 결과를 합쳐주는 명령어

SELECT
    STU_NO,
    STU_NAME,
    STU_DEPT
FROM student
WHERE STU_HEIGHT >= 170
UNION 
SELECT
    STU_NO,
    STU_NAME,
    STU_DEPT
FROM student
WHERE STU_HEIGHT >= 160;




SELECT
    STU_NO,
    STU_NAME,
    STU_DEPT
FROM student
WHERE STU_HEIGHT >= 170
UNION ALL
SELECT
    STU_NO,
    STU_NAME,
    STU_DEPT
FROM student
WHERE STU_HEIGHT >= 160;

--주의점 
--컬럼의 개수 타입이 같아야 한다.
--컬럼의 이름(별칭)은 먼저 나오는 쿼리의 이름을 따른다.

SELECT STU_NAME FROM STUDENT
UNION
SELECT COUNT(*) FROM STUDENT;

SELECT STU_NAME FROM STUDENT -- 첫번째 컬럼명이 따라감
UNION
SELECT STU_DEPT FROM STUDENT; --컬럼의 타입이 같기 떄문에 가능


SELECT STU_NAME FROM STUDENT -- 첫번째 따라감
UNION
SELECT STU_NAME, STU_DEPT FROM STUDENT; --컬럼의 R개수가 달라서 불가능한 쿼리


SELECT * FROM STUDENT;
SELECT * FROM ENROL;


-- 유니온에서도 오더바이는 가장 마지막에 가능
SELECT 이름 , 평균점수 
FROM 
(
    SELECT s.stu_name 이름 , AVG(E.ENR_GRADE) 평균점수, 1 AS ORDERKEY
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = e.stu_no
    GROUP BY s.stu_name
    UNION
    SELECT  '전체평균', ROUND(AVG(ENR_GRADE),1), 2 AS ORDERKEY
    FROM ENROL
    ORDER BY ORDERKEY, 평균점수 DESC
) T
;



-- 아래 이미지는 부서는 평균금액을 기준으로 내림차순할 것. 전체 평균은 맨 마지막에 출력할 것.
-- EMP, DEPT
-- 부서명 평균금액
SELECT * FROM EMP;
SELECT * FROM DEPT;


--SELECT E.DEPTNO, d.dname, ROUND(AVG(SAL),1), 1 AS ORDERKEY
SELECT 부서명, 전체평균 
FROM
(
SELECT  d.dname 부서명, ROUND(AVG(SAL),0) 전체평균, 1 AS ORDERKEY
FROM EMP E
INNER JOIN DEPT D ON e.deptno = d.deptno 
GROUP BY  d.dname
UNION
SELECT '전체평균', ROUND(AVG(SAL),0) 전체평균  , 2 AS ORDERKEY
FROM EMP
ORDER BY ORDERKEY ,전체평균 DESC
);



SELECT DNAME 부서, 평균금액 
FROM
    (
    SELECT DNAME, ROUND(AVG(SAL)) AS 평균금액, 1 AS ORDERKEY
    FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    GROUP BY DNAME
    UNION 
    SELECT '전체평균', ROUND(AVG(SAL)), 2 AS ORDERKEY
    FROM EMP
    ORDER BY 평균금액 DESC
    );
