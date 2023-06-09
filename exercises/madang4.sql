-- 3-1 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름

SELECT name FROM CUSTOMER, BOOK, ORDERS
WHERE ORDERS.CUSTID = CUSTOMER.CUSTID
AND BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID != 1
and publisher in
(SELECT PUBLISHER FROM CUSTOMER, BOOK, ORDERS
WHERE ORDERS.CUSTID = CUSTOMER.CUSTID 
AND ORDERS.CUSTID = 1
AND BOOK.BOOKID = ORDERS.BOOKID);

-- 3-2 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이
SELECT NAME FROM CUSTOMER, BOOK, ORDERS
WHERE ORDERS.CUSTID = CUSTOMER.CUSTID
AND BOOK.BOOKID = ORDERS.BOOKID
GROUP BY NAME
HAVING COUNT(PUBLISHER) >= 2;

-- 4-1 새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고됐다.
-- 삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
-- INSERT INTO BOOK (BOOKNAME, PUBLISHER, PRICE) VALUES('스포츠 세계', '대한미디어',
-- 10000)
-- BOOKID가 필요하다.
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES(12, '스포츠 세계', '대한미디어',10000);

-- 4-2 '삼성당'에서 출판한 도서를 삭제하라
DELETE FROM BOOK WHERE PUBLISHER LIKE '삼성당';

-- 4-3 '이상미디어'에서 라출판한 도서를 삭제하라. 안될경우 원인을 생각해
-- DELETE FROM BOOK WHERE PUBLISHER LIKE '이상미디어';
-- ORDERS 테이블에서 7, 8번 BOOKID를 참조하는 행이 있어서

-- 4-4 출판사 '대한미디어'가 '대한출판사'로 이름을 바꾸었다.
UPDATE BOOK SET PUBLISHER = '대한출판사' WHERE PUBLISHER LIKE '대한미디어';
SELECT * FROM BOOK;