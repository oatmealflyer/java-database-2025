/*
 * JOIN
 
*/
--개념
-- 정규화되어 나누어진 테이블의 데이터를 한꺼번에 모아서 쉽게 출력하기 위한 기법 
SELECT * 
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id ; 
	

-- 총 데이터수가 2889개 출력 
-- 카테시안 곱
SELECT * 
	FROM employees e, departments d;

--오라클 방식. 표준방식 아님. 편하게 쿼리 작성하라고 만든 편법 
SELECT * 
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id ; 

--ANSI 표준 문법 
SELECT *
	FROM employees e 
INNER JOIN departments d 
	ON e.department_id = d.department_id;

-- 내부조인(INNER JOIN)
SELECT e.employee_id,e.first_name || ' ' || e.last_name AS "full_name"
	, e.email , e.phone_number 
	, e.hire_date , e.job_id
	, d.DEPARTMENT_ID 
	, d.department_name 
	, l.city,l.STATE_PROVINCE ,l.STREET_ADDRESS
	FROM employees e , departments d, locations l 
	WHERE e.department_id = d.department_id
	AND l.location_id = d.location_id
	AND d.department_id = 60;

-- 외부조인 
-- 보통 PK와 FK 간의 일치하는 조건의 데이터를 찾는 것 - 내부조인 
-- PK와 FK 간의 일치하지 않는 조건의 데이터도 
-- 테이블1 OUTER JOIN 테이블2 
-- 테이블1번을 기준으로 외부조인 LEFT OUTER JOIN 
-- 테이블 2번을 기준으로 외부존인 RIGHT OUTER JOIN 

-- ANSI 표준문법 
-- employees 테이블에는 있는데 department 테이블에는 없는 데이터를 같이 출력해줘 
 SELECT * 
 	FROM employees e 
 	LEFT OUTER JOIN DEPARTMENTS d
 	ON e.department_id = d.department_id 
	WHERE e.department_id IS NULL ;

-- departments 테이블에는 있는데 employees 테이블에는 없는 데이터를 같이 출력해줘 
SELECT * 
	FROM employees e 
	RIGHT OUTER JOIN departments d 
	ON e.department_id = d.department_id ; 

-- Oracle 문법 
-- (+)만족하지 않는 조건도 더 나오게 한다는 뜻 
-- LEFT OUTER JOIN 
SELECT * 
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id(+);

-- RIGHT OUTER JOIN 
SELECT * 
	FROM employees e, departments d 
	WHERE e.department_id(+) = d.department_id;


-- INNER JOIN은 INNER를 생략가능
-- OUTER JOIN은 LEFT,RIGHT 존재하므로 OUTER 생략가능 
 
-- 셀프조인 :자기자신을 두번 사용하는 조인 
SELECT e1.first_name || '' || e1.LAST_NAME AS "full_emp_name"
	, e1.job_id 
	, e1.manager_id 
	, e2.first_name || '' || e2.LAST_NAME AS "full_mng_name"
	, e2.JOB_ID
	FROM employees e1, employees e2 
	WHERE e1.manager_id = e2.EMPLOYEE_ID(+)
	ORDER BY e1.manager_id;