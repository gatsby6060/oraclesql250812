-- 1. SELECT (테이블에서 데이터 검색하는 명령어)
SELECT * 
FROM STUDENT; -- *은 모든 컬럼을 조회하는 것을 의미

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT; -- 필요한 컬럼만 선택해서 조회 가능

SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계'; -- 조건에 만족하는 레코드 조회하려면 WHERE를 사용

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2; -- 학년이 2학년 이상인 학생들 조회

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2 AND STU_GENDER = 'M'; --AND를 이용해서 2개의 조건 만족하는 학생 출력

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2 OR STU_GENDER = 'M'; -- OR를 이용해서 둘중 하나라도 만족하면 출력

SELECT * 
FROM STUDENT
WHERE STU_DEPT IN ('기계', '전기전자');
--WHERE STU_DEPT = '기계' OR STU_DEPT = '전기전자';

SELECT * 
FROM STUDENT 
WHERE STU_HEIGHT BETWEEN 170 AND 180;
--WHERE STU_HEIGHT >= 170 AND STU_HEIGHT <= 180;

SELECT * 
FROM student
WHERE stu_name LIKE '%옥%';

SELECT * 
FROM student
WHERE stu_no LIKE '%3%';

SELECT * 
FROM STUDENT 
WHERE stu_weight >=50 
-- ORDER BY STU_WEIGHT; --정렬키워드 디폴트가 오름차순ASC 은 생략가능하다
-- ORDER BY stu_weight DESC; -- 내림차순