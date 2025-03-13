# java-database-2025
Java개발자 과정 Database 리포지토리

## 1일차 
- Github Desktop 설치 
    - https://desktop.github.com/download/ 다운로드 
    - 기존 Github계정으로 SignIn with Browser
    - Git명령어 없이 사용가능 
- Database 개요
    - 데이터를 저장하는 장소,서비스를 하는 서버 
    - 데이터베이스를 관리하는 프로그램 DBMS 
    - 가장 유명한 것이 Oracle 
    - 사용자는 SQL로 요청, DB 서버는 처리결과를 테이블로 리턴 
    - SQL을 배우는 것!

- Oracle 설치(Docker)
    1. powershell 오픈 
    2. pull 내려받기 
        ```shell
        >docker pull oracleinanutshell/oracle-xe-11g
        ```
    3. 다운로드 이미지 확인
    ```shell
    PS C:\Users\Admin> docker image ls
    REPOSITORY              TAG       IMAGE ID       CREATED        SIZE
    kj                      1.1       e50ea779e750   22 hours ago   1.66GB
    doctorkirk/oracle-19c   latest    5816fe124f2a   3 years ago    16.8GB
    ```

    4.도커 컨테이너 실행 
    ```shell
    >docker run --name oracle11g -d -p 1521:1521 --restart=always oracleinanutshell/oracle-xe-11g
    ```
    - 1521 - 오라클 기본포트 
    - 아이디 system / oracle 
    5.도커 실행확인 
        -Docker Desktop > Containers 확인 
    6.PowerShell 오픈 
       ```shell
       >docker exec -it oracle19c bash 
       [oracle@f3637b0ec665 ~]$ sqlplus /as sysdb
       SQL > 
       ```
    7.DBeaver 접속   
      - Connection > Select your DB > Oracle 선택 
        <img src ="/image/image.png">
- DBeaver Community 툴 설치 
    - https://dbeaver.io/download/
- DML,DDL,DCL
    - 언어의 특징을 가지고 있음 
        - 프로그래밍언어와 차이 - 어떻게(How)
        - SQL - 무엇(What)
    - SQL의 구성요소 3가지 
    - DDL(Data Definition Lang) - 데이터베이스 생성, 테이블 생성, 객체 생성,수정,삭제
        - CREATE,ALTER,DROP ...
    - DCL(Data Control Lang) #데이터베이스의 사용자 권한주기 / 뺏기 , 다른 사람 못쓰도록 막기 - 사용자 권한 부여,해제 ,트랜잭션 시작, 종료 
        - GRANT,REVOKE,BEGIN TRANS,COMMIT,ROLLBACK 
    - DML(Data Manupulation Lang) #데이터 자체를 조작할 수 있는 명령 -데이터 조작언어(핵심!) ,데이터 삽,조회,수정,삭제 
        - INSERT, SELECT , UPDATE,DELETE 

- SELECT 기본 
    - 데이터 조회 시 사용하는 기본 명령어 
        ```sql
        -- 기본 주석(한줄)
        /* 여러줄 주석 
            여러줄로 주석 작성 가능 */
        SELECT [ALL|DISTINCT][*|컬럼명(들)]
            FROM 테이블명(들)
        [WHERE 검색조건(들)]
        [GROUP BY 속성명(들)]
        [HAVING 집계함수조건(들)]
        [ORDER BY 정렬속성(들) ASC|DESC]
        [WITH ROLLUP]

        ```
- 기본 쿼리 학습:SQL
    - 기본 SELECT 
    - WHERE 조건절 
    - NULL(!)
    - ORDER BY 정렬 
    - 집합         
- 함수(내장함수)
    - 문자함수: SQL 
    - 숫자함수 

## 2일차 
- 함수(계속)
    -문자함수 부터 : [SQL](./day02/sql01_함수계속.sql)
    -숫자함수 
    -날짜함수 
    -형변환함수 
-복수행함수 : [SQL](./day02/sql02_복수행함수.sql)
    -집계함수 
    -GROUP BY 
    -HAVING 
    -ROLLUP
    -RANK,DENSE_RANK,ROW_NUMBER

- 데이터베이스 타입형 
    - **CHAR(n)** - 고정형 문자열, 최대 2000바이트
        - CHAR(20)으로 'Hello World'를 저장하면 , 'Hello World        '로 저장!  
        - 기준코드나 반드시 자리수를 지켜야 하는 데이터 필요 
    - **VARCHAR2(n)** -가변형 문자열 , 최대 4000바이트 
        - VARCHAR2(20)로 'Hello World'를 저장하면 , 'Hello World'로 저장! 
    - INTEGER - 모든 데이터의 기준. 4byte, 정수를 담는 데이터형
    - FLOAT(p) - 실수형 타입 , 최대 22byte 
    - **NUMBER(p,s)** - 숫자값 ,p 전체 자리수, s 소수점길이 . 최대 22byte
    - **DATE** - 날짜타입 
    - **LONG(n)** - 가변길이문자열 , 최대 2G바이트 
    - LONG RAW(n) - 원시이진 데이터 ,최대 2G 바이트 
    - CLOB - 대용량 텍스트 데이터타입, 최대 4G
    - BLOB - 대용량 바이너리 데이터타입, 최대 4G 
    - BFILE - 외부파일에 저장된 데이터 , 4G  

## 3일차 
- JOIN 
    - ERD(Entity Relationship Diagram) -개체 관계 다이어그램
        - PK(Primary Key) -기본키. 중복이 안되고 빠진 데이터가 하나도 없다. UNIQUE, NOT NULL  
        - FK(Foreign Key) -외래키. 다른 엔티티(테이블)의 PK. 두 엔티티의 관계를 연결해주는 값
        - Relationship - 부모 엔티티와 자식 엔티티간의 연관 ,부모 1, 자식 N을 가질 수 있음
    - 카티션곱
    - 내부조인 ,외부조인
- DDL
    - CREATE,ALTER,DROP 
