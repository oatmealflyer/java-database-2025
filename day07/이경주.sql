-- 문1번 
SELECT m.email AS "email", m.MOBILE AS "mobile",m.NAMES AS "names",m.ADDR AS "addr"
FROM MEMBERTBL m ;

-- 문2번 
SELECT b.NAMES AS "도서명", b.author AS "저자",b.ISBN AS "ISBN",b.PRICE AS "정가"
FROM BOOKSTBL b
ORDER BY b.isbn;

-- 문3번 
SELECT m.names AS "비대여자명", m.levels AS "등급 ",m.ADDR AS "주소",r.RENTALDATE AS "대여일"
FROM MEMBERTBL m , RENTALTBL r
WHERE r.idx(+) = m.idx 
AND r.RENTALDATE IS NULL ;

COMMIT; 
-- 문4번 

SELECT nvl(d.names,'--합계--') AS "장르", 
	to_char(sum(b.PRICE),'999,9999')||'원' AS "총합계금액"
	FROM DIVTBL d , BOOKSTBL b 
	WHERE d.division = b.division
	GROUP BY ROLLUP(d.NAMES); 



