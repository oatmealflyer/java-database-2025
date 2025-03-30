-- 내역 History 테이블 
CREATE TABLE HISTORY( 
      prod_name VARCHAR2(20) PRIMARY KEY NOT NULL 
      , user_name VARCHAR2(20) NOT NULL 
      , datetime VARCHAR2(30) NOT NULL
      , hst_amount VARCHAR2(30) NOT NULL  
      , user_title VARCHAR2(20) NOT NULL 
      , prod_category VARCHAR2(30) NOT NULL
);

SELECT * FROM history;

-- 회원 명단테이블 CMEMBERLIST 
CREATE TABLE CMEMBERLIST (
	user_name varchar(20) PRIMARY KEY NOT NULL 
	,user_title varchar(20) NOT NULL 
	,user_id varchar(20) NOT NULL 
	,user_pw NUMBER(6) CHECK (LENGTH(user_pw) = 6) NOT NULL
)

INSERT ALL 
INTO CMEMBERLIST VALUES ('박수민','manager','sumin0759@gmail.com',123456)
INTO CMEMBERLIST VALUES ('이동호','staff','dongho7736@gmail.com',123456)
INTO CMEMBERLIST VALUES ('박세찬','deliver','guppy135@naver.com',123456)
INTO CMEMBERLIST VALUES ('이경주','deliver','rudwnzlxl6@naver.com',123456)
SELECT * FROM dual; 

COMMIT ; 
SELECT * FROM CMEMBERLIST; 

-- 회원 테이블 CMEMBER 
CREATE TABLE CMEMBER(
	user_title varchar(20) PRIMARY KEY NOT NULL 
	,user_name varchar(20) NOT NULL 
	,user_level NUMBER(5,0) NOT NULL 
); 

--level 1에 가까울 수록 보스
INSERT ALL
INTO CMEMBER VALUES ('manager','매니저',1) 
INTO CMEMBER VALUES ('staff','스태프',2)
INTO CMEMBER VALUES ('deliver','배달기사',3 )
SELECT * FROM dual;

UPDATE CMEMBER
SET user_level = 1 
WHERE user_name = '스태프'; 

UPDATE CMEMBER
SET user_level = 2
WHERE user_name = '배달기사'; 


SELECT * FROM CMEMBER;


CREATE USER deliver IDENTIFIED BY 12345;
GRANT SELECT ANY TABLE TO deliver;

--스태프한테 teamprod 테이블에 select,update,insert on teamprod to staff; 
-- 다시 스태프한테 delivery 권한은 select만 준 코드입니다 
-- 스태프는 상품 수정 빼곤 다 되지만 발주에서는 조회만 가능
- 
CREATE USER staff IDENTIFIED BY 12345;
GRANT SELECT ON delivery TO staff;

CREATE TABLE teamprod(
      prod_number NUMBER(20, 0) PRIMARY KEY NOT NULL      
    , prod_category varchar(30) NOT NULL
    , prod_name varchar(30) NOT NULL
    , prod_price number(20, 0) NOT NULL
    , prod_adult varchar(20) NULL
    , prod_amount number(20, 0) NULL
);

SELECT * FROM delivery;

CREATE TABLE DELIVERY(
			prod_name varchar2(20) PRIMARY KEY NOT NULL
	      , prod_order DATE
	      , prod_delivery DATE
			);
INSERT INTO MINIPROJECT.DELIVERY (PROD_NAME,PROD_ORDER,PROD_DELIVERY)
VALUES(prod_name,prod_orderdate,prod_delidate)

DROP TABLE BRAND ; --기존 브랜드 테이블 삭제 명령어 
CREATE TABLE BRAND( 
		prod_number number(20,0) PRIMARY KEY NOT NULL --상품번호(프라이머리 키 )
		, prod_category varchar(30) NOT NULL -- 상품 분류 카테고리  
		, prod_name varchar2(20) NOT NULL -- 상품 이름 
		, prod_brand varchar(20) NOT NULL -- 브랜드 명  
);

INSERT ALL 
	-- 상품 상위 카테고리 snacks/ beverage / ramen/ drink / necessaries 
	--과자 snacks
	INTO BRAND VALUES (1, 'snacks','cheetos','lotte')
	INTO BRAND VALUES (2,'snacks','cornchip', 'crown' )
	INTO BRAND VALUES (3,'snacks','pringles', 'nongshim' )
	INTO BRAND VALUES (4,'snacks','vicpie', 'crown' )
	INTO BRAND VALUES (5,'snacks','zec', 'lotte' )
	INTO BRAND VALUES (6,'snacks','bananakick', 'nongshim' )
	INTO BRAND VALUES (7,'snacks','potatochip', 'nongshim' )
	INTO BRAND VALUES (8,'snacks','doritos', 'lotte' )
	INTO BRAND VALUES (9,'snacks','pepero', 'lotte' )
	INTO BRAND VALUES (10,'snacks','binch', 'lotte' )
	INTO BRAND VALUES (11,'snacks','kicker', 'crown' )
	INTO BRAND VALUES (12,'snacks','butterwaffle', 'crown' )
	INTO BRAND VALUES (13,'snacks','postick', 'nongshim' )
	INTO BRAND VALUES (14,'snacks','chocopie', 'crown' )
	-- 음료 beverage 
	INTO BRAND VALUES (15,'beverage','caprisun', 'nongshim' )
	INTO BRAND VALUES (16,'beverage','welch''s', 'nongshim' )
	INTO BRAND VALUES (17,'beverage','pepsi', 'lotte' )
	INTO BRAND VALUES (18,'beverage','milkiss', 'lotte' )
	INTO BRAND VALUES (19,'beverage','delmont', 'lotte' )
	INTO BRAND VALUES (20,'beverage','liptin', 'lotte' )
	INTO BRAND VALUES (21,'beverage','hotsix', 'lotte' )
	INTO BRAND VALUES (22,'beverage','pocarisweat', 'donga' )
	INTO BRAND VALUES (23,'beverage','demisoda', 'donga' )
	INTO BRAND VALUES (24,'beverage','narangd', 'donga' )
	INTO BRAND VALUES (25,'beverage','caprisun', 'nongshim' )
	--라면 ramen
	INTO BRAND VALUES (26,'ramen','shinramen', 'lotte' )
	INTO BRAND VALUES (27,'ramen','neoguri', 'lotte' )
	INTO BRAND VALUES (28,'ramen','jjapaghetti', 'lotte' )
	INTO BRAND VALUES (29,'ramen','jinramen', 'otoki' )
	INTO BRAND VALUES (30,'ramen','chamggae', 'otoki' )
	INTO BRAND VALUES (31,'ramen','yeulramen', 'otoki' )
	INTO BRAND VALUES (32,'ramen','ggoggomen', 'paldo' )
	--술 drink 
	INTO BRAND VALUES (33,'drink','jinro', 'hite' )
	INTO BRAND VALUES (34,'drink','chamisul', 'hite' )
	INTO BRAND VALUES (35,'drink','saero', 'lotte' )
	INTO BRAND VALUES (36,'drink','chueum', 'lotte' )
	INTO BRAND VALUES (37,'drink','hite', 'hite' )
	INTO BRAND VALUES (38,'drink','terra', 'hite' )
	INTO BRAND VALUES (39,'drink','cloud', 'lotte' )
	INTO BRAND VALUES (40,'drink','crush', 'lotte' )
	-- 담배 sigarette
	INTO BRAND VALUES (41,'sigarette','esse', 'kt&g' )
	INTO BRAND VALUES (42,'sigarette','theone', 'kt&g' )
	INTO BRAND VALUES (43,'sigarette','marlboro', 'Philip_Morris' )
	INTO BRAND VALUES (44,'sigarette','cammel', 'rjreynolds' )
	INTO BRAND VALUES (45,'sigarette','mevius', 'Japan_Tobacco' )
	INTO BRAND VALUES (46,'sigarette','sevenstar', 'Japan_Tobacco' )
	-- 생필품 necessaries 
	INTO BRAND VALUES  (47,'necessaries','kleenex', 'yuhankimberly' )
	INTO BRAND VALUES (48,'necessaries','poppy', 'yuhankimberly' )
	INTO BRAND VALUES (49,'necessaries','oralb', 'oralb' )
	INTO BRAND VALUES (50,'necessaries','dentimate', 'clio' )
	INTO BRAND VALUES (51,'necessaries','sensodyne', 'sensoodyne' )
	INTO BRAND VALUES (52,'necessaries','perio', 'lg' )
	INTO BRAND VALUES (53,'necessaries','elastine', 'lg' )
	INTO BRAND VALUES (54,'necessaries','kerasys', 'aekyung' )
SELECT * FROM dual;

COMMIT;

SELECT * FROM BRAND;

SELECT * FROM teamprod;

INSERT ALL
  INTO DELIVERY VALUES('cheetos','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('cornchip','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('pringles','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('vicpie','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('zec','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('bananakick','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('potatochip','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('doritos','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('pepero','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('binch','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('kicker','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('butterwaffle','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('postick','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('chocopie','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('caprisun','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('welch''s','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('pepsi','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('milkiss','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('delmont','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('liptin','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('hotsix','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('pocarisweat','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('demisoda','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('narangd','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('shinramen','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('neoguri','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('jjapaghetti','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('jinramen','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('chamggae','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('yeulramen','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('ggoggomen','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('jinro','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('chamisul','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('saero','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('chueum','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('hite','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('terra','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('cloud','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('crush','2025-03-22','2025-03-25') 
  INTO DELIVERY VALUES('esse','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('theone','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('marlboro','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('cammel','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('mevius','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('sevenstar','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('kleenex','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('poppy','2025-03-08','2025-03-11')
  INTO DELIVERY VALUES('oralb','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('dentimate','2025-03-01','2025-03-04')
  INTO DELIVERY VALUES('sensodyne','2025-03-15','2025-03-18')
  INTO DELIVERY VALUES('perio','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('elastine','2025-03-22','2025-03-25')
  INTO DELIVERY VALUES('kerasys','2025-03-22','2025-03-25')
SELECT * FROM Dual;

COMMIT;

SELECT * FROM delivery;

--GRANT CREATE SESSION TO DELIVER;
--GRANT CREATE SESSION TO staff;


