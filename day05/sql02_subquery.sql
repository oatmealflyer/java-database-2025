/*
 * 서브쿼리 
 * */

SELECT * FROM student; 

SELECT * FROM department;

-- join으로 두 테이블을 검색 
SELECT s.name, d.dname 
	FROM student s , department d 
 WHERE s.deptno1 = d.deptno
  AND s.deptno1 = 103; --고정된 값이고 

-- Anthony Hopkins 학생과 같은 학과에 다니는 학생을 모두 조회
SELECT s.name, d.dname 
	FROM student s , department d 
 WHERE s.deptno1 = d.deptno
  AND s.deptno1 = (SELECT deptno1 
					FROM student 
					WHERE name = 'Anthony Hopkins'); -- 학생 이름 따라 학과번호가 변경 가능 

-- where절 서브쿼리에서 =로 비교할 때 주의점 
-- where절 서브쿼리는 다중행이 되면 안됨 				
  SELECT s.name, d.dname 
	FROM student s , department d 
 WHERE s.deptno1 = d.deptno
  AND s.deptno1 <> (SELECT deptno1 
					FROM student );				

-- 특정 교수의 입사일보다 뒤에 입사한 교수들의 정보 출력 
SELECT * 
	FROM professor;

SELECT * 
	FROM department;

SELECT hiredate 
 	FROM professor 
 	WHERE name = 'Meg Ryan';

--조인되는 쿼리부터 생성 
-- 맥 라이언 교수 입사일자 비교 
SELECT p.name AS "PROF_NAME"
	  ,p.HIREDATE
	  ,d.dname AS "DEPT_NAME"
	FROM professor p,department d 
	WHERE p.deptno = d.deptno
	AND p.hiredate >(SELECT hiredate 
 						FROM professor 
 						WHERE name = 'Meg Ryan');

COMMIT;

-- 다중행 서브쿼리 
-- IN 서브쿼리 결과와 같은 값. 여러개 (OR와 동일)
-- EXISTS 서브쿼리의 값이 있는 경우 메인쿼리를 수행 
-- > ANY 서브쿼리의 최소값보다 메인쿼리의 큰 값을 조회 
-- < ANY 서브쿼리의 최대값보다 메인쿼리의 작은 값을 조회
-- < ALL 서브쿼리 결과 중 최소값을 반환 
-- > ALL 서브쿼리 최소값보다 작은값을 조회

-- 지역이 Pohang Main Office인 부서코드에 해당하는 직원들의 사번,이름,부서번호를 출력하시오 
SELECT dcode 
	FROM dept2
	WHERE area ='Pohang Main Office';

SELECT empno,name,deptno 
	FROM emp2
	WHERE deptno IN (SELECT dcode 
					FROM dept2
					WHERE area ='Pohang Main Office');

-- emp2 테이블에서 'Section haed' 직급의 최소 연봉보다 연봉이 높은 사람의 이름, 직급,연봉을 출력하시오 
-- 단, 연본은 $75,000,000 식으로 출력할 것 
DELETE FROM EMP2 
	WHERE empno ='20000219';

COMMIT;

-- 서브쿼리 Min 함수 최소값 스칼라에서 비교연산으로 
SELECT * 
	FROM emp2 
	WHERE EXISTS (SELECT * 
					FROM emp2 
					WHERE POSITION ='Section head');

-- > ANY로 서브쿼리 다중행에서 최소값 
SELECT name,POSITION 
	, TO_char(pay, '$999,999,999') AS "SALARY" 
	FROM emp2 
	WHERE pay < ANY (SELECT pay
				     FROM emp2 
				     WHERE POSITION = 'Section head');

-- 다중컬럼 서브쿼리, 파이썬 튜플과 동일 
-- 1~4학년 중 몸무게가 가장 많이 나가는 학생의 정보를 출력하라(4행)
SELECT grade,name,height, weight 
	FROM student 
	WHERE (grade,weight) IN (SELECT grade,max(weight)
							FROM STUDENT 
							GROUP BY grade);

SELECT grade,max(weight)
	FROM student 
	GROUP BY grade; 

-- 교수 테이블과 학과 department 테이블 조회하여 학과별로 입사일이 가장 오래된 교수의 
-- 교수번호, 이름, 학과명을 출력하시오. 입사일 순으로 오름차순
SELECT p.profno,p.name, d.dname 
	FROM professor p , department d 
	WHERE p.deptno = p.hiredate 
	AND (p.deptno,p.hiredate) IN (SELECT deptno,min(hiredate)
								FROM PROFESSOR 
								WHERE deptno IS NOT NULL 
								GROUP BY deptno);


SELECT deptno,min(hiredate)
	FROM PROFESSOR 
	WHERE deptno IS NOT NULL 
	GROUP BY deptno;

-- 상호연관 쿼리 메인쿼리의 컬럼이 서브쿼리의 조건에 들어가는 경우 
-- 전체 20의 평균연봉 
SELECT a.name , a.POSITION ,a.pay
	FROM emp2 a 
	WHERE a. pay >= (SELECT avg(b.pay)
					  FROM emp2 b EXCEPT 
					  GROUP BY b.POSITION )

SELECT name, POSITION ,pay 
FROM emp2 
	WHERE (POSITION,pay) > (
	SELECT b.POSITION ,AVG(b.pay)
	FROM emp2 b 
	WHERE )
	
-- 여기까지, where 절 서브쿼리 
-- 스칼라 서브쿼리, select 절 서브쿼리
-- 부서명을 같이 보려면 join을 해야함  
SELECT * 
	FROM emp2 e ; 

-- 조인은 건수가 만약 700만 건이더라도 조인은 한번만 수행 
SELECT e.empno ,e.name , e.deptno,d.DNAME AS "부서명"
 	FROM emp2 e , dept2 d 
 	WHERE e.deptno = d.dcode;

-- 조인없이 스칼라 서브쿼리로 해결 
-- 조인으로 되는 값을 서브쿼리 쓰면 성능에 악영향을 끼침
-- 스칼라 서브쿼리를 쓰면 where 검색을 700만 건 수행 
SELECT e.empno, e.name, e.deptno
	,(SELECT dname FROM dept2 WHERE dcode = e.deptno) AS "부서명"
	,(SELECT area FROM dept2 WHERE dcode = e.deptno) AS "지역"
	FROM emp2 e; 

-- 여기까지 스칼라(select절) 서브쿼리 

--from 절 서브쿼리 
SELECT * 
	FROM emp2;  

SELECT e.empno,e.name,e.BIRTHDAY 
	,deptno,EMP_TYPE ,tel  
	FROM emp2 e ;

-- from 절에 소괄호 내에서 서브쿼리를 작성하는 방식 
SELECT es.name , es.empno
	FROM (SELECT empno,name,BIRTHDAY 
	,deptno, EMP_TYPE ,tel  
	FROM emp2) es
	
-- 각 부서별 평균 연봉
SELECT grpP.deptno , grpP.payAvg
	FROM (SELECT deptno,avg(pay) AS payAvg 
			FROM emp2 
			GROUP BY deptno) grpP;  
	
-- emp2와 위에서 구한 값을 조인해서 평균 연봉보다 얼마씩 차이가 나는지 		
SELECT e.name, e.empno, e.POSITION ,e.DEPTNO , e.pay, g.payavg
		, (e.pay - g.payavg) AS "평균연봉차액"
FROM emp2 e ,(SELECT deptno, avg(pay) AS payAvg
				FROM emp2 
				GROUP BY deptno )g 
WHERE e.deptno = g.deptno ;

-- 12. with절로 가상테이블 형태 서브쿼리 
WITH g1 AS 
(
	SELECT deptno, avg(pay) AS payAvg
				FROM emp2 
				GROUP BY deptno 
)
SELECT e.name, e.empno , e.POSITION, e.deptno , e.pay , g1.payavg 
	,(e.pay - g1.payavg) AS "평균연봉차액"
	FROM emp2 e, g1 
	WHERE e.deptno = g1.deptno; 

-- 11번 12번은 차이가 없음 
-- where 절 서브쿼리 > from절 서브쿼리 > select 절 서브쿼리(사용자정의함수로 대체)

-- 서브쿼리 사용시 NULL값 처리 
INSERT INTO emp2 (empno,name,birthday,deptno,emp_type,tel)
VALUES(2020000219,'Ray Osmond','1988-03-22','999','Intern','02)909-2345');

COMMIT;

SELECT * FROM emp2;

--각 직원의 부서명을 같이 출력하라. 
--NULL은 출력을 안하는게 좋음 
SELECT name, deptno,nvl((SELECT dname FROM dept2 WHERE dcode = emp2.deptno),'부서명없음')AS "부서명"
	FROM emp2
	ORDER BY deptno; 

--위의 쿼리 조인으로 변경가능 
SELECT e.name, e.deptno, nvl(d.dname , '부서명없음') AS "부서명" 
	FROM emp2 e, dept2 d 
	WHERE e.deptno = d.DCODE(+)
	ORDER BY deptno; 

COMMIT;