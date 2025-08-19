-- 트리거
-- 특정 테이블(선택된 테이블)에 변화가 생겼을 때 (INSERT, DELETE, UPDATE)
-- 실행되는 프로시저

CREATE OR REPLACE TRIGGER TRIGGER_SAMPLE1
    BEFORE -- 트리거 실행 시점(BEFORE OR AFTER) 보통 BEFORE로 함
    UPDATE OR INSERT ON EMP -- EMP테이블에 UPDATE INSERT가 발생했을 때 실행하겠다
    FOR EACH ROW -- 옵션, 각 행별로 트리거를 실행할 것인가.
                 -- (ex, UPDATE가 3개의 행에 영향을 준다면 트리거도 3번실행하겠다) 없으면 1번만 되서 문제?가 됨
BEGIN
    DBMS_OUTPUT.PUT_LINE('변경 전 : ' || :OLD.SAL);  -- 업데이트 전 값
    DBMS_OUTPUT.PUT_LINE('변경 후 : ' || :NEW.SAL);  -- 업데이트 후 값
END;
/

SELECT * FROM EMP;

UPDATE EMP
SET SAL = SAL+100
WHERE EMPNO = '7499';