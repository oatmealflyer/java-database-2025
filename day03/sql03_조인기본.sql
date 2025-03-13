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

