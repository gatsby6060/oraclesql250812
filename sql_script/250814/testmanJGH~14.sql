--OUTER 조인
--LEFT, RIGHT | LEFT만 알면 대부분 된다.

SELECT * 
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO;

-- 각 학생들이 시험을 본 개수 출력
-- 이름, 개수 출력. 단 시험을 하나도 보지 않았으면 개수는 0으로 출력

SELECT S.STU_NO, STU_NAME, COUNT(ENR_GRADE)
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME;

SELECT * FROM STUDENT;
20141007	진현무
20142021	심수정


------------------------------------------

SELECT * FROM EMP;

-- 각 직원의 부하직원 수를 구하기. 단 없으면 0으로 출력
-- 출력 컬럼 : 사번, 이름, 부하직원 수

SELECT 
E1.EMPNO, 
COUNT(E1.EMPNO)
FROM EMP E0
LEFT JOIN EMP E1 ON E0.MGR = E1.EMPNO
GROUP BY   E1.EMPNO
ORDER BY  E1.EMPNO;


SELECT EMPNO, ENAME, NVL(CNT123,0) AS CNT
FROM EMP E
LEFT JOIN (
        SELECT MGR, COUNT(*) CNT123
        FROM EMP
        GROUP BY MGR
    )T ON E.EMPNO = T.MGR
ORDER BY CNT DESC;


----
--학번, 학생이름, 담당교수 이름 출력
--단, 담당교수가 없으면 담당교수 이름을 '담당교수없음'으로 출력
SELECT 
* FROM STU;

SELECT STUNO, S.NAME
FROM STU S
INNER JOIN PROFESSOR P ON S.PROFNO = P.PROFNO;

SELECT S.STUNO, S.NAME, NVL(P.NAME, '담당교수없음') 교수이름
FROM STU S
LEFT JOIN PROFESSOR P ON S.PROFNO = P.PROFNO;

-- STUDENT
-- 1. 학생들의 시험 평균 점수 출력.
-- 단, 시험을 보지 않은 학생은 '성적없음' 출력
SELECT * FROM ENROL ;
SELECT * FROM STUDENT ;

SELECT S.STU_NO , NVL(TO_CHAR(AVG(ENR_GRADE)), '성적없음')  평균점수
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO; 