/*
 * PL/SQL - 
 * */

-- SET SERVEROUTPUT ON; --콘솔에서만 사용 
DECLARE -- 선언부. 여기에 사용할 모든 변수를 선언해야 
	v_empno 	emp.empno%TYPE; -- number(4,0)와 동일 
	v_ename  	varchar2(10); -- emp.ename%TYPE 와 동일
BEGIN 
	SELECT empno,ename INTO v_empno,v_ename --변수 값을 할당 
	FROM emp
	WHERE empno = :empno; -- DYNAMIC 변수  & empno 규칙
	-- DBEAVER 때문에 : empno로 변경
	
	-- 정상실행되면 
	DBMS_OUTPUT.PUT_LINE(v_empno || '- 이 멤버의 이름은 '|| v_ename); 
EXCEPTION -- 예외 처리 
	WHEN NO_DATA_FOUND THEN 
		DBMS_OUTPUT.PUT_LINE('멤버가 없음!');
	WHEN TOO_MANY_ROWS THEN 
		DBMS_OUTPUT.PUT_LINE('데이터가 너무 많음~!');
	
END ; -- PL/SQL 종료부분  
/ 

COMMIT;