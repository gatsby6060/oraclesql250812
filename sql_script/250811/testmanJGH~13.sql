CREATE TABLE EMP(
  EMPNO NUMBER(4) NOT NULL,
  ENAME VARCHAR2(10),
  JOB VARCHAR2(9),
  MGR NUMBER(4),
  HIREDATE DATE,
  SAL NUMBER(7, 2),
  COMM NUMBER(7, 2),
  DEPTNO NUMBER(2)
);

INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',     7902,    TO_DATE('17-12-1980', 'DD-MM-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  7698,    TO_DATE('20-02-1981', 'DD-MM-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  7698,    TO_DATE('22-02-1981', 'DD-MM-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   7839,    TO_DATE('02-04-1981', 'DD-MM-YYYY'),  1500, NULL, 20);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  7698,    TO_DATE('28-09-1981', 'DD-MM-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   7839,    TO_DATE('01-05-1981', 'DD-MM-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   7839,    TO_DATE('09-06-1981', 'DD-MM-YYYY'),  3000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   7566,    TO_DATE('09-12-1982', 'DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    TO_DATE('17-11-1981', 'DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  7698,    TO_DATE('08-09-1981', 'DD-MM-YYYY'),  1500, NULL, 30);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',     7788,    TO_DATE('12-01-1983', 'DD-MM-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',     7698,    TO_DATE('03-12-1981', 'DD-MM-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   7566,    TO_DATE('03-12-1981', 'DD-MM-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',     7782,    TO_DATE('23-01-1982', 'DD-MM-YYYY'), 1300, NULL, 10);

CREATE TABLE DEPT (
  DEPTNO NUMBER(2),
  DNAME VARCHAR2(14),
  LOC VARCHAR2(13) 
);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE SALGRADE(
  GRADE NUMBER,
  LOSAL NUMBER,
  HISAL NUMBER
);

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);
COMMIT;





select * from EMP;
select * from salgrade;
select * from dept;


--EMP 테이블 참고 정보
-- EMPNO(사번), ENAME(직원이름), JOB(직급), MGR(팀장OR사수의 사번), 
-- HIREDATE(입사일), SAL(급여), COMM(커미션, 보너스), DEPTNO(부서번호)


--문자 함수 관련 연습문제
--1. ENAME 열에서 모든 이름을 소문자로 변경하여 출력해 보시오.
--2. ENAME 열에서 'SMITH'를 찾고, 그 값을 'JOHN'으로 변경하여 출력해 보시오.
--3. JOB 열에서 'SALESMAN'만 추출하고, 해당 컬럼(SALESMAN)의 길이를 구해 보시오.
--4. ENAME 열에서 이름의 첫 글자만 대문자로 변경하여 출력해 보시오.
--5. ENAME 열에서 이름의 마지막 3글자를 추출하여 출력해 보시오.
--6. JOB 열의 값 중 'MANAGER'로 시작하는 직책을 가진 사람들의 수를 구해 보시오.
--7. ENAME과 JOB 열을 합쳐서 'ENAME(JOB)' 형태로 출력해 보시오.
--8. ENAME 열에서 'A'가 포함된 모든 사람의 이름을 추출해 보시오.
--
--숫자 함수 관련 연습문제
--1. 모든 직원의 SAL 값에 10%를 추가한 값을 출력해 보시오.
--2. SAL 값이 1500 이상인 직원들의 평균 급여를 구해 보시오.
--3. 각 부서(DEPTNO)별로 급여의 총합을 구해 보시오.
--4. SAL 값이 1300 이상이면서 부서번호가 20인 직원들의 평균 급여를 구해 보시오.
--5. 각 부서별로 급여가 가장 높은 직원의 이름을 구해 보시오.
--6. 직원들의 급여를 오름차순으로 정렬하시오.
--
--날짜 함수 관련 연습문제
--1. HIREDATE에서 직원이 입사한 년도를 추출하여 출력해 보시오.
--2. HIREDATE가 1981년 1월 1일 이후인 직원들의 이름을 출력해 보시오.
--3. 입사일이 1981년 5월 1일 이전인 직원들의 이름과 입사일을 출력해 보시오.
--
--그룹 함수 관련 연습문제
--1. 각 부서별 평균 급여를 출력.
--2. 각 부서별 인원 출력.
--3. 각 부서에서 급여가 1500이상인 사람의 부서별 사람 수 출력(부서명, 사람수 출력)




















--EMP 테이블 참고 정보
-- EMPNO(사번), ENAME(직원이름), JOB(직급), MGR(팀장OR사수의 사번), 
-- HIREDATE(입사일), SAL(급여), COMM(커미션, 보너스), DEPTNO(부서번호)


--문자 함수 관련 연습문제
--1. ENAME 열에서 모든 이름을 소문자로 변경하여 출력해 보시오.
select LOWER(ename) from emp;
--2. ENAME 열에서 'SMITH'를 찾고, 그 값을 'JOHN'으로 변경하여 출력해 보시오.
select ename,
DECODE(ename,'SMITH','JOHN','?')
from emp 
where ename = 'SMITH';

SELECT REPLACE(ENAME, 'SMITH','JOHN')
FROM EMP
WHERE ENAME = 'SMITH';

--3. JOB 열에서 'SALESMAN'만 추출하고, 해당 컬럼(SALESMAN)의 길이를 구해 보시오.
select length(JOB) 
from emp 
where job = 'SALESMAN';

SELECT E.*, LENGTH(JOB) AS 길이
FROM EMP E
WHERE JOB = 'SALESMAN';


--4. ENAME 열에서 이름의 첫 글자만 대문자로 변경하여 출력해 보시오.
select SUBSTR(ename,1,1)||LOWER(SUBSTR(ename,2,length(ename))) from emp;

SELECT SUBSTR(ENAME, 1, 1) || LOWER(SUBSTR(ENAME, 2, LENGTH(ENAME)-1))
FROM EMP;


--5. ENAME 열에서 이름의 마지막 3글자를 추출하여 출력해 보시오.
select substr(ename, length(ename)-2, length(ename) ) from emp;

SELECT SUBSTR(ENAME, LENGTH(ENAME)-2, 3) 
FROM EMP;

--6. JOB 열의 값 중 'MANAGER'로 시작하는 직책을 가진 사람들의 수를 구해 보시오.
select count(*) from emp where job = 'MANAGER';

SELECT COUNT(*)
FROM EMP
WHERE JOB = 'MANAGER';

--7. ENAME과 JOB 열을 합쳐서 'ENAME(JOB)' 형태로 출력해 보시오.
select (ename || '(' ||job ||')') as "ENAME(JOB)" from emp;

SELECT ENAME || '(' || JOB || ')'
FROM EMP;

--8. ENAME 열에서 'A'가 포함된 모든 사람의 이름을 추출해 보시오.

select * from emp where ename like '%A%';

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%A%';

--
--숫자 함수 관련 연습문제
--1. 모든 직원의 SAL 값에 10%를 추가한 값을 출력해 보시오.
select SAL+(SAL*0.1) from emp;

SELECT SAL * 1.1
FROM EMP;

--2. SAL 값이 1500 이상인 직원들의 평균 급여를 구해 보시오.
select avg(sal) from emp where sal >= 1500;

SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1500;

--3. 각 부서(DEPTNO)별로 급여의 총합을 구해 보시오.
select deptno,sum(deptno) from emp group by deptno;

SELECT DEPTNO , SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

--4. SAL 값이 1300 이상이면서 부서번호가 20인 직원들의 평균 급여를 구해 보시오.
select avg(sal) from emp where sal > 1300 and deptno = 20;

SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1300 AND DEPTNO = 20;


--5. 각 부서별로 급여가 가장 높은 직원의 이름을 구해 보시오.
select max(sal),deptno from emp group by deptno; ---------------------s
(select * from emp where deptno = 20 and sal = 3000) ||  -- SCOTT FROD
(select * from emp where deptno = 30 and sal = 2850) ||  -- BLAKE
(select * from emp where deptno = 10 and sal = 5000);   --KING

select * from emp where deptno = 20 and sal = 3000;   
select * from emp where deptno = 30 and sal = 2850;   
select * from emp where deptno = 10 and sal = 5000;   

select ENAME,deptno 
from emp 
(deptno = 20 and sal = 3000)OR(deptno = 30 and sal = 2850)OR(deptno = 10 and sal = 5000);

--select deptno,ename from emp where sal in (select max(sal) from emp group by deptno);
select * from emp;


--6. 직원들의 급여를 오름차순으로 정렬하시오.
select * from emp order by sal;

SELECT *
FROM EMP
ORDER BY SAL ASC;

--날짜 함수 관련 연습문제
--1. HIREDATE에서 직원이 입사한 년도를 추출하여 출력해 보시오.
select substr(hiredate,1,2) from EMP;
select * from emp;

--2. HIREDATE가 1981년 1월 1일 이후인 직원들의 이름을 출력해 보시오.
select ename from emp where hiredate > TO_DATE('1981-01-01','YYYY-MM-DD');
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY')
FROM EMP;
SELECT * 
FROM EMP
WHERE HIREDATE >= TO_DATE('1981/01/01','YYYY/MM/DD');

--3. 입사일이 1981년 5월 1일 이전인 직원들의 이름과 입사일을 출력해 보시오.
select ename, hiredate from emp where hiredate < TO_DATE('1981-05-01','YYYY-MM-DD');
SELECT * 
FROM EMP
WHERE HIREDATE < TO_DATE('1981/01/01','YYYY/MM/DD');

--그룹 함수 관련 연습문제
--1. 각 부서별 평균 급여를 출력.
select avg(sal),deptno from emp group by deptno;
select * from emp;
SELECT DEPTNO, ROUND(AVG(SAL),2)
FROM EMP
GROUP BY DEPTNO;
--2. 각 부서별 인원 출력.
select count(*),deptno from emp group by deptno;
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO;

--3. 각 부서에서 급여가 1500이상인 사람의 부서별 사람 수 출력(부서명, 사람수 출력)
select deptno, count(*) 
from emp where sal > 1500 
group by deptno ;

SELECT DEPTNO, COUNT(*)
FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO
HAVING COUNT(*)>=3;



select emp.deptno, count(*), dept.dname 
from emp, dept
where sal > 1500
and dept.deptno=emp.deptno
group by emp.deptno, dept.dname;

select * from dept;

select * from dept;


