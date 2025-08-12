-- 오라클에서 조건 처리
-- 페이+보너스의 합이 300이상인 사람을 구하세요
SELECT PAY, BONUS, PAY+BONUS
FROM PROFESSOR;

-- NVL (널이면 0으로 )
SELECT NAME, BONUS, NVL(BONUS, 0)
FROM PROFESSOR;

-- 페이+보너스의 합이 300이상인 사람을 구하세요.
SELECT *
FROM PROFESSOR
WHERE PAY+NVL(BONUS, 0) >= 300;
--오라클은 널하고 더하면 널이되니까 이렇게 한다.

-- NVL2 (널이 아니면 1000 널이면 0)
SELECT BONUS, NVL2(BONUS, 1000, 0)
FROM PROFESSOR;

------------------------------------------------------------

SELECT * 
FROM STU;

SELECT NAME, SUBSTR(JUMIN,7,1) AS 성별
FROM STU;

-- DECODE -- 자바의 조건문(IF)
-- DECODE(컬럼명, '값', '조건값이 컬럼값이랑 동일할 때 출력할 값', '조건 만족 안했을 때 출력할 값')
SELECT DECODE(JOB,'MANAGER','매니저!','그외') FROM EMP;
SELECT NAME, SUBSTR(JUMIN,7,1) AS 성별 
FROM STU;

SELECT NAME, DECODE(SUBSTR(JUMIN,7,1),1,'남자','여자') AS 성별 
FROM STU;

SELECT 
    ENAME, 
    JOB, 
    DECODE(JOB,'MANAGER','매니저!','SALESMAN','세일즈맨!','그외')
FROM EMP;


-- 주민번호가 7번째가 1 3 이면 남자 2 4면 여자
SELECT NAME, DECODE(SUBSTR(JUMIN,7,1),   1,'남자',2,'여자',3,'남자',4,'여자',   '어딘가중간쯤성별') AS 성별 
FROM STU;

-- 주민번호가 7번째가 1 3 이면 남자 2 4면 여자
SELECT NAME, DECODE(SUBSTR(JUMIN,7,1),   1,'남자',3,'남자',   '여성') AS 성별 
FROM STU;



-- CASE ~ WHEN (DECODE보다 좀더 복잡한 처리 가능한 IF문)

SELECT * FROM PROFESSOR;
SELECT
    PAY,
    CASE
        WHEN PAY >= 500 THEN '고소득'
        WHEN PAY BETWEEN 300 AND 500 THEN '적당히 받음'
        ELSE '화이팅'
    END 급여정보
FROM PROFESSOR;



