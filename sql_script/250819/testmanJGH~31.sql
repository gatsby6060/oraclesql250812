-- 1. 학생들의 시험 평균 점수가 가장 높은 학생과 가장 낮은 학생의 차이를 구하시오
-- (STUDENT, ENROL)
SELECT * FROM STUDENT;
SELECT * FROM ENROL;


SELECT ROWNUM, T.* FROM 
(
SELECT STU_NO, AVG(ENR_GRADE) AS EG   
FROM ENROL 
GROUP BY STU_NO
ORDER BY EG DESC
) T;

SELECT MAX(EG) - MIN(EG) FROM 
(
SELECT STU_NO, AVG(ENR_GRADE) AS EG   
FROM ENROL 
GROUP BY STU_NO
ORDER BY EG DESC
) T;


-- 2. 2개의 수업을 들은 학생들의 평균점수와 1개의 수업을 들은 학생들의 평균점수의 차이를 구하시오.
-- 일단 보류~
-- (STUDENT, ENROL)
SELECT * FROM STUDENT;
SELECT * FROM ENROL;

SELECT
(
SELECT  AVG(ENR_GRADE) 
FROM ENROL 
WHERE STU_NO IN (
    SELECT STU_NO --, COUNT(SUB_NO)
    FROM ENROL 
    GROUP BY STU_NO
    HAVING COUNT(STU_NO) = 2
)
)
 - 
 (
SELECT  AVG(ENR_GRADE) AS ONEAVG --,STU_NO  
FROM ENROL 
WHERE STU_NO IN (
    SELECT STU_NO --, COUNT(SUB_NO)
    FROM ENROL 
    GROUP BY STU_NO
    HAVING COUNT(STU_NO) = 1
)
)
FROM DUAL;


SELECT
  (SELECT AVG(ENR_GRADE)
     FROM ENROL
     WHERE STU_NO IN (
       SELECT STU_NO
       FROM ENROL
       GROUP BY STU_NO
       HAVING COUNT(*) = 2
     ))
  -
  (SELECT AVG(ENR_GRADE)
     FROM ENROL
     WHERE STU_NO IN (
       SELECT STU_NO
       FROM ENROL
       GROUP BY STU_NO
       HAVING COUNT(*) = 1
     )) AS DIFF_AVG
     
FROM DUAL;


--GROUP BY STU_NO;

-- 3. 본인 학과에서 본인보다 몸무게가 큰 학생의 수를 출력하시오. ( 학번, 이름, 학과, 큰 학생 수 출력 )
-- (STUDENT)
    SELECT * FROM STUDENT;
    
    SELECT S1.STU_NO, S1.STU_NAME, COUNT(S2.STU_NO)--S2.STU_NO, S2.STU_NAME, S2.STU_DEPT
    FROM STUDENT S1
    INNER JOIN STUDENT S2 ON S1.STU_HEIGHT < S2.STU_HEIGHT
    AND S1.STU_DEPT = S2.STU_DEPT
    GROUP BY S1.STU_NO, S1.STU_NAME;



-- 4. 공과대학에서 속한 교수들 중 가장 큰 급여를 가지는 사람과 
--	가장 적은 급여를 가지는 사람의 교수 이름, 소속 학과, 직급, 급여를 출력하시오
--	(PROFESSOR, DEPARTMENT)
SELECT * FROM DEPARTMENT;
SELECT  
T1.NAME, T1.DEPTNO, D1.DNAME, T1.POSITION, T1.PAY  
FROM 
    (
    SELECT NAME, DEPTNO, POSITION,PAY 
    FROM PROFESSOR 
    WHERE pay = (
        SELECT 
        MAX(PAY) 
        FROM PROFESSOR
        )
    UNION
    SELECT NAME, DEPTNO, POSITION,PAY 
    FROM PROFESSOR 
    WHERE pay = (
        SELECT 
        MIN(PAY) 
        FROM PROFESSOR
        )
    ) T1
INNER JOIN DEPARTMENT D1 ON T1.DEPTNO = D1.DEPTNO;