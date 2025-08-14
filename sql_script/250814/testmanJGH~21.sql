
INSERT INTO BOARD VALUES(1, '두번째게시글', '내용1111', 'test');

ROLLBACK;

CREATE SEQUENCE BOARD_SEQ
    INCREMENT BY 1 -- 증가 수
    START WITH 1 ;-- 시작 숫자 여기까지만도 충분함
--    MINVALUE 1 -- 시퀀스의 최소 값
--    MAXVALUE 99999 -- 최대 값
--    NOCYCLE; --반복여부

CREATE SEQUENCE TEST_SEQ
    INCREMENT BY 1 -- 증가 수
    START WITH 1 ;-- 시작 숫자 여기까지만도 충분함

-- 삭제용
-- DROP SEQUENCE BOARD_SEQ;

SELECT TEST_SEQ.NEXTVAL 
FROM DUAL; 

INSERT INTO BOARD
VALUES (BOARD_SEQ.NEXTVAL, '두번째 글', 'hhhh','TEST');

INSERT INTO BOARD
VALUES (BOARD_SEQ.NEXTVAL, '세번째 글', 'ABC','TEST');

COMMIT;

SELECT * FROM BOARD;