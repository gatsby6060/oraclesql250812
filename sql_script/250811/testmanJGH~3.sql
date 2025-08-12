-- 2. UPDATE (테이블의 특정 컬럼에 있는 데이터를 수정)

SELECT * 
FROM STUDENT;

UPDATE student
SET stu_height = 175
WHERE STU_NAME = '박희철';

COMMIT;    
-- 커밋해야 인서트 업데이트 딜리트가 완전히 적용됨 롤백으로 뺴박 못함 
    
ROLLBACK;
-- 데이터 변경(수정 및 삭제, 삽입)

UPDATE student
SET
    stu_height = stu_height +1,
    STU_WEIGHT = STU_WEIGHT -1
WHERE stu_dept = '기계';
COMMIT;


