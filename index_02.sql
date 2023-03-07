-- ctrl + /: 한 줄 주석 단축키

-- smartfactory 데이터베이스 사용
USE smartfactory;

-- < SELECT/FROM >

-- 고객 테이블의 모든 정보를 조회
SELECT * FROM customer;

-- 주문 테이블의 모든 정보를 조회
SELECT * FROM orders;

-- 모든 고객의 고객아이디를 검색
SELECT custid FROM customer; 

-- 모든 고객의 고객아이디와 생년월일을 검색
SELECT custid, birth FROM customer;

-- 모든 고객의 생년월일과 고객아이디를 검색 (순서 있음)
SELECT birth, custid FROM customer;

-- 모든 고객의 아이디, 주소, 전화번호, 이름, 생년월일 검색
SELECT custid, addr, phone, custname, birth FROM customer;

-- (와일드카드 사용) 모든 고객의 아이디, 이름, 주소, 전화번호, 생년월일 검색
-- *: All, 모든 것을 의미
SELECT * FROM customer;

-- 고객 테이블에 있는 모든 주소를 검색 (중복 포함된 결과)
SELECT addr FROM customer;

-- 고객 테이블에 있는 중복을 제외한 주소 검색
-- DISTINCT: 중복값 제거
SELECT DISTINCT addr FROM customer;


-- < WHERE 절 > 

-- 비교: =, <, <=, >, >=
-- 고객 이름이 강해린인 고객을 검색
SELECT * FROM customer WHERE custname='강해린';

-- 제품 가격이 4000원 이상인 주문 내역(모든 속성)을 검색
SELECT * FROM orders WHERE price >= 4000;

-- 범위: BETWEEN a AND b
-- 1995년이상 2000년이하 출생 고객 검색
SELECT * FROM customer WHERE birth BETWEEN '1995-01-01' AND '2000-12-31';
SELECT * FROM customer WHERE birth >= '1995-01-01' AND birth <= '2000-12-31';


-- 집합 (IN, NOT IN)
-- 주소가 서울 혹은 런던인 고객 검색
SELECT * FROM customer WHERE addr IN ('대한민국 서울', '영국 런던');
SELECT * FROM customer WHERE addr = '대한민국 서울' OR addr = '영국 런던';
SELECT * FROM customer WHERE addr LIKE '대한민국 서울' OR addr LIKE '영국 런던';

-- 주소가 서울 혹은 런던이 아닌 고객 검색
SELECT * FROM customer WHERE addr NOT IN ('대한민국 서울', '영국 런던');
SELECT * FROM customer WHERE addr != '대한민국 서울' AND addr != '영국 런던';
SELECT * FROM customer WHERE addr NOT LIKE '대한민국 서울' AND addr NOT LIKE '영국 런던';


-- 패턴 (LIKE): 특정 패턴을 포함하는 데이터를 검색
-- %: 0개 이상의 문자
-- _: 1개의 단일 문자
-- 주소가 '미국 로스앤젤레스'인 고객 검색
SELECT * FROM customer WHERE addr LIKE '미국 로스앤젤레스';

-- 주소에 '미국'이 포함되어 있는 고객 검색
-- 검출 가능한 케이스 예시: '미국', '미국 ', '미국 워싱턴', '미국 로스앤젤레스', ... 
SELECT * FROM customer WHERE addr LIKE '미국%';
-- 주의) 검색 안됨
SELECT * FROM customer WHERE addr = '미국%'; 
SELECT * FROM customer WHERE addr IN ('미국%'); 
SELECT * FROM customer WHERE addr LIKE '미국_'; -- 검출 가능한 케이스 예시: '미국 ', '미국인', ... 
SELECT * FROM customer WHERE addr LIKE '미국__'; -- 검출 가능한 케이스 예시: '미국  ', '미국사람', ... 
SELECT * FROM customer WHERE addr LIKE '_미국_'; -- 검출 가능한 케이스 예시: '진미국밥', '난미국인', ... 

-- 고객 이름 두번째 글자가 '지'인 고객 검색
-- ex. '안지', '이지민', '강지민민' 
SELECT * FROM customer WHERE custname LIKE '_지_'; -- 이름이 3자이며, 두번째 글자가 '지'인 사람
SELECT * FROM customer WHERE custname LIKE '_지%'; -- (O) 두번째 글자가 '지'인 사람
SELECT * FROM customer WHERE custname LIKE '%지%'; -- 이름에 '지'라는 글자가 들어간 사람
SELECT * FROM customer WHERE custname LIKE '%지_'; -- 뒤에서 두번재가 '지'인 사람
SELECT * FROM customer WHERE custname LIKE '_지'; -- 이름이 2자이며, 마지막 글자가 '지'인 사람

-- 고객 이름 세번째 글자가 '수'인 고객 검색
SELECT * FROM customer WHERE custname LIKE '__수'; -- 이름이 3자이며, 세번째 글자가 '수'인 사람 
SELECT * FROM customer WHERE custname LIKE '__수%';
SELECT * FROM customer WHERE custname LIKE '%수'; -- 검출 가능한 케이스 예시: '수', '지수', '지지수', ... 


-- 복합 조건 (AND, OR, NOT)
-- 주소지가 대한민국이고, 2000년 이후 출생 고객 검색
SELECT * FROM customer WHERE addr LIKE '대한민국%' AND birth >= '2000-01-01';
SELECT * FROM customer WHERE addr LIKE '대한민국%' AND birth >= '20000101';

-- 주소지가 미국이거나 영국인 고객 검색
SELECT * FROM customer WHERE addr LIKE '미국%' OR addr LIKE '영국%';
-- 검색 되는 이유 조건1(addr LIKE '미국%')과 조건2(addr LIKE '영국%')에 대해서 OR 검색을 수행
SELECT * FROM customer WHERE addr LIKE '미국%' OR '영국%'; 
-- 검색 안되는 이유 조건1(addr LIKE '미국%')과 조건2('영국%')에 대해서 OR 검색을 수행

-- 휴대폰 번호 마지막 자리가 4가 아닌 고객 검색
SELECT * FROM customer WHERE phone NOT LIKE '%4';


-- < ORDER BY >
-- order by 절을 사용하지 않는 경우, pk 기준으로 정렬
SELECT * FROM customer;

-- custname 속성을 기준으로 "오름차순" 정렬
SELECT * FROM customer ORDER BY custname;

-- custname 속성을 기준으로 "내림차순" 정렬
SELECT * FROM customer ORDER BY custname DESC;


-- order by & where 함께 사용
-- 2000년 이후 출생자 중에서 주소를 기준으로 내림차순 검색
-- SELECT * FROM customer ORDER BY addr DESC WHERE birth >= '2000-01-01';
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY addr DESC;

-- 2000년 이후 출생자 중에서 주소를 기준으로 내림차순 그리고 아이디를 기준으로 내림차순 검색
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY addr DESC, custid DESC;
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY custid DESC, addr DESC;

-- ORDER BY 뒤에 여러 개의 속성을 줄 수 있음
-- 아래 두 쿼리문의 결과는 상이함
SELECT * FROM orders ORDER BY price, amount;
SELECT * FROM orders ORDER BY amount, price;


-- < LIMIT >
-- LIMIT 형식: LIMIT 시작, 개수 == LIMIT 개수 OFFSET 시작
-- 주의) LIMIT 에서 시작은 0임을 잊지말자!!
-- ex. LIMIT 2 == LIMIT 0, 2 == LIMIT 2 OFFSET 0
-- 고객 테이블 전체 정보를 조회하는데, 앞에 2건만 조회하고 싶은 경우
SELECT * FROM customer LIMIT 2;
SELECT * FROM customer LIMIT 0, 2;

-- 고객 테이블 전체 정보를 조회하는데, 두번째부터 여섯번째 행만 조회하고 싶은 경우
SELECT * FROM customer LIMIT 1, 5;
SELECT * FROM customer LIMIT 5 OFFSET 1;

-- 2000년 이후 출생 고객 중에서 앞에 2건만 조회하고 싶은 경우
SELECT * FROM customer WHERE birth >= '2000-01-01' LIMIT 2;

-- 2000년 이후 출생 고객 중에서 뒤에 2건만 조회하고 싶은 경우
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY custid DESC LIMIT 2;
SELECT * FROM customer LIMIT 1, 2;


















