

SELECT * FROM STUDENT WHERE STU_NAME = '옥한빛';

SELECT * FROM TBL_USER;

SELECT * FROM STUDENT ;

select * from stu;

-- 1. ALLEN과 같은 JOB, DEPTNO(부서)를 가진 사람을 구하시오(ENAME, DNAME 출력)
-- (ALLEN은 출력하지 말것)
SELECT * FROM DEPT;
SELECT * FROM EMP;
select E.ename, E.deptno ,D.DNAME
from emp E
INNER JOIN (select JOB, DEPTNO from emp where ename = 'ALLEN') T
            ON E.JOB = T.JOB AND E.DEPTNO = T.DEPTNO
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME != 'ALLEN';



select * from tbl_user;

UPDATE TBL_USER SET  PASSWORD = 'aaa' WHERE USERID= 'a';
commit;

UPDATE TBL_USER SET  PASSWORD = 'a' WHERE USERID= 'a';


Select T.*, TO_CHAR(T.CDATETIME,'YYYY-MM-DD') as d  from TBL_USER T;


UPDATE TBL_USER SET PASSWORD = 'a' WHERE USERID= 'a';
commit;