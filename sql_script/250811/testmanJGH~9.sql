--STUDENT테이블에서 '컴퓨터정보' 학생들의 평균 키는?
--SELECT * FROM STUDENT;

SELECT AVG(stu_height) 
FROM STUDENT 
WHERE STU_DEPT = '기계';

--PROFESSOR 테이블에서 직급이 '정교수'인 사람들의 급여(PAY)총 합은?
select sum(pay)
from professor
where position = '정교수';

--SELECT SUM(pay) FROM professor WHERE position = '정교수';
