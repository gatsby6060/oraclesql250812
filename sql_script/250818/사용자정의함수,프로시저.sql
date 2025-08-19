-- PL/SQL
-- 사용자 정의 함수, 프로시저, 트리거

-- OR REPLACE는 선택
-- 기존에 함수명(MULTI)가 정의 되어 잇으면 아래 내용으로 수정하겠다.
-- 선언부(선택), 실행부, 예외처리(선택)
-- 마지막은 '/'로 마무리
CREATE OR REPLACE FUNCTION  
    MULTI(P_VALUE IN NUMBER)
RETURN NUMBER
IS
BEGIN
 RETURN P_VALUE * 2;
END;
/

select MULTI(10)
from dual;
select sal, MULTI(sal) 급여가두배
from emp;

-- DATE를 받아서 'YYYY-MM-DD HH24:MI:SS' 형태로 리턴
create or replace FUNCTION DATE_FUNC
    (P_DATE IN DATE)
RETURN VARCHAR2
IS
BEGIN
 RETURN TO_CHAR(P_DATE, 'YYYY-MM-DD HH24:MI:SS');
END;
/

SELECT * FROM TBL_BOARD;

UPDATE TBL_BOARD
SET UDATETIME = SYSDATE
WHERE BOARDNO IN(1,3,4,5);

COMMIT;

SELECT 
TITLE,
DATE_FUNC(UDATETIME),
TO_CHAR(UDATETIME, 'YYYY-MM-DD HH24:MI:SS')
FROM TBL_BOARD;

-- DATE_FUNC2(DATE, 'DATETIME') -> 'YYYY-MM-DD HH24:MI:SS'
-- DATE_FUNC2(DATE, 'DATE') -> 'YYYY-MM-DD '
-- DATE_FUNC2(DATE, 'TIME') -> ' HH24:MI:SS'

create or replace FUNCTION DATE_FUNC2
 (
     P_DATE IN DATE,
     P_KEY IN VARCHAR2
 )
RETURN VARCHAR2
IS
BEGIN
    IF P_KEY = 'DATETIME' THEN
        RETURN TO_CHAR(P_DATE, 'YYYY-MM-DD HH24:MI:SS');
    ELSIF P_KEY = 'DATE' THEN
        RETURN TO_CHAR(P_DATE, 'YYYY-MM-DD');
    ELSIF P_KEY = 'TIME' THEN
        RETURN TO_CHAR(P_DATE, 'HH24:MI:SS');
    ELSE
        RETURN '키값 확인 바람';
    END IF;
END;
/

SELECT 
    DATE_FUNC2(UDATETIME, 'DATETIME') || ' ',
    DATE_FUNC2(UDATETIME, 'DATE') || ' ',
    DATE_FUNC2(UDATETIME, 'TIME')
FROM TBL_BOARD;

COMMIT;



-- 아래 조건을 만족하는 SCORE_FUNC 함수 만들기
-- SCORE_FUNC(숫자) 호출 시
-- 숫자가 90이상이면 A, 80이상이면 B, 70이상이면 C 그 외 숫자면 'D' 출력
-- 100 초과, 0미만 숫자가 입력되면 '잘못된 숫자' 출력


CREATE or REPLACE FUNCTION SCORE_FUNC
 (
     P_SCORE IN VARCHAR2
 )
RETURN VARCHAR2
IS
BEGIN
    IF P_SCORE > 100 OR P_SCORE < 0 THEN
        RETURN '잘못된 숫자';
    ELSIF P_SCORE >= 90 THEN
        RETURN 'A';
    ELSIF P_SCORE >= 80 THEN
        RETURN 'B';
    ELSIF P_SCORE >= 70 THEN
        RETURN 'C';
    ELSE
        RETURN 'D';
    END IF;
END;
/

COMMIT;

SELECT STU_NAME, ENR_GRADE, SCORE_FUNC(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;

SELECT SCORE_FUNC(99)
FROM DUAL;

-- 위 쿼리로 결과 확인
​