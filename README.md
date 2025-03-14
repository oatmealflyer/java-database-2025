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
- JOIN [SQL](./day03/sql03_조인기본.sql)
    - ERD(Entity Relationship Diagram) -개체 관계 다이어그램
        - PK(Primary Key) -기본키. 중복이 안되고 빠진 데이터가 하나도 없다. UNIQUE, NOT NULL  
        - FK(Foreign Key) -외래키. 다른 엔티티(테이블)의 PK. 두 엔티티의 관계를 연결해주는 값
        - Relationship - 부모 엔티티와 자식 엔티티간의 연관 ,부모 1, 자식 N을 가질 수 있음
    - 카티션곱
        - 두 개 이상의 테이블의 조건과 관계없이 연결할 수 있는 경우의 수 모든 만든 데이터
        - 조인이전에 데이터 확인 - 실무에서 카티션곱으로 데이터를 사용할 일이 절대 ! 없음 
    - 내부조인 
        - 다중 테이블에서 보통 PK와 FK간의 일치하는 데이터를 한꺼번에 출력하기 위한 방법
        - 관계형 데이터베이스에서 필수로 사용해야 함 
        - INNER JOIN 또는 오라클 간결문법 사용 
    - 외부조인
        - PK와 FK간 일치하지 않는 데이터도 출력하고자 할 때 사용하는 방법 
        - LEFT OUTER JOIN,RIGHT OUTER HOIN 또는 오라클 간결문법 사용 

- DDL
    - CREATE -TABLE,VIEW,PROCEDURE,FUNCTION, ...
    - 타입형     
        ```sql
        CREATE TABLE 테이블명 (
            첫번째_컬럼 타입형 제약조건, 
            두번째_컬럼 타입형 제약조건,
            ...
            마지막_컬럼 타입형 제약조건 
            [,
              기본키, 외래키 등의 옵션 ... 
            ]
        );      
        ```
    - ALTER - 개체 중 테이블에서 수정이 필요할 때 사용하는 키워드 
    ```sql
    ALTER TABLE 테이블명 ADD (컬럼명 타입형 제약조건);
    ALTER TABLE 테이블명 MODIFY (컬럼명 타입형 제약조건);  
    ```
    - DROP -개체 삭제시 사용하는 키워드 
    ```sql 
        DROP TABLE 테이블명 purge; --purge 휴지통 
    ```
    - TRUNCATE -테이블 완전 초기화 키워드 
    ```sql 
    TRUNCATE TABLE 테이블명; 
    ```

    ## 4일차 
    - VS Code DB 플러그인
        -확장 > Database 검색 > Database Client(Weijan Chan) > 확장중 Database 선택 
        <img src="" width="700">
    -DML :[INSERT 쿼리](./day04/sql01_INSERT.sql) [UPDATE/DELETE 쿼리](./day04/sql01_UPDATE_DELETE.sql)
        -INSERT 
        -UPDATE 
        -DELETE 

- DML
    - INSERT - 테이블에 새로운 데이터를 삽입하는 명령 
      - 한 건식 삽입
      ```sql
      INSERT INTO 테이블명 [(칼럼리스트)]
      VALUES (값리스트);
      ```
    - DELETE - 데이터 삭제.WHERE 조건 없이 실행하면 테이블 모든 데이터가 삭제됨 (주의요망)
    ```sql
       DELETE FROM 테이블명 
       [WHERE 조건] ;  
    ```
    - UPDATE -데이터 변경.WHERE 조건을 없이 실행하면 테이블 모든 데이터가 수정됨(주의요망!)
    ```sql
       DELETE FROM 테이블명 
       [WHERE 조건];
    ```
- 트랜잭션 :[트랜잭션쿼리](./day04/sql03_트랜잭션.sql)
    - 논리적인 처리단위 
    - 은행에서 돈을 찾을 때 아주 많은 테이블 접근해서 일을 처리 
        - 적어도 일곱여덟개 이상의 테이블 접근해서 조회하고 업데이트 수행 
        - 제대로 일이 처리안되면 다시 원상 복귀 ROLLBACK
        - DB 설정 AUTO COMMIT 해제 권함
        - ROLLBACK 트랜잭션 종료가 아님. COMMIT만 종료를 뜻함  
        ```sql
        SET TRANSACTION READ WRITE; --트랜잭션 시작(옵션)
        BEGIN TRANSACTION; -- 트랜잭션 시작  
        COMMIT; --트랜잭션 확정 
        ROLLBACK; --원상복귀 
        ```
    - 제약조건(Constraint) :[제약조건쿼리](./day04/sql04_제약조건.sql)
        - 잘못된 데이터가 들어가지 않도록 막는 기법
            - PRIMARY KEY -기본키, UNIQUE NOT NULL . 중복되지 않고 없어도 안 됨 
            - FOREIGN KEY -외래키, 다른테이블 PK에 없는 값을 가져다 쓸 수 없음 
            - NOT NULL - 값이 빠지면 안됨 
            - UNIQUE - 들어간 데이터가 중복되면 안됨 
            - CHECK - 기준에 부합하지 않는 데이터는 입력되면 안됨
            - DEFAULT - NULL입력 시 기본값이 입력되도록 하는 제약 조건 
            ```sql
            CREATE TABLE 테이블명(
                컬럼 생성시 제약조건 추가 
            );
            ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건 
            ```
    - INDEX :[INDEX쿼리](./day04/sql05_인덱스.sql),[인덱스용테이블생성](./ref/bulk_data_insert.sql)
        - 책의 찾아보기와 동일한 기능 
        - 검색을 매우 빨리 할 수 있도록 해줌 
        - B(alanced) Tree를 사용해서 검색횟수를 반이하로 줄임
        - 인덱스 종류 
          - 클러스터드(Clustered ) 인덱스 (테이블당 1개)
            - PK에 자동으로 생성되는 인덱스(무지 빠름)
            - PK가 없으면 처음으로 설정되는 UNIQUE 제약 조건의 컬럼에서 생성
          -보조(Non-clustered) 인덱스 (여러개)
            -사용자가 추가하는 인덱스 
            -클러스터드 인덱스보다 조금느림
        - 유의점 
         - PK에 자동으로 인덱스 후 컬럼에 UNIQUE를 걸어도 인덱스가 생성안됨 .수동으로 생성 필요 
         - WHERE절에서 검색하는 컬럼은 인덱스를 걸어주는 것이 성능 향상에 도움이 됨 
         - 인덱스는 한 테이블당 4개 이상 걸면 성능 저하 
         - NULL값,중복값이 많은 컬럼에 인덱스는 성능을 저하시킨다 
         - INSERT,UPDATE,DELETE 가 많이 발생하는 테이블에 인덱스를 걸면 성능 저하 
           
           ```sql
           CREATE INDEX 인덱스명 ON 테이블명(인덱스컬럼명)
           ```
    ## 5일차
    - VIEW
    - 서브쿼리
    - 시퀀스  

       