-- 1. SELECT 문법
-- SELECT 컬럼명(*는 전체 컬럼) FROM 테이블명;
-- 조건이 필요하면 테이블명 뒤에 WHERE로 조건을 준다.

-- 2. UPDATE 문법
-- UPDATE 테이블명 SET '수정할 내용'
-- 조건이 필요하면 수정할 내용 뒤에 WHERE로 조건을 준다.

-- 3. INSERT 문법
-- INSERT INTO 테이블명(삽입할 컬럼명) VALUES(컬럼에 들어갈 값)
-- 모든 컬럼에 값을 삽입할 경우 컬럼명은 생략 가능

-- 4. DELETE 문법
-- DELETE FROM 테이블명
-- 조건이 필요하면 테이블명 뒤에 WHERE로 조건을 준다.(DELETE는 거의 조건 필수)




--SUBJECT 테이블의 컬럼 의미
---- SUB_NO(과목번호)
---- SUB_NAME(과목명)
---- SUB_PROF(담당교수)
---- SUB_GRADE(학년)
---- SUB_DEPT(학과)
--
---- 모든 문제는 SUBJECT 테이블을 대상으로 함
--1. 1학년과 3학년 학생이 듣는 수업 출력, 데이터는 학년을 기준으로 내림 차순
--2. 과목에 '설계'가 들어가는 데이터 출력
--3. 과목번호가 105이상인 수업 출력, 데이터는 과목번호를 기준으로 오름 차순
--4. SUB_NO 컬럼을 PK로 변경(테이블 우클릭 -> 편집 -> 대상컬럼 왼쪽 PK부분 클릭)
--5. 과목번호가 '201', 과목명이 '자바', 담당교수가 '홍길동' 나머지 정보는 없는 데이터 삽입
--6. 과목번호가 '202', 과목명이 '오라클', 담당교수가 '박영희', 학년이 '1', 학과가 '컴퓨터정보' 데이터 삽입
--7. 5번에서 생성한 과목번호가 201인 데이터에 학년을 '2', 학과는 '컴퓨터정보'로 수정
--8. 과목번호가 200이상인 과목들을 삭제




--SUBJECT 테이블의 컬럼 의미
---- SUB_NO(과목번호)
---- SUB_NAME(과목명)
---- SUB_PROF(담당교수)
---- SUB_GRADE(학년)
---- SUB_DEPT(학과)
--
---- 모든 문제는 SUBJECT 테이블을 대상으로 함
--1. 1학년과 3학년 학생이 듣는 수업 출력, 데이터는 학년을 기준으로 내림 차순
SELECT * 
FROM subject
WHERE sub_grade IN (1,3)
ORDER BY sub_grade DESC;


--2. 과목에 '설계'가 들어가는 데이터 출력
SELECT * 
FROM subject
WHERE sub_name LIKE '%설계%';


--3. 과목번호가 105이상인 수업 출력, 데이터는 과목번호를 기준으로 오름 차순
SELECT * 
FROM subject
WHERE sub_no >= 105
ORDER BY sub_no;

--4. SUB_NO 컬럼을 PK로 변경(테이블 우클릭 -> 편집 -> 대상컬럼 왼쪽 PK부분 클릭)


--5. 과목번호가 '201', 과목명이 '자바', 담당교수가 '홍길동' 나머지 정보는 없는 데이터 삽입
SELECT * 
FROM subject;

INSERT INTO subject (sub_no, sub_name, sub_prof)
VALUES (201,'자바','홍길동');



--6. 과목번호가 '202', 과목명이 '오라클', 담당교수가 '박영희', 학년이 '1', 학과가 '컴퓨터정보' 데이터 삽입
SELECT * 
FROM subject;

INSERT INTO subject
VALUES (202,'오라클','박영희',1,'컴퓨터정보');



--7. 5번에서 생성한 과목번호가 201인 데이터에 학년을 '2', 학과는 '컴퓨터정보'로 수정
SELECT * 
FROM subject;

UPDATE subject
SET
    sub_grade = 2,
    sub_dept = '컴퓨터정보'
where sub_no = 201;



--8. 과목번호가 200이상인 과목들을 삭제
SELECT * 
FROM subject;

delete from subject where sub_no >= 200;

commit;

