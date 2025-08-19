select * from Book;
select * from Customer;
select * from Orders;

-- 1. 기본적인 INSERT, UPDATE, DELETE 문은 숙지할 것.
-- 2. 특정 컬럼 값의 위치에 *표 찍는거
-- 3. 기본적인 SELECT (기본 조건. 예를 들어 키가 170이상인 학생)
-- 4. 내장 함수(SUBSTR, REPLACE, ROUND 등) 
-- JOIN(INNER, OUTER), 그룹 함수, ROWNUM, 서브쿼리 등 4문제
-- 기본적인 조인부터 조인+서브쿼리+그룹함수 형태까지
-- 테이블은 새로운 테이블 만들어서 제공
-- 아래 수준의 문제를 풀 정도면 걱정 안해도 됨

-- BOOK, CUSTOMER, ORDERS
--1. BOOK 테이블에서 PRICE 가 20000 이상인 레코드를 출력하시오.
SELECT 
* 
FROM BOOK
WHERE PRICE >= 20000;
--2. BOOK 테이블에서 BOOKNAME 컬럼에 '야구' 가 들어간 레코드 출력하시오.
SELECT 
*
FROM BOOK
WHERE BOOKNAME LIKE '%야구%';

--3. BOOK 테이블에서 PUBLISHER 컬럼이 '굿스포츠'인 데이터를 BOOKNAME 컬럼 내림차순으로 출력하시오.
SELECT 
* 
FROM BOOK
WHERE PUBLISHER = '굿스포츠'
ORDER BY BOOKNAME DESC;

--4. BOOK 테이블에서 PRICE 가 5000이상 20000이하 데이터 출력하시오.
SELECT 
*
FROM BOOK
WHERE 1=1
AND PRICE >= 5000
AND PRICE <= 20000;

SELECT 
*
FROM BOOK
WHERE 1=1
AND PRICE BETWEEN 5000 AND 20000;

--5. CUSTOMER 테이블에서 PHONE가 NULL이 아니고 CUSTID가 3이상인 레코드 출력하시오.
SELECT 
* 
FROM CUSTOMER
WHERE 1=1
AND PHONE IS NOT NULL
AND CUSTID >= 3;;

--6. 고객별 평균 주문 금액을 반올림한 값을 출력하시오.(고객명, 평균 주문 금액 출력)
select * from Book;
select * from Customer;
select * from Orders;

SELECT C.NAME 고객명, ROUND(AVG(O.SALEPRICE),0) 평균주문금액
FROM Orders O
INNER JOIN CUSTOMER C ON O.CUSTID = C.CUSTID
GROUP BY C.NAME, O.CUSTID ;

--7. 이상미디어의 책을 구매한 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
select * from Book;
select * from Customer;
select * from Orders;

SELECT SUBSTR(NAME,1,1) 성별, COUNT(NAME) 인원수
FROM ORDERS O
INNER JOIN CUSTOMER C ON O.CUSTID = C.CUSTID 
WHERE BOOKID IN(
                SELECT BOOKID 
                FROM BOOK
                WHERE PUBLISHER = '이상미디어'
                )
GROUP BY SUBSTR(NAME,1,1) ;

--8. 이상미디어에서 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객이름, 도서번호를 모두 보이시오. 
select * from Book;
select * from Customer;
select * from Orders;

SELECT O.ORDERID 주문번호, ORDERDATE 주문일, C.NAME 고객이름, B.BOOKID 도서번호 
FROM ORDERS O
INNER JOIN BOOK B ON O.BOOKID = B.BOOKID
INNER JOIN CUSTOMER C ON O.CUSTID = C.CUSTID
WHERE 1=1
AND B.PUBLISHER = '이상미디어'
AND ORDERDATE = '20/07/07';



--9. 이름, 전화번호가 포함된 고객목록을 보이시오. 단, 전화번호가 없는 고객은 ‘연락처없음’으로 표시하시오.
select * from Book;
select * from Customer;
select * from Orders;

SELECT NAME 이름, NVL(PHONE,'연락처없음') 전화번호 
FROM CUSTOMER;



--10. 전체 평균 주문금액 보다 금액이 작은 주문에 대해서 주문번호와 금액을 출력하시오.
select * from Book;
select * from Customer;
select * from Orders;

SELECT O.ORDERID , O.SALEPRICE
FROM ORDERS O
WHERE SALEPRICE < (
                    SELECT AVG(SALEPRICE) 
                    FROM ORDERS
                    );



--11. ‘대한민국’에 거주하는 고객에게 판매한 도서의 총 판매액을 출력하시오.
select * from Book;
select * from Customer;
select * from Orders;

select SUM(SALEPRICE) 총판매액
from Orders
WHERE CUSTID IN(
                SELECT CUSTID
                FROM CUSTOMER
                WHERE ADDRESS LIKE '%대한민국%'
                );


--12. 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select * from Book;
select * from Customer;
select * from Orders;

SELECT O.ORDERID, O.SALEPRICE 
FROM ORDERS O 
WHERE O.SALEPRICE > (
                    SELECT MAX(SALEPRICE) 
                    FROM Customer C
                    INNER JOIN ORDERS O ON C.CUSTID = O.CUSTID
                    WHERE C.CUSTID = 3
                    );



--13. 이상미디어의 고객별 판매액을 보이시오(고객이름과 고객별 판매액 출력).
select * from Book;
select * from Customer;
select * from Orders;


SELECT C.NAME, SUM(O.SALEPRICE) 판매액
FROM BOOK B 
INNER JOIN ORDERS O ON B.BOOKID = O.BOOKID
INNER JOIN CUSTOMER C ON O.CUSTID = C.CUSTID
WHERE PUBLISHER = '이상미디어'
GROUP BY O.CUSTID, C.NAME;


---- EMP, DEPT, SALGRADE
--1. 각 부서별 급여 평균 등급을 출력하시오.(평균 급여 등급, 부서명 출력)
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

SELECT  S.GRADE 부서별평균등급, D.DNAME  --ROUND(AVG(E.SAL),1)
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY D.DNAME, S.GRADE;







--2. 자신의 매니저(MGR)가 받는 급여 등급과 본인이 받는 급여 등급의 차이를 구하시오.
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

SELECT S1.GRADE, S2.GRADE AS MGR_GRADE, S2.GRADE - S1.GRADE 차이
FROM EMP E1
INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO
INNER JOIN SALGRADE S1 ON E1.SAL BETWEEN S1.LOSAL AND S1.HISAL
INNER JOIN SALGRADE S2 ON E2.SAL BETWEEN S2.LOSAL AND S2.HISAL;

SELECT  
S1.GRADE, 
S2.GRADE AS MGR_GRADE, 
S2.GRADE - S1.GRADE 차이
FROM EMP E1
INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO
INNER JOIN SALGRADE S1 ON E1.SAL BETWEEN S1.LOSAL AND S1.HISAL
INNER JOIN SALGRADE S2 ON E2.SAL BETWEEN S2.LOSAL AND S2.HISAL;





--3. 본인 부서의 평균 급여보다 높은 급여를 받는 사람의 이름, 부서명, 급여, 본인부서의 평균급여를 출력하시오.

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

SELECT E.ENAME, D.DNAME, E.SAL, T.ROUAVG
FROM EMP E
INNER JOIN 
            (
            SELECT DEPTNO, ROUND(AVG(SAL)) AS ROUAVG
            FROM EMP
            GROUP BY DEPTNO
            ) T
ON E.SAL > ROUAVG 
AND E.DEPTNO = T.DEPTNO
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;





---- TBL_USER, TBL_BOARD, TBL_COMMNET
--1. 댓글을 가장 많이 쓴 사용자의 이름, 댓글 개수를 출력하시오.
SELECT * FROM TBL_USER;
SELECT * FROM TBL_BOARD;
SELECT * FROM TBL_COMMENT;

SELECT * FROM TBL_USER;

SELECT U.NAME, T2.CT 댓글개수 
FROM (
                SELECT ROWNUM RN, T.* 
                FROM (
                        SELECT  C.USERID, COUNT(COMMENTNO) CT
                        FROM TBL_COMMENT C
                        GROUP BY   C.USERID
                    )T
                ORDER BY CT DESC
        )T2
INNER JOIN TBL_USER U ON T2.USERID = U.USERID
WHERE T2.RN = 1;

SELECT U.NAME, COUNT(*) 댓글개수
FROM TBL_COMMENT C
INNER JOIN TBL_USER U ON C.USERID = U.USERID
GROUP BY C.USERID, U.NAME
HAVING COUNT(*) = (
    SELECT MAX(U_CNT)
    FROM (
        SELECT USERID, COUNT(*) AS U_CNT
        FROM TBL_COMMENT
        GROUP BY USERID
    )
);

--2. 각 사용자가 작성한 게시글의 작성자 이름, 조회수 평균을 구하시오. 단, 작성글이 없으면 조회수 평균에 '게시글 없음'으로 출력하시오.
SELECT * FROM TBL_USER;
SELECT * FROM TBL_BOARD;
SELECT * FROM TBL_COMMENT;

SELECT  U.NAME, NVL(TO_CHAR(ROUND(AVG(CNT))), '게시글 없음') AS 조회수평균
FROM TBL_BOARD B
LEFT JOIN TBL_USER U ON B.USERID = U.USERID
GROUP BY B.USERID,  U.NAME;

-- STUDENT, ENROL, SUBJECT
--1. 2개이상의 시험을 본 학생들의 이름, 시험본 횟수를 출력하시오.
SELECT STU_NAME, COUNT(*) 시험횟수
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY STU_NAME
HAVING COUNT(*) >= 2;

--2. 본인 학과의 시험 평균점수보다 평균점수가 높은 학생들의 이름, 평균점수, 학과 평균점수를 출력하시오.
SELECT STU_NAME, ROUND(AVG(ENR_GRADE),1) 평균, ROUND(AVG_DEPT, 1) 학과평균
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN (
    SELECT STU_DEPT, AVG(ENR_GRADE) AVG_DEPT
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    GROUP BY STU_DEPT
) T ON S.STU_DEPT = T.STU_DEPT
GROUP BY STU_NAME, AVG_DEPT
HAVING AVG(ENR_GRADE) > AVG_DEPT;