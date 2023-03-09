DESC departments;
DESC employees;

SELECT * FROM departments;
SELECT * FROM employees;

-- 1. 모든 직원을 직원 테이블에 나열합니다.
SELECT * FROM employees;

-- 2. 나이순으로 직원 테이블에 있는 모든 직원을 나이순(DESC)으로 나열합니다.
SELECT * FROM employees ORDER BY age DESC;

-- 3. 직원 테이블에 30세 이상인 직원의 이름과 나이를 나열합니다.
SELECT name, age FROM employees WHERE age >= 30;

-- 4. 영업부에서 근무하는 직원의 이름과 부서 ID를 직원 표에 나열합니다.
SELECT name, department_id FROM employees WHERE department_id = 1;

-- 5. 엔지니어링 부서에 근무하고 30세 미만인 직원의 이름과 나이를 직원 테이블에 나열합니다.
SELECT name, age FROM employees WHERE department_id = 3 AND age < 30;

-- 6. 직원 테이블에서 직원 수를 계산합니다.
SELECT COUNT(*) FROM employees;

-- 7. 직원 테이블에서 각 부서의 직원 수를 계산합니다.
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

-- 8. 직원 평균 나이를 계산합니다.
SELECT AVG(age) FROM employees;

-- 9. 부서별 평균 나이를 계산합니다.
SELECT department_id, AVG(age) FROM employees GROUP BY department_id;

-- 10. 부서 테이블에서 지역 컬럼의 두번째 글자가 e인 부서를 계산합니다.
SELECT * FROM departments WHERE location LIKE '_e%'; 

-- 11. 부서 테이블에서 지역 컬럼에 공백이 들어가는 부서를 계산합니다.
SELECT * FROM departments WHERE location LIKE '% %'; 

-- 12. 직원 테이블에서 이름 컬럼에서 마지막 글자가 n인 사원을 계산합니다.
SELECT * FROM employees WHERE name LIKE '%n';




