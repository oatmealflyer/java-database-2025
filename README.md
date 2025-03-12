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