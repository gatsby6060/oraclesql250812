--프로시저는 1개 테이블을 목표로 만든다. (펑션은 광범위)

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (P_EMPNO IN EMP.EMPNO%TYPE) -- EMP테이블의 EMPNO와 같은 타입으로 선언
IS
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * 1.1
    WHERE EMPNO = P_EMPNO;
END;
/


SELECT * FROM EMP;

-- 프로시저 실행 => EXCUTE 프로시저명()
EXECUTE UPDATE_EMP_SAL(7369); -- 이러면 테이블을 업데이트 해버린다.

--프로시저에서 파라미터 하나더 받아서 그 배율만큼 급여가 증가하도록

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (P_EMPNO IN EMP.EMPNO%TYPE,
     P_MAG IN NUMBER
    ) -- EMP테이블의 EMPNO와 같은 타입으로 선언
IS
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * P_MAG
    WHERE EMPNO = P_EMPNO;
    COMMIT;
END;
/


SELECT * FROM EMP;
EXECUTE UPDATE_EMP_SAL(7369,1.0); 


ROLLBACK;






CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (
     P_EMPNO IN EMP.EMPNO%TYPE,
     P_MAG IN NUMBER
    ) -- EMP테이블의 EMPNO와 같은 타입으로 선언
IS
    P_COUNT NUMBER; -- 프로시져 내부 변수 선언   오라클에서의 그냥 '=' 은 비교이다 값을 넣을려면 := 이다.
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * P_MAG
    WHERE EMPNO = P_EMPNO;
    P_COUNT := SQL%ROWCOUNT; --오른쪽 값을 왼쪽에 넣을려면 := 이다.    --오라클에서의 그냥 '=' 은 비교이다
                            -- SQL%ROWCOUNT 는 몇개 로우에 영향을 주었는지 리턴함
    
    IF P_COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('사번을 다시 확인해주세요.');  -- 오라클 프린트문
    ELSIF P_COUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('정상적으로 저장되었습니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('2개 이상이 저장되었습니다.'); -- PK가 조건이므로 ... 이거 실행되면 이상함
    END IF;
                            
    COMMIT;
END;
/

SET SERVEROUTPUT ON;  
--프린트문 보이게 하기


EXECUTE UPDATE_EMP_SAL (7369,1.2);

