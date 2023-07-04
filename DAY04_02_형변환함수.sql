/*
    DUAL 테이블
    1. DUMMY 칼럼 1개를 가지고 있는 테이블
    2. 'X' 값을 가지고 있음
    3. FROM절이 필요없는 SELECT문을 사용할 때 DUAL 테이블 이용
*/

SELECT 1+1 FROM DUAL;
CREATE SEQUENCE TEST_SEQ ORDER;
SELECT TEST_SEQ.NEXTVAL FROM DUAL;


/* 
함수 (외울 필요 없고 이해만)

    <타입 변환 함수>
    데이터타입변환: 숫자, 날짜, 문자 등의 데이터 타입을 바꾸는 것

    1. 문자 -> 숫자 변환
        TO_NUMBER(문자)
    2. 숫자 -> 문자 변환
        TO_CHAR(숫자, [형식])
    3. 날짜 -> 문자 변환
        TO_CHAR(날짜, [형식])
        
        *날짜/시간 형식
        1) YY: 년도 2자리
        2) YYYY: 년도 4자리
        3) MM: 월 2자리(01~12)
        4) DD: 일 2자리(01~31)
        5) AM: 오전 / 오후
        6) HH: 12시각(01~12)
        7) HH24: 24시각(00~23)
        8) MI: 분(00~59)
        9) SS: 초(00~59)
    4. 문자 -> 날짜 변환
        TO_DATE(문자, [형식])
        1) SYSDATE, SYSTIMESTAMP: 현재 날짜와 시간
        
*/

--1
SELECT TO_NUMBER('123')
  FROM DUAL; 

--2
SELECT TO_CHAR(1234) --'1234'
     , TO_CHAR(1234, '999999') 
     -- 999999: 9개수=자리수, 여섯자리로 나타내라는 뜻 '  1234' 
     , TO_CHAR(1234, '000000')
     -- 빈자리 0으로 채우기 '001234'
     , TO_CHAR(1234, '9,999') --'1,234'
     , TO_CHAR(12345, '9,999') --'######' 숫자는 5자리인데 형식은 4자리만 지정되어 있어서
     , TO_CHAR(12345, '99,999') --'12,345'
  FROM DUAL; 

--3
SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD AM HH:MI:SS')
  FROM EMPLOYEES; --시간은 오전 12시로만 나옴(시간 입력데이터가 없어서)

--4 
SELECT SYSDATE --'23/07/04'
     , SYSTIMESTAMP --'23/07/04 14:47:26.713000000 +09:00'
  FROM DUAL;
  
--4 형식 지정
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS') --2023-07-04 오후 03:04:37
     , TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS') --2023-07-04 15:04:37
  FROM DUAL;

-- 문자로 된 날짜/시간을 실제 날짜/시간 타임으로 변환
SELECT TO_DATE('23/07/04'), --년월일 형식으로 해석 (생략가능)
       TO_DATE('23/07/04', 'DD/MM/YY') --일월년 형식으로 해석 
  FROM DUAL;
  
-- 예제 데이터 작성
DROP TABLE EXAMPLE_T;
CREATE TABLE EXAMPLE_T(
    DT1 DATE,
    DT2 TIMESTAMP
);
INSERT INTO EXAMPLE_T(DT1, DT2) VALUES(SYSDATE, SYSTIMESTAMP);
COMMIT;
--DT1이 '23/07/04'인 데이터를 조회(안되는게 정상)
SELECT * 
  FROM EXAMPLE_T
 WHERE DT1 = '23/07/04';
--DT1이 '23/07/04'인 데이터를 조회(안되는게 정상)
SELECT *
  FROM EXAMPLE_T
 WHERE DT1 = TO_DATE('23/07/04', 'YY/MM/DD');
--DT1이 '23/07/04'인 데이터를 조회(됨) 둘 다 TO_DATE해야 됨
SELECT *
  FROM EXAMPLE_T
 WHERE TO_DATE(DT1, 'YY/MM/DD') = TO_DATE('23/07/04', 'YY/MM/DD');