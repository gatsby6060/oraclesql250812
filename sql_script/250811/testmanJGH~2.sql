-- * STUDENT 테이블 기준 *
-- 1. STUDENT 테이블의 모든 레코드 출력
SELECT * FROM student;

-- 2. STUDENT테이블에서 이름, 학과, 학년 출력
SELECT stu_name, stu_dept, stu_grade 
FROM student;

-- 3. 컴퓨터정보과 학생들만 출력
SELECT * 
FROM student 
WHERE stu_dept = '컴퓨터정보';

-- 4. 기계과 이면서 남자인 학생들만 출력
SELECT * 
FROM student
WHERE stu_dept = '기계'
AND stu_gender = 'M';

-- 5. 몸무게가 50~70사이의 학생들 출력
SELECT * 
FROM student 
--WHERE stu_weight >=50 AND stu_weight <=70;
WHERE stu_weight BETWEEN 50 AND 70;
