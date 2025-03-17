/*
 * 사용자 생성, 기존 사용자 사용해제, 권한주기 
 */

-- HR 계정 잠금해제
ALTER USER hr Account unlock;
ALTER USER hr IDENTIFIED by 12345;

SELECT *
  FROM EMPLOYEES e ;
/*
-- SCOTT 계정 잠금해제 계정이 없을수 있음.
ALTER USER scott Account UNLOCK;

-- SCOTT은 CREATE SESSION 권한없음. LOGoN DENIED.
GRANT CREATE SESSION TO SCOTT;
*/

SELECT  * FROM JOBS j ;

CREATE VIEW JOBS_VIEW
AS
  SELECT *
    FROM JOBS;

-- HR계정에 어떤 권한이 있는지 조회
SELECT *
  FROM USER_TAB_PRIVS;

-- HR로 테이블 생성
CREATE TABLE TEST(
  ID NUMBER PRIMARY KEY,
  NAME VARCHAR(20) NOT NULL
);

-- ROLE(역할) 관리
-- 여러 권한을 묶어놓은 개념.
-- ROLE 확인
-- CONNECT - DB접속 및 테이블생성 조회 권한
-- RESOURCE - PL/SQL 사용권한
-- DBA - 모든 시스템 권한
-- EXP_FULL_DATABASE - DB익스포트 권한 ...
SELECT * FROM USER_ROLE_PRIVS;

SELECT * FROM DBA_ROLE_PRIVS;

-- HR에게 DBA역할 ROLE 부여
GRANT DBA TO HR;

SELECT * FROM SAMPLEUSER."MEMBER" m ;

-- HR에게 DBA역할 해제
REVOKE DBA FROM HR;