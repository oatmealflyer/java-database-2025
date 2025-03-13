--DISTINCT 명령어 - 중복된 값을 제거하고 출력 
-- DISTINCT 키워드는 1개의 컬럼에만 적어 주어도 모든 컬럼에 적용됨 
SELECT DISTINCT deptno FROM emp;

--연결 연산자로 컬럼 붙여서 출력 ||
SELECT ename ||'-'|| job AS "name_and_job"
FROM emp;

--p39 연습문제 1번 
SELECT name|| '''s ID:' || id ||', WEIGHT is '|| weight ||'kg' AS "ID AND WEIGHT"
FROM student;

--p39 연습문제 2번 
SELECT ename ||'('|| job || '),' || ename || '(' || job || ')' AS "NAME AND JOB"
FROM emp;

--p40 연습문제 3번 
SELECT * FROM emp;

SELECT ename ||'''s sal is $' || sal AS "name and sal"
FROM emp;

--원하는 조건만 골라내기 WHERE 절 사용 
/* SELECT [COLUMN OR EXPRESSION]
	FROM [TABLE OR VIEW]
	WHERE 원하는 조건;
*/

SELECT empno, sal 
FROM emp
WHERE sal < 900 ;

/*숫자를 조회할 때 : where 절에 숫자 그대로 
 *문자와 날짜를 조회하고 싶을 때 : 해당 문자나 날짜에 작은 따옴표 붙이기  */
SELECT empno,ename,sal 
FROM emp 
--문자의 경우 대소문자 구분 !! 
WHERE ename = 'SMITH' ; 

--윈도우용 오라클 /유닉스 계열은 오라클 날짜 표시법이 다름  
SELECT ename,hiredate 
FROM emp 
WHERE ename ='SMITH';





