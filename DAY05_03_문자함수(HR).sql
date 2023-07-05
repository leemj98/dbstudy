-- 1. 대소문자 변환하기
SELECT UPPER(EMAIL) -- 모두 대문자
     , LOWER(EMAIL) -- 모두 소문자
     , INITCAP(EMAIL) -- 첫글자만 대문자
  FROM EMPLOYEES;
  
-- 2. 글자 수
SELECT FIRST_NAME
     , LENGTH(FIRST_NAME)
  FROM EMPLOYEES;
  
-- 3. 바이트 수
SELECT FIRST_NAME
     , LENGTHB(FIRST_NAME)
  FROM EMPLOYEES;
  
--4. 연결하기
-- 1) || 연산자 (오라클 전용, 다른 DB에서는 오류)
-- 2) CONCAT 함수
--  CONCAT(A, B) : 인수를 2개만 전달할 수 있음 (MYSQL은 3개도 됨)
--  CONCAT(CONCAT(A,B),C) : 인수 3개 이상은 CONCAT 함수 여러 개로 해결
SELECT *
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE CONCAT('515', '%'); -- CONCAT('515', '%') = '515' || '%'
 
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL LIKE CONCAT(CONCAT('%','A'),'%'); -- A를 포함('%' || 'A' || '%')
 
-- 5. 일부만 반환하기
SELECT SUBSTR(PHONE_NUMBER,1,3) -- 전화번호 1번째 글자부터 3글자 반환
     , SUBSTR(PHONE_NUMBER,5) -- 전화번호 5번째 글자부터 끝까지 반환
  FROM EMPLOYEES;
  
-- 6. 특정 문자의 위치 반환
--  문자의 위치는 1부터 시작
--  못 찾으면 0 반환
--  두 개 이상일 땐 첫번째로 발견된 위치
SELECT EMAIL
     , INSTR(EMAIL, 'A')
  FROM EMPLOYEES;
  
-- 7. 바꾸기
SELECT EMAIL
     , REPLACE(EMAIL, 'A', '$') -- 모든 A 찾아서 $로 바꾸기
  FROM EMPLOYEES;
  
  
-- 8. 채우기
--  1) LPAD(표현식, 전체폭, 채울문자)
--  2) RPAD(표현식, 전체폭, 채울문자)
SELECT DEPARTMENT_ID
     , LPAD(DEPARTMENT_ID, 3, 0)
     , EMAIL
     , RPAD(SUBSTR(EMAIL,1,2),5,'*') --이메일 첫 두글자 사용, 다섯자리로 만들어줘야하고 모자란 자리는 *표 (개인정보 마스킹 등에 활용)
  FROM EMPLOYEES;
  
-- 9. 공백 제거
SELECT '[' || LTRIM('     HELLO     WORLD     ') || ']'--왼쪽 공백 제거 [' ||  || ']'는 공백 잘 보이라고 해준 것
     , '[' || RTRIM('     HELLO     WORLD     ') || ']'--오른쪽 공백 제거
     , '[' || TRIM('     HELLO     WORLD     ') || ']'--양쪽 공백 제거
  FROM DUAL;
-- 중간 공백 제거는 없음

-- 실습
-- 1. 사원 테이블의 JOB_ID에서 밑줄(_) 앞,뒤 분리 조회
-- 예시) IT_PROG  -> IT / PROG
-- 글자수=7, 밑줄위치=3, 밑줄앞글자수=2(밑줄위치-1)
-- 밑줄뒤글자수=4(글자수-밑줄위치) <- 숫자 하나만 쓰면 자동으로 끝까지 계산해줘서 계산 필요하지 않음
SELECT JOB_ID
     , SUBSTR(JOB_ID,1,INSTR(JOB_ID, '_')-1)
     , SUBSTR(JOB_ID,INSTR(JOB_ID,'_')+1) -- = SUBSTR(JOB_ID,INSTR(JOB_ID,'_')+1,LENGTH(JOB_ID)-INSTR(JOB_ID,'_'))
  FROM EMPLOYEES;
  
-- 2. FIRST_NAME과 LAST_NAME을 연결해서 모두 대문자로 바꾼 FULL_NAME 조회하기
SELECT FIRST_NAME
     , LAST_NAME
     , UPPER(CONCAT(FIRST_NAME,CONCAT(' ',LAST_NAME))) AS FULL_NAME
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID;