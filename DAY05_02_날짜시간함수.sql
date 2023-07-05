--날짜: DATE, TIMESTAMP, VARCHAR2 등 회사마다 다르게 사용
-- 1. 현재 날짜 및 시간

-- 오라클이 설치된 서버 기준 시간 
SELECT SYSDATE -- DATE 형식
     , SYSTIMESTAMP -- TIMESTAMP 형식
  FROM DUAL;
  
-- 세션타임존 기준 시간
SELECT SESSIONTIMEZONE --Asia/Seoul
     , CURRENT_DATE --DATE 형식
     , CURRENT_TIMESTAMP -- TIMESTAMP 형식
  FROM DUAL;
  
-- 날짜를 원하는 형식으로 조회하기
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS:FF3') --밀리초(천분의 1초) 포함
  FROM DUAL;
     
-- 3. DATE 형식의 날짜 연산
-- 1) 1일을 숫자 1로 처리
-- 2) 1=1일, 1/24=1시간, 1/24/60=1분, 1/24/60/60 = 1초
SELECT TO_CHAR(SYSDATE +1, 'YYYY-MM-DD AM HH:MI:SS'), --1일 후
       TO_CHAR(SYSDATE+1/24, 'YYYY-MM-DD AM HH:MI:SS'), --1시간 후
       TO_CHAR(SYSDATE+1/24/60, 'YYYY-MM-DD AM HH:MI:SS'), --1분 후
       TO_CHAR(SYSDATE+1/24/60/60, 'YYYY-MM-DD AM HH:MI:SS') --1초 후
  FROM DUAL;
-- 특정 시점에서 경과한 일수 구하기: 비밀번호 변경 안내창 등에서 활용
SELECT SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD') -- 23/07/01에서 현재까지 며칠 지났는지
     , TRUNC(SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD')) -- 소수점 없애기 (경과한 일수)
  FROM DUAL;  

--4. TIMESTAMP 형식의 날짜 연산
-- 1) INTERVAL 키워드 이용
-- 2) YEAR, MONTH, DAY, HOUR, MINUTE, SECOND 단위 사용
SELECT SYSTIMESTAMP + INTERVAL '1' YEAR -- 1년 후
     , SYSTIMESTAMP + INTERVAL '1' MONTH -- 1개월 후
  FROM DUAL;
-- 경과한 일수 구하기
SELECT SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD')
     , EXTRACT(DAY FROM SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD')) -- 경과한 기간에서 일수 추출
  FROM DUAL;
  -- TIMESTAMP에서는 TRUNC 쓰면 오류 (경과한 기간이 숫자가 아닌 TIMESTAMP 형식으로 반환되기 때문)
 
 
-- 5. 필요한 단위 추출
SELECT EXTRACT(YEAR FROM SYSDATE)
     , TO_CHAR(SYSDATE, 'YYYY') -- TO_CHAR 함수를 추출용도로 사용
     , EXTRACT(MONTH FROM SYSDATE)
     , EXTRACT(DAY FROM SYSDATE)
     , EXTRACT(HOUR FROM SYSTIMESTAMP) -- UTC(표준시) 기준 (SYSDATE 기본값은 년원일만 나타내주기 때문에 HOUR, MINUTE, SECOND는 타임스탬프 써야 함)
     , EXTRACT(HOUR FROM SYSTIMESTAMP)+9 -- Asia/Seoul 기준       
     , EXTRACT(MINUTE FROM SYSTIMESTAMP)
     , EXTRACT(SECOND FROM SYSTIMESTAMP)
     , TRUNC(EXTRACT(MINUTE FROM SYSTIMESTAMP))
  FROM DUAL;
  
-- 6. 요일을 기준으로 특정 날짜 구하기
SELECT NEXT_DAY(SYSDATE, '수') -- 다음 수요일 구하기
     , NEXT_DAY(SYSDATE-8, '수') -- 저번주 수요일 구하기, -7하면 답 안나올 수도 있으니 -8
  FROM DUAL;
  
-- 7. N개월 전후 날짜 구하기
SELECT ADD_MONTHS(SYSDATE, 1) -- 1개월 후
     , ADD_MONTHS(SYSDATE, -1) -- 1개월 전
     , ADD_MONTHS(SYSDATE, 5*12) -- 5년 후
  FROM DUAL;
-- 일수는 더하기빼기 월수년수는 함수(ADD_MONTHS)

-- 8. 경과한 개월 수 구하기
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('23/01/01', 'YY/MM/DD'))
  FROM DUAL;