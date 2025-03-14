/*
 * UPDATE/DELETE
 * 데이터변경 / 데이터 삭제 
 * */

--삭제 
SELECT count(*) FROM professor_new;

DELETE FROM professor_new 
WHERE profno = 1001;

--삭제시 WHERE 절 빼는 것은 극히 주의! 
DELETE FROM professor_new; --TRUNCATE와 동일하나 테이블 초기화는 없음 

-- 변경 
--PROFNO 4002인 수잔 서랜든의 아이디를 기존 Shrandon에서 SusanS로 급여를 330에서 350으로 올리시오.
BEGIN TRANSACTION ; 

UPDATE professor_new SET 
	ID ='Susans'
   ,PAY = 350
 WHERE PROFNO =4002;

SELECT * FROM professor_new;
ROLLBACK;