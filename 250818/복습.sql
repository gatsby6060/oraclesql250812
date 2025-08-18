

SELECT TO_CHAR(CDATETIME, 'YYYY-MM-DD HH24:MI:SS') 
FROM TBL_USER; 

SELECT TITLE, CONTENTS, NICKNAME, B.USERID
FROM TBL_BOARD B
INNER JOIN TBL_USER U ON B.USERID=U.USERID
ORDER BY BOARDNO;


-- 각 유저가 작성한 게시글의 수? 유저아이디 이름 게시글 게수
SELECT USERID, COUNT(*)
FROM TBL_BOARD 
GROUP BY USERID;

SELECT * FROM TBL_USER;

SELECT B.USERID, U.NAME, COUNT(*) AS CNT
FROM TBL_BOARD B
LEFT JOIN TBL_USER U ON B.USERID=U.USERID
GROUP BY B.USERID,U.NAME;

SELECT * FROM TBL_USER;
SELECT * FROM TBL_BOARD;

-- 각 유저가 작성한 게시글의 수? 유저아이디 이름 게시글 게수
SELECT U.USERID, U.NAME, COUNT(BOARDNO) AS CNT
FROM TBL_USER U
LEFT JOIN TBL_BOARD B ON U.USERID=B.USERID
GROUP BY U.USERID,U.NAME;



SELECT * 
FROM TBL_USER;

SELECT * 
FROM TBL_COMMENT;
--각 유저가 작성한 댓글의 수 (출력컬럼 : 유저아이디, 이름, 댓글개수)
SELECT U.USERID, U.NAME, COUNT(COMMENTNO)
FROM TBL_USER U
LEFT JOIN TBL_COMMENT C ON u.userid = c.userid
GROUP BY U.USERID, U.NAME;

SELECT U.USERID, U.NAME, COUNT(COMMENTNO)
FROM TBL_USER U
LEFT JOIN TBL_COMMENT C ON U.USERID = C.USERID
GROUP BY U.USERID, U.NAME;




-- TBL_USER, TBL_BOARD, TBL_COMMENT
--1. 아이디에 user가 들어가는 사람이 작성한 게시글의 수를 구하시오.
--2. USER의 핸드폰 번호 가운데를 *로 처리하시오.
--(ex, 010-****-5678)
--3. 게시글에 좋아요 개수가 가장 큰 게시글을 작성한 사람의 아이디, 이름, 좋아요개수를 출력하시오.
--4. 게시글 번호, 제목, 내용, 작성자 닉네임, 댓글 수(없으면 0)를 출력하시오.
--5. 조회수가 가장 큰 게시글의 게시글 번호, 제목, 작성자 닉네임을 출력하시오.





-- TBL_USER, TBL_BOARD, TBL_COMMENT
--1. 아이디에 user가 들어가는 사람이 작성한 게시글의 수를 구하시오.
--SELECT USERID FROM TBL_USER WHERE USERID LIKE '%user%';
SELECT COUNT(BOARDNO) FROM TBL_BOARD WHERE USERID LIKE '%user%';
--SELECT * FROM TBL_BOARD;
SELECT COUNT(*)
FROM TBL_BOARD
WHERE USERID LIKE '%user%';



--2. USER의 핸드폰 번호 가운데를 *로 처리하시오.
--(ex, 010-****-5678)
SELECT * FROM TBL_USER;
SELECT 
SUBSTR(PHONE,1,4)||
('****')||
SUBSTR(PHONE,9,5) AS PHONE 
FROM TBL_USER; 

SELECT SUBSTR(PHONE,1,INSTR(PHONE,'-')) || '****'  || SUBSTR(PHONE,INSTR(PHONE,'-')+5,5)     --INSTR(PHONE,'-') 
FROM TBL_USER;


--3. 게시글에 좋아요 개수가 가장 큰 게시글을 작성한 사람의 아이디, 이름, 좋아요개수를 출력하시오

SELECT U.USERID, U.NAME,T.FAVORITE 
FROM TBL_USER U 
INNER JOIN (
            SELECT * FROM TBL_BOARD 
            WHERE FAVORITE =(
                SELECT MAX(FAVORITE) 
                FROM TBL_BOARD)     ) T
            ON U.USERID = T.USERID;


--SELECT USERID, MAX(FAVORITE) 
--FROM TBL_BOARD 
--GROUP BY USERID, TBL_BOARD 
--ORDER BY FAVORITE DESC;
--
--SELECT * FROM TBL_BOARD; 

--4. 게시글 번호, 제목, 내용, 게시글 작성자 닉네임, 댓글 수(없으면 0)를 출력하시오.
SELECT B.BOARDNO, B.TITLE, B.CONTENTS, u.nickname, COUNT(c.commentno) AS 댓글개수
FROM tbl_board B
INNER JOIN tbl_user U ON B.USERID= U.USERID
LEFT JOIN tbl_comment C ON B.BOARDNO = c.BOARDNO
GROUP BY B.BOARDNO, B.TITLE, B.CONTENTS, u.nickname;

SELECT B.BOARDNO, TITLE, B.CONTENTS, NICKNAME, COUNT(COMMENTNO) AS 댓글개수
FROM TBL_BOARD B
INNER JOIN TBL_USER U ON B.USERID = U.USERID
LEFT JOIN TBL_COMMENT C ON B.BOARDNO =C.BOARDNO
GROUP BY B.BOARDNO, TITLE, B.CONTENTS, NICKNAME;


--5. 조회수가 가장 큰 게시글의 게시글 번호, 제목, 작성자 닉네임을 출력하시오.

SELECT T.boardno, T.title, u.nickname 
FROM TBL_USER U
INNER JOIN
        (SELECT BOARDNO, TITLE, USERID
        FROM TBL_BOARD 
        WHERE CNT =(  
                SELECT MAX(CNT) 
                FROM TBL_BOARD)) T
        ON U.USERID = T.USERID  ;



SELECT U.USERID, NAME, FAVORITE
        FROM TBL_BOARD B
        INNER JOIN TBL_USER U ON B.USERID = U.USERID
        WHERE CNT =(  
                SELECT MAX(CNT) 
                FROM TBL_BOARD);
                
SELECT REPLACE(PHONE, SUBSTR(PHONE, 5,4), '****')
FROM TBL_USER;