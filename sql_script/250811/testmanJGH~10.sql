-- 2. 문자 함수
-- 1) CONCAT - 문자열 결합(||)

SELECT CONCAT(STU_NAME, STU_DEPT)
FROM STUDENT;

--SELECT CONCAT(CONCAT(STU_NAME, ' '),STU_DEPT)
--FROM STUDENT;

SELECT STU_NAME || ' - ' || STU_DEPT
FROM student;

-- 2) LENGTH - 문자열 길이
SELECT STU_DEPT, LENGTH(STU_DEPT)
FROM STUDENT;

-- 3) SUBSTR - 문자열 자르기(특정 부분 추출)
--자바에서는..."HELLO WORD".subString(2,6) 인덱스2345 로 추출됨
SELECt SUBSTR('hello oracle',1,5)  --시작위치1부터 부터 몇개까지 출력할것인가 12345 출력
from dual;

select NAME ,substr(jumin, 1,6) as 생년월일 
from stu;

SELECT NAME , 
       DECODE(SUBSTR(JUMIN, 7,1),1,'남','여') AS 성별 -- DECODE는 자바의 IF문 비슷함 
FROM STU;


-- DECODE - 자바의 IF문 과 비슷한 문법
SELECT 
    NAME,
    SUBSTR(JUMIN,7,1),
    DECODE(SUBSTR(JUMIN,7,1),1,'남','여')
FROM STU;


-- UPPER, LOWER -- 대문자, 소문자로 변경
SELECT 
    UPPER('Hello Oracle'),
    LOWER('Hello Oracle')
FROM DUAL;


-- INSTR - 특정 문자열이 처음으로 몇번째에 나오는지 
SELECT EMAIL, INSTR(EMAIL, '@') 
FROM PROFESSOR;


-- REPLACE - 문자열을 다른 문자열로 대체
SELECT EMAIL, REPLACE(EMAIL, 'net', 'com') 
FROM PROFESSOR;


-- TRIM - 공백제거
SELECT 
    TRIM('  Hello Oracle    '),
    LTRIM('  Hello Oracle    '),
    RTRIM('  Hello Oracle    ')
FROM DUAL;

-- LPAD, RPAD -- 왼쪽 OR 오른쪽에 지정한 길이만큼 특정 문자 채우기
SELECT 
    LPAD(ID, 10, '*'),
    RPAD(ID, 10, '*')
FROM STU;


----
-- stu테이블의 id끝에 3글자만  ***로 표시
-- RPAD SUBSTR LENGTH
select * from stu;

SELECT 
    id as id,
    substr(id, 0, LENGTH(id)-3) || ('***') as id_1
FROM STU;


SELECT 
    ID,
    substr(id, 0, LENGTH(ID)-3) || ('***'),
    RPAD(substr(id, 0, LENGTH(ID)-3), LENGTH(ID), '*')
FROM STU;


