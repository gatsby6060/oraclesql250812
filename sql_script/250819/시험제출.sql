SELECT * FROM TBL_EMP;
SELECT * FROM TBL_DEPT;
SELECT * FROM TBL_PROJECT;
SELECT * FROM TBL_ASSIGNMENT;

-- 1. 학생들중 키가 175이상인 학생의 정보를 출력하시오. ( 15점 )
-- 사용테이블 : STUDENT
-- 출력 컬럼 : 학생번호, 이름, 키

SELECT * 
FROM STUDENT
WHERE STU_HEIGHT >= 175;



-- 2. 시험 점수가 80점 이상이면 'A', 70점 이상이면 'B', 60점 이상이면 'C', 그외는 '노력요망' 으로 출력하시오. ( 15점 )
-- 사용테이블 : ENROL
-- 출력 컬럼 : 학생번호, 평가정보
SELECT 
    STU_NO,
    CASE
        WHEN ENR_GRADE >= 80 THEN 'A'
        WHEN ENR_GRADE >= 70 THEN 'B'
        WHEN ENR_GRADE >= 60 THEN 'C'
        ELSE '노력요망'
    END 시험점수
FROM ENROL;




--[문항3]  -- 3. TBL_EMP 테이블에 데이터를 삽입, 수정, 삭제하시오. ( 15점 )
-- 조건 1. 데이터 삽입 시 들어갈 내용은 자유롭게 정의하되, manager_id 컬럼은 테이블의 연관성을 고려하여 삽입한다. (NULL 금지)
-- 조건 2. 조건 1에서 삽입한 직원의 급여 정보를 10%로 증가한다.
-- 조건 3. 조건 1에서 삽입한 직원을 PK를 조건으로 삭제 한다.
SELECT * 
FROM TBL_EMP;

INSERT INTO TBL_EMP VALUES ('E1234','이순신','사원','E1004','22/12/12',1111111,'D02');
UPDATE TBL_EMP
SET SALARY = SALARY*1.1
WHERE EMP_ID = 'E1234';
DELETE FROM TBL_EMP WHERE EMP_ID = 'E1234';
COMMIT;



--[문항4]  -- 4. 아래 이미지와 같이 이메일의 특정 부분을 '*'로 처리하시오. ( 20점 )
-- 사용테이블 : PROFESSOR
-- 출력 컬럼 : 원본 메일 컬럼, 수정된 메일 컬럼
--    INSTR(EMAIL, '@'), -- '@' 위치
--    SUBSTR(EMAIL, INSTR(EMAIL, '@'), LENGTH(EMAIL)), -- '@'부터 메일 끝까지 출력
SELECT 
SUBSTR(
LPAD(SUBSTR(EMAIL, INSTR(EMAIL,'@'), LENGTH(EMAIL)),          LENGTH(EMAIL),      '*')
,1
,INSTR(EMAIL,'@')
)
||
 REPLACE( SUBSTR(EMAIL, INSTR(EMAIL,'@'),INSTR(EMAIL,'.')-INSTR(EMAIL,'@')) , SUBSTR(EMAIL, INSTR(EMAIL,'@'),INSTR(EMAIL,'.')-INSTR(EMAIL,'@')), '****' )
||
SUBSTR(
LPAD(SUBSTR(EMAIL, INSTR(EMAIL,'@'), LENGTH(EMAIL)),  LENGTH(EMAIL),      '*')
,INSTR(EMAIL,'.')
,4
) AS 수정된메일컬럼
, EMAIL
FROM PROFESSOR
WHERE EMAIL IS NOT NULL;

-- 나중에 다시 보기





--[문항5]  -- 5. 각 부서별 평균 금여를 구한 후 평균 급여를 기준으로 내림차순 하시오. ( 10점 )
-- 사용테이블 : TBL_EMP, TBL_DEPT
-- 출력 컬럼 : 부서 이름, 평균 급여
SELECT  D.DEPT_NAME, AVG(E.SALARY) 
FROM TBL_EMP E
INNER JOIN TBL_DEPT D ON E.DEPT_ID = D.DEPT_ID
GROUP BY E.DEPT_ID, D.DEPT_NAME
ORDER BY AVG(E.SALARY) DESC;






-- 6. 모든 부서장들의 급여 평균보다 높은 급여를 받는 직원들을 출력하시오. ( 10점 )
-- 사용 테이블 : TBL_EMP, TBL_DEPT
-- 출력 컬럼 : 직원 이름, 급여, 부서장들의 평균 급여
SELECT EMP_NAME 직원이름, SALARY 급여,
(
SELECT T2.* FROM (
SELECT 
--ROWNUM RN, 
T.*
FROM
    (
    SELECT AVG(SALARY) 부서장들의평균급여
    FROM TBL_EMP
    WHERE EMP_ID IN
        (
        SELECT HEAD_ID 
        FROM TBL_DEPT
        )
    )T  
)T2
) 부서장평균급여
FROM TBL_EMP 
WHERE SALARY > (
SELECT 
--ROWNUM RN, 
T.*
FROM
    (
    SELECT AVG(SALARY) 부서장들의평균급여
    FROM TBL_EMP
    WHERE EMP_ID IN
        (
        SELECT HEAD_ID 
        FROM TBL_DEPT
        )
    )T  
);



--[문항7]  -- 7. '모바일 앱 개발' 프로젝트에 배정된 직원들중 가장 높은 급여를 받는 직원을 출력하시오. ( 5점 )
-- 사용 테이블 : TBL_EMP, TBL_PROJECT, TBL_ASSIGNMENT
-- 출력 컬럼 : 직원 이름, 직급, 급여

SELECT * FROM TBL_EMP;
SELECT * FROM TBL_PROJECT;
SELECT * FROM TBL_ASSIGNMENT;

SELECT T.ENAME 직원이름, T.JOBTIT 직급, T.SAL 급여  
FROM (
        SELECT ROWNUM RN, P.*,A.*, E.SALARY AS SAL , E.EMP_NAME AS ENAME, E.JOB_TITLE AS JOBTIT 
        FROM TBL_PROJECT P
        INNER JOIN TBL_ASSIGNMENT A ON P.PROJ_ID = A.PROJ_ID
        INNER JOIN TBL_EMP E ON A.EMP_ID = E.EMP_ID
        WHERE P.PROJ_NAME = '모바일 앱 개발'
     ) T
WHERE RN = 1;




--[문항8]  -- 8. 각 직원의 부하직원의 수(자신의 emp_id를 manager_id로 가지고 있는 사람 수)를 구하시오.
--단, 없으면 0으로 출력하시오. ( 5점 )
-- 사용 테이블 : TBL_EMP
-- 출력 컬럼 : 직원 이름, 직급, 부하직원 수
SELECT * FROM TBL_EMP;

SELECT E3.EMP_ID,E3.EMP_NAME 이름, E3.JOB_TITLE 직급,  COUNT(*) 부하직원수
FROM TBL_EMP E1
LEFT JOIN TBL_EMP E2 ON E1.MANAGER_ID = E2.EMP_ID
LEFT JOIN TBL_EMP E3 ON E2.MANAGER_ID = E3.EMP_ID

GROUP BY E3.EMP_ID,E3.EMP_NAME,E3.JOB_TITLE, E3.MANAGER_ID;

-- 나중에 다시....



--[문항9]  -- 9. 자신의 학년에서 자신보다 키가 큰 학생의 수를 출력하시오. 없으면 0을 출력하시오. ( 5점 )
-- 사용 테이블 : STU
-- 출력 컬럼 : 이름, 학년, 키, 자신보다 키가 큰 학생의 수

SELECT * FROM STU;

SELECT 
S1.NAME 이름, 
S1.GRADE 학년, 
S1.HEIGHT 키, 
COUNT(S2.HEIGHT) 자신보다키가큰학생수 
FROM STU S1
LEFT JOIN STU S2 ON S1.HEIGHT < S2.HEIGHT
GROUP BY S1.STUNO, S1.NAME, S1.GRADE, S1.HEIGHT;

