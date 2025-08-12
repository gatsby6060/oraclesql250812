SELECT * 
FROM PROFESSOR
WHERE BONUS IS NOT NULL;
-- IN, LIKE, BETWEEN

-- 서브쿼리(쿼리안에 또다른 쿼리)
SELECT MAX(STU_HEIGHT)
FROM STUDENT;

SELECT * 
FROM STUDENT
WHERE STU_HEIGHT = (
    SELECT MAX(STU_HEIGHT)
    FROM STUDENT
);

-- 학생들의 전체 평균 키보다 큰 키를 가진 학생 출력

SELECT * 
FROM STUDENT
WHERE STU_HEIGHT > (
    SELECT AVG(STU_HEIGHT)
    FROM STUDENT
);








--1. 81년도에 입사한 교수들의 목록을 출력하시오. (PROFESSOR)
--2. 학번이 94, 95학번(STUNO의 첫 2글자)인 학생들의 평균 키를 구하시오. (STU)
--3. EMAIL을 *****@abc.net형태로 출력하시오. (PROFESSOR)
--	 조건) *의 개수는 @앞의 글자 개수와 같아야 함.
--4. 학생들의 남,녀 학생수를 아래 이미지와 같이 구하시오. (STU)
--   조건) 성별은 JUMIN 컬럼의 7번째 숫자를 기준으로 1이면 '남자' 2면 '여자'



--1. 81년도에 입사한 교수들의 목록을 출력하시오. (PROFESSOR)
SELECT * 
FROM PROFESSOR;

SELECT * 
FROM PROFESSOR
WHERE SUBSTR(HIREDATE,1,2) = 81;

SELECT * 
FROM PROFESSOR
WHERE TO_CHAR(HIREDATE, 'YY') = 81;

--2. 학번이 94, 95학번(STUNO의 첫 2글자)인 학생들의 평균 키를 구하시오. (STU)

SELECT * 
FROM STU;

SELECT AVG(HEIGHT)
FROM STU
WHERE SUBSTR(STUNO,1,2) IN (94 , 95);

SELECT AVG(HEIGHT)
FROM STU
WHERE SUBSTR(STUNO,1,2) IN (94,95);

--3. EMAIL을 *****@abc.net형태로 출력하시오. (PROFESSOR)
--	 조건) *의 개수는 @앞의 글자 개수와 같아야 함.
SELECT 
* 
FROM professor;

SELECT  
--        DECODE(SUBSTR(EMAIL, INSTR(EMAIL, '@'),1),'@',       replace(SUBSTR(EMAIL, 1,INSTR(EMAIL,'@')-1),'a' ,'*')          ,'')
--        ||
        DECODE(SUBSTR(EMAIL, INSTR(EMAIL, '@'),1),'@',      SUBSTR(EMAIL, 1,INSTR(EMAIL,'@')-1)          ,'')
        ||
        DECODE(SUBSTR(EMAIL, INSTR(EMAIL, '@'),1),'@', SUBSTR(EMAIL,INSTR(EMAIL,'@'),LENGTH(EMAIL))   ,'') 
FROM professor;


SELECT 
    INSTR(EMAIL,'@'),
    SUBSTR(EMAIL, INSTR(EMAIL,'@'), LENGTH(EMAIL)), --@ 부터 끝까지 출력
    LPAD(SUBSTR(EMAIL, INSTR(EMAIL,'@'), LENGTH(EMAIL)), LENGTH(EMAIL), '*')  --LPAD함수가 중요....
FROM PROFESSOR;



-- DECODE - 자바의 IF문 과 비슷한 문법
--SELECT 
--    NAME,
--    SUBSTR(JUMIN,7,1),
--    DECODE(SUBSTR(JUMIN,7,1),1,'남','여')
--FROM STU;


--4. 학생들의 남,녀 학생수를 아래 이미지와 같이 구하시오. (STU)
--   조건) 성별은 JUMIN 컬럼의 7번째 숫자를 기준으로 1이면 '남자' 2면 '여자'

SELECT * FROM STU;


--SELECT count(JUMIN),
--DECODE( SUBSTR(JUMIN,7,1),  1, '남자'   , '여자' ) 
--FROM STU
--group by DECODE( SUBSTR(JUMIN,7,1),  1, '남자'   , '여자' ) ;


SELECT 
count( DECODE( SUBSTR(JUMIN,7,1),  1, 1   , '' ) ) as 남자,
count( DECODE( SUBSTR(JUMIN,7,1),  2, 1   , '' ) ) as 여자
FROM STU;


SELECT 
--    SUBSTR(JUMIN,7,1), --주민번호 7번쨰 숫자 1 OR 2
--    DECODE(SUBSTR(JUMIN,7,1),1,'남자',NULL), -- 7번째가 1이면 남자 아니면 NULL이 출력 NULL은 생략가능
--    DECODE(SUBSTR(JUMIN,7,1),2,'여자'),
    COUNT(DECODE(SUBSTR(JUMIN,7,1),1,'남자',NULL)) 남자, -- 7번째가 1이면 남자 아니면 NULL이 출력 NULL은 생략가능
    COUNT(DECODE(SUBSTR(JUMIN,7,1),2,'여자')) 여자 -- count는 널이 아닌 것만 카운트 한다.
FROM STU;

SELECT 
   DECODE(SUBSTR(JUMIN,7,1),1,'남자',NULL) 남자, 
   DECODE(SUBSTR(JUMIN,7,1),2,'여자') 여자
FROM STU;


SELECT 
--    SUBSTR(JUMIN,7,1), --주민번호 7번쨰 숫자 1 OR 2
--    DECODE(SUBSTR(JUMIN,7,1),1,'남자',NULL), -- 7번째가 1이면 남자 아니면 NULL이 출력 NULL은 생략가능
--    DECODE(SUBSTR(JUMIN,7,1),2,'여자'),
    COUNT(DECODE(SUBSTR(JUMIN,7,1),1,'12345',NULL)) 남자, -- 7번째가 1이면 남자 아니면 NULL이 출력 NULL은 생략가능
    COUNT(DECODE(SUBSTR(JUMIN,7,1),2,'12345')) 여자 -- count는 널이 아닌 것만 카운트 한다.
FROM STU;