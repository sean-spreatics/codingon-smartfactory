SELECT * FROM user;
DESC user;

-- 1. 모든 회원목록을 가져오는데, 이때 birthday 컬럼의 값을 기준으로 오름차순 정렬하여 가져오시오.
SELECT * FROM user ORDER BY birthday;
SELECT * FROM user ORDER BY birthday ASC;

-- 2. 회원 목록 중 // gender 컬럼의 값이 "M" 인 회원목록을 가져오는데,// 이때 name 컬럼의 값을 기준으로 내림차순 정렬하여 가져오시오.
SELECT * FROM user WHERE gender='M' ORDER BY name DESC;
SELECT * FROM user WHERE gender IN ('M') ORDER BY name DESC;

-- 3. 1990 년대에 태어난 // 회원의 id, name 컬럼을 가져와 목록으로 보여주시오.
SELECT id, name FROM user WHERE birthday LIKE '199%';
SELECT id, name FROM user WHERE birthday BETWEEN '1990-01-01' AND '1999-12-31';
SELECT id, name FROM user WHERE birthday >= '1990-01-01' AND birthday <= '1999-12-31';

-- 4. 6월생 회원의 목록을 birthday 기준으로 오름차순 정렬하여 가져오시오.
SELECT * FROM user WHERE birthday LIKE '%-06-%' ORDER BY birthday;
SELECT * FROM user WHERE birthday LIKE '%-06-%' ORDER BY birthday ASC;
SELECT * FROM user WHERE birthday LIKE '____-06-__' ORDER BY birthday;


-- 5. gender 컬럼의 값이 "M" 이고, 1970 년대에 태어난 회원의 목록을 가져오시오.
SELECT * FROM user 
	WHERE gender = 'M' AND birthday LIKE '197%';
SELECT * FROM user 
	WHERE gender = 'M' AND 
		birthday <= '1979-12-31' AND 
		birthday >= '1970-01-01';
SELECT * FROM user 
	WHERE gender = 'M' AND 
		birthday BETWEEN '1970-01-01' AND '1979-12-31';

-- 6. 모든 회원목록 중 age를 기준으로 내림차순 정렬하여 가져오는데, 그때 처음 3개의 레코드만 가져오시오.
SELECT * FROM user ORDER BY age DESC LIMIT 3;
SELECT * FROM user ORDER BY age DESC LIMIT 0, 3;
SELECT * FROM user ORDER BY age DESC LIMIT 3 OFFSET 0;

-- 7. 모든 회원 목록 중 나이가 25 이상 50 이하인 회원의 목록을 출력하시오.
SELECT * FROM user WHERE age BETWEEN 25 AND 50; 
SELECT * FROM user WHERE age >= 25 AND age <= 50;
SELECT * FROM user WHERE age > 24 AND age < 51; 













