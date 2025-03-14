/*
 * 인덱스 - DB 검색을 효율적으로 빠르게 처리하는 기술
 * 
 * */

-- 기본 테이블 생성
CREATE TABLE test_noindex(
   id NUMBER NOT NULL,
   name varchar(20) NOT NULL, 
   phone varchar(20) NULL,
   rdate DATE DEFAULT sysdate
);  -- PK를 만들지 않고 테이블을 만들면 INDEX가 없다 !!


-- 인덱스 테이블 생성
CREATE TABLE test_index(
   id NUMBER NOT NULL PRIMARY KEY,
   name varchar(20) NOT NULL, 
   phone varchar(20) NULL,
   rdate DATE DEFAULT sysdate
);


-- 유니크 인덱스 테이블 생성(유니크인덱스)  -- UNIQUE에 자동으로 INDEX가 걸림 !!
CREATE TABLE test_uniqueindex(
   id NUMBER NOT NULL,
   name varchar(20) NOT NULL UNIQUE, 
   phone varchar(20) NULL,
   rdate DATE DEFAULT sysdate
);


-- 인덱스 생성 쿼리 테스트용 테이블 생성
CREATE TABLE test_index2(
   id NUMBER NOT NULL,
   name varchar(20) NOT NULL, 
   phone varchar(20) NULL,
   rdate DATE DEFAULT sysdate
);

CREATE INDEX idx_id ON test_index2(id);
-- 수동으로 만들 때는 언제나 이름을 붙여주자 ~
CREATE INDEX idx_name_PHONE ON test_index2(name, phone);

CREATE INDEX idx_id_name2 ON test_index2(id, name);
-- 인덱스가 추가되면 용량이 늘어난다 (인덱스 테이블이 계속 추가됨 !)

/*
 * 인덱스 테스트. 인덱스가 없을 때 검색 쿼리 실행 소요 시간,
 * 인덱스 구성 후 검색 쿼리 실행 소요 시간 비교!! 
 * 
 * */

-- 인덱스 테스트 sample_t

SELECT COUNT(ID1)
  FROM sample_t
 GROUP BY ID1
HAVING COUNT(ID1) > 1;

SELECT *
  FROM sample_t;

-- 검색
SELECT *
  FROM sample_t
 WHERE ID1 = 976453;

SELECT *
  FROM SAMPLE_T
 WHERE id1 IN (976453, 934564, 174555, 6785, 146789, 897554);

SELECT *
  FROM SAMPLE_T
 WHERE id1 BETWEEN 100000 AND 300000;

SELECT *
  FROM sample_t
 WHERE date3 BETWEEN '2011-01-01' AND '20'