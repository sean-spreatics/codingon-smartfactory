-- < 실습: DDL 이용해 테이블 생성하기 >
USE smartfactory;
DROP TABLE member;
CREATE TABLE member (
	id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(5) NOT NULL,
    age INT,
    email VARCHAR(50),
    promotion VARCHAR(2) DEFAULT 'x',
    gender VARCHAR(2) NOT NULL
);
DESC member;

-- 테이블 생성시; 속성의 순서는 상관 없음.
-- 왜냐하면, 릴레이션 특징 중에서 "속성의 순서는 상관 없음"이 존재
-- 테이블 생성시 열 이름 > 데이터 형식 순으로 작성은 해야함


-- < 실습: DDL 이용해 테이블 구조 수정하기 >
-- ALTER

-- id 컬럼 값 형식 변경
ALTER TABLE member MODIFY id VARCHAR(10);
ALTER TABLE member CHANGE id id VARCHAR(10);

-- age 컬럼 삭제
ALTER TABLE member DROP age;

-- interest 컬럼 추가
ALTER TABLE member ADD interest VARCHAR(100);

DESC member;











