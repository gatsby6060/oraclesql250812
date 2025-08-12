-- 그룹 함수 2
-- SUM, AVG, MAX, MIN, COUNT

SELECT POSITION, SUM(PAY)
FROM PROFESSOR
GROUP BY POSITION;

SELECT * FROM stu; 

SELECT grade, AVG(weight)
FROM stu
GROUP BY grade; --학년 (GRADE)별 평균 몸무게

SELECT grade, MAX(weight)
FROM stu
GROUP BY grade; 

SELECT COUNT(*)
FROM student;

select count(bonus) --BONUS가 NULL이 아닌 레코드의 수
from professor;

--STUDENT 테이블에서 각 학과의 학생 수
select stu_dept, count(stu_dept) 
from student 
group by stu_dept
having count(*) >= 4; -- group by에 관한 조건은 having절을 써야한다

-- STEP 3. 각 학과에서 남자가 2명이상인 학과명, 학생수 출력
select stu_dept, count(*) 
from student 
where STU_GENDER = 'M'
group by stu_dept
having count(*) >= 2;


