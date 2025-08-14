--함수, 조인, 서브쿼리 종합 연습문제

-- STUDENT, ENROL, SUBJECT 
-- 1. 성이 '김'씨인 학생들의 학번, 이름, 학과를 출력하시오.
-- 2. 15학번 학생들의 학번, 이름, 학과를 출력하시오.
-- 3. 컴퓨터정보 학과 학생들의 시험 평균 점수를 구하시오.
-- 4. 컴퓨터개론 수업을 듣는 학생의 학번, 이름, 학과, 시험점수를 구하시오.
-- 5. 학생들의 전체 평균 키보다 큰 키를 가진 학생들의 학번, 이름, 키를 출력하시오.
-- 6. 본인 학과의 평균 키보다 큰 학생들의 이름, 학과, 키, 학과 평균키 값 출력

-- EMP, SALGRADE, DEPT
-- 1. 급여 등급이 3이상인 사원의 사번, 이름, 급여등급을 출력하시오.
-- 2. 사번, 이름, 팀장(MGR)의 이름을 출력하시오.
-- 3. 부서별 가장 높은 급여를 받는 사원의 사번, 이름, 급여, 부서명을 출력하시오.
-- 4. 입사년도가 1981년도인 사원들의 급여 총합을 구하시오.

-- STU, PROFESSOR, DEPARTMENT
-- 1. 남자이면서(주민번호 7번째자리 1) 공과대학에 속한 학생의 수를 구하시오.
-- 2. 학생들의 아이디의 마지막 세글자를 '*' 로 채우시오
-- 3. 보너스+급여가 400 이하인 교수들의 이름, 아이디, 학과명을 출력하시오.
-- 4. 담당 학생이 2명이상인 교수의 이름, 아이디, 담당학생 수를 출력하시오.
-- 5. 가장 높은 급여를 받는 교수의 학과에 해당하는 학생 수 출력






--함수, 조인, 서브쿼리 종합 연습문제

-- STUDENT, ENROL, SUBJECT 
-- 1. 성이 '김'씨인 학생들의 학번, 이름, 학과를 출력하시오.
SELECT * FROM STUDENT;
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NAME LIKE'김%';

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE SUBSTR(STU_NAME,1,1) = '김';

-- 2. 15학번 학생들의 학번, 이름, 학과를 출력하시오.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NO LIKE '2015%';

SELECT *
FROM STUDENT
WHERE SUBSTR(STU_NO, 3,2)= 15;

-- 3. 컴퓨터정보 학과 학생들의 시험 평균 점수를 구하시오.
SELECT * FROM ENROL;
SELECT * FROM STUDENT;

SELECT AVG(ENR_GRADE) 
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE STU_DEPT = '컴퓨터정보';


SELECT AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE STU_DEPT = '컴퓨터정보';


-- 4. 컴퓨터개론 수업을 듣는 학생의 학번, 이름, 학과, 시험점수를 구하시오.
SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;
SELECT * FROM ENROL;

SELECT enro.stu_no, stu.stu_name, stu.stu_dept, enro.enr_grade
FROM ENROL ENRO
INNER JOIN SUBJECT SUBJ ON ENRO.SUB_NO = SUBJ.SUB_NO
INNER JOIN STUDENT STU ON enro.stu_no = stu.stu_no
WHERE SUBJ.SUB_NAME = '컴퓨터개론';

SELECT S.STU_NO, STU_NAME, STU_DEPT, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON E.SUB_NO = SUB.SUB_NO
WHERE SUB_NAME = '컴퓨터개론';


-- 5. 학생들의 전체 평균 키보다 큰 키를 가진 학생들의 학번, 이름, 키를 출력하시오.
SELECT S.STU_NO, S.STU_NAME, S.STU_WEIGHT 
FROM STUDENT S
WHERE S.stu_height > (
                            SELECT AVG(STU_HEIGHT) 
                            FROM STUDENT
                            );

SELECT AVG(STU_HEIGHT) 
FROM STUDENT;

SELECT *
FROM STUDENT
WHERE STU_HEIGHT > (
        SELECT AVG(STU_HEIGHT) 
        FROM STUDENT
);

-- 6. 본인 학과의 평균 키보다 큰 학생들의 이름, 학과, 키, 학과 평균키 값 출력
SELECT S.STU_NAME, S.stu_dept, S.stu_height ,T.AVG_HEI   -- 학과 평균키는 일단 패스~~~
FROM STUDENT S
INNER JOIN (SELECT STU_DEPT, AVG(stu_height) AS AVG_HEI
            FROM STUDENT
            GROUP BY STU_DEPT) T 
            ON s.stu_height > T.AVG_HEI
            AND s.stu_dept = T.STU_DEPT
GROUP BY S.STU_NAME, S.stu_dept, S.stu_height ,T.AVG_HEI  ;

SELECT STU_DEPT, AVG(stu_height) AS AVG_HEI
FROM STUDENT
GROUP BY STU_DEPT;



SELECT STU_DEPT, AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

SELECT STU_NAME, S.STU_DEPT , STU_HEIGHT, DEPT_AVG
FROM STUDENT S
INNER JOIN(
            SELECT STU_DEPT, AVG(STU_HEIGHT) DEPT_AVG
            FROM STUDENT
            GROUP BY STU_DEPT
) T ON S.STU_DEPT = T.STU_DEPT
WHERE S.STU_HEIGHT > DEPT_AVG;
--) T ON S.STU_DEPT = T.STU_DEPT AND S.STU_HEIGHT > DEPT_AVG;

-- EMP, SALGRADE, DEPT
-- 1. 급여 등급이 3이상인 사원의 사번, 이름, 급여등급을 출력하시오.
SELECT * 
FROM EMP;
SELECT * FROM salgrade WHERE GRADE >= 3;

SELECT E.EMPNO, E.ENAME, s.grade
FROM EMP E
INNER JOIN salgrade S ON e.sal BETWEEN s.losal AND s.hisal
WHERE S.GRADE >= 3 ;


SELECT EMPNO, ENAME, grade
FROM EMP E 
INNER JOIN salgrade S ON e.sal BETWEEN s.losal AND s.hisal
WHERE GRADE >=3; 

-- 2. 사번, 이름, 팀장(MGR)의 이름을 출력하시오.
SELECT * FROM EMP;
SELECT E1.EMPNO, E1.ENAME, E2.ENAME
FROM EMP E1 
INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

SELECT E.EMPNO, E.ENAME, E2.ENAME, E.MGR, E2.EMPNO
FROM EMP E
INNER JOIN EMP E2 ON E.MGR = E2.EMPNO;

-- 3. 부서별 가장 높은 급여를 받는 사원의 사번, 이름, 급여, 부서명을 출력하시오.
--EMP, SALGRADE, DEPT
SELECT * FROM DEPT;

SELECT ee.empno, ee.ename, ee.sal, T.dname  
FROM EMP EE
INNER JOIN (
            SELECT   D.DEPTNO, MAX(E.SAL) MAXSAL, D.DNAME 
            FROM EMP E
            INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
            GROUP BY  D.DEPTNO, D.DNAME
            ) T
            ON EE.SAL = T.MAXSAL AND EE.deptno = T.deptno;

SELECT MAX(E.SAL) 
FROM EMP E
GROUP BY E.DEPTNO;



SELECT E.EMPNO, ENAME, SAL
FROM EMP E 
INNER JOIN (SELECT MAX(SAL) 
            FROM EMP
            GROUP BY DEPTNO) T  ON SAL = T.MAXSAL AND deptno = T.depNO
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;
        --???위에것 치다가 오타?....

-- 4. 입사년도가 1981년도인 사원들의 급여 총합을 구하시오.

SELECT SUM(SAL) 
FROM EMP 
WHERE 1=1 
AND TO_CHAR(HIREDATE, 'YYYY') = '1981'
AND JOB = 'SALESMAN';



-- STU, PROFESSOR, DEPARTMENT
-- 1. 남자이면서(주민번호 7번째자리 1) 공과대학에 속한 학생의 수를 구하시오.
--STU, PROFESSOR, DEPARTMENT
SELECT * FROM DEPARTMENT;
SELECT * FROM STU;

SELECT COUNT(STUno) 
FROM STU
WHERE 1=1
AND SUBSTR(JUMIN,7,1) = 1
AND STU.DEPTNO1 IN (SELECT D1.deptno 
                FROM DEPARTMENT D1
                INNER JOIN DEPARTMENT D2 ON D1.PART = D2.DEPTNO
                INNER JOIN DEPARTMENT D3 ON D2.PART = D3.DEPTNO
                WHERE D3.DNAME ='공과대학');

SELECT * 
FROM DEPARTMENT
WHERE DNAME = '공과대학';

SELECT d1.deptno 
FROM DEPARTMENT D1
INNER JOIN DEPARTMENT D2 ON D1.PART = D2.DEPTNO
INNER JOIN DEPARTMENT D3 ON D2.PART = D3.DEPTNO
WHERE D3.DNAME ='공과대학';




SELECT COUNT(*)
FROM STU S
INNER JOIN DEPARTMENT D1 ON S.DEPTNO1 = D1.DEPTNO
INNER JOIN DEPARTMENT D2 ON D1.PART = D2.DEPTNO
INNER JOIN DEPARTMENT D3 ON D2.PART = D3.DEPTNO
WHERE SUBSTR(JUMIN,7,1) = 1 AND D3.DNAME = '공과대학';


-- 2. 학생들의 아이디의 마지막 세글자를 '*' 로 채우시오
SELECT * FROM STU;
SELECT   RPAD( SUBSTR(ID,1,LENGTH(ID)-3), LENGTH(ID) , '*'  )     
FROM STU;

SELECT SUBSTR(ID,1,LENGTH(ID)-3) || '***'
FROM STU;


-- 3. 보너스+급여가 400 이하인 교수들의 이름, 아이디, 학과명을 출력하시오.
-- STU, PROFESSOR, DEPARTMENT
SELECT PROFESSOR.NAME, PROFESSOR.ID, PROFESSOR.DEPTNO , department.dname
FROM PROFESSOR 
INNER JOIN DEPARTMENT ON PROFESSOR.deptno = department.deptno
WHERE PAY+BONUS <= 400;


SELECT NAME, ID ,DNAME, PAY + NVL(BONUS,0)
FROM PROFESSOR P
INNER JOIN DEPARTMENT D ON P.DEPTNO = D.DEPTNO
WHERE PAY + NVL(BONUS,0) <= 400;

-- 4. 담당 학생이 2명이상인 교수의 이름, 아이디, 담당학생 수를 출력하시오.

SELECT * FROM PROFESSOR;
SELECT * FROM STU;

SELECT P.NAME, COUNT( P.NAME)
FROM PROFESSOR P
INNER JOIN STU ON P.PROFNO = stu.profno
GROUP BY P.NAME
HAVING COUNT( P.NAME)>=2;


SELECT P.NAME, P.ID, COUNT(*) 
FROM STU S
INNER JOIN PROFESSOR P ON S.PROFNO = P.PROFNO
GROUP BY P.NAME, P.ID
HAVING COUNT(*) >= 2
;


-- 5. 가장 높은 급여를 받는 교수의 학과에 해당하는 학생 수 출력

SELECT COUNT(*) FROM STU 
WHERE DEPTNO1= (
                    SELECT DEPTNO 
                    FROM PROFESSOR WHERE PAY IN(
                                                SELECT MAX(PAY) FROM PROFESSOR P
                                               )
                );

SELECT DEPTNO
FROM PROFESSOR
WHERE PAY = (
    SELECT MAX(PAY) 
    FROM PROFESSOR P
);

SELECT COUNT(*)
FROM STU
WHERE DEPTNO1 = (
                    SELECT DEPTNO
                    FROM PROFESSOR
                    WHERE PAY = (
                        SELECT MAX(PAY) 
                        FROM PROFESSOR P
                    )
                );
                
SELECT COUNT(*)
FROM STU S --쪼인도 가능함
