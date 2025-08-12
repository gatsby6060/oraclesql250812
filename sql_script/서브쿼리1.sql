-- 서브 쿼리 - 쿼리 안에 또 다른 쿼리

SELECT MAX(PAY)
FROM PROFESSOR;

-- 급여 가장 많이 받는 사람
SELECT * 
FROM PROFESSOR
WHERE PAY = (
    SELECT MAX(PAY)
    FROM PROFESSOR
);

-- 급여 가장 많이 받는 사람 + 가장 적게 받는 사람
SELECT * 
FROM PROFESSOR
WHERE PAY = (
    SELECT MAX(PAY)
    FROM PROFESSOR
) OR PAY = (
    SELECT MIN(PAY)
    FROM PROFESSOR
);

SELECT *
FROM PROFESSOR
WHERE PAY IN (
    SELECT PAY 
    FROM PROFESSOR
    WHERE PAY > 400
);

SELECT *
FROM PROFESSOR
WHERE PAY IN (570, 220);

SELECT * 
FROM PROFESSOR
WHERE DEPTNO IN (
        SELECT DEPTNO
        FROM DEPARTMENT
        WHERE DNAME IN ('컴퓨터공학과','멀티미디어공학과')
);

SELECT DEPTNO
FROM DEPARTMENT
WHERE DNAME = '컴퓨터공학과';

-- 권장하는 방식은 아님. 이후 조인으로 대체 가능
SELECT 
    STU_NAME,
    (SELECT COUNT(*) FROM STUDENT)
FROM STUDENT;