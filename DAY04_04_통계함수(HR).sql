/*
    통계 함수
    1. SUM(표현식): 합계
    2. AVG(표현식): 평균
    3. MAX(표현식): 최댓값
    4. MIN(표현식): 최솟값
    5. COUNT(표현식): 갯수
*/

-- 1. 사원 테이블에서 전체 사원의 연봉 합계 조회
SELECT SUM(SALARY) AS 연봉합계
  FROM EMPLOYEES;
  
-- 2. 사원 테이블에서 전체 사원의 커미션 퍼센트 평균 조회
-- 커미션이 없는 사원은 제외하고 조회 (직접 제외 안해도 모든 함수들은 NULL값을 제외함)
SELECT AVG(COMMISSION_PCT) AS 커미션퍼센트평균
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;   -- 커미션이 없는 사원 제외하는 조건식이지만 필요없음. AVG 함수는 자체적으로 NULL 제외
 
 -- 3. 사원 테이블에서 전체 사원의 최대 연봉 조회
SELECT MAX(SALARY) AS 최대연봉
  FROM EMPLOYEES;
 
 -- 4. 사원 테이블에서 전체 사원의 최대 커미션 조회
 -- 커미션 = 연봉 * 커미션퍼센트
SELECT MAX(SALARY*COMMISSION_PCT) AS 최대커미션
  FROM EMPLOYEES;
  
 -- 5. 사원 테이블에서 전체 사원 중 가장 나중에 입사한 사원의 입사일 조회
SELECT MAX(HIRE_DATE) AS 최근고용일
  FROM EMPLOYEES;
-- 가장 나중 -> 큰날짜 구하기 = MAX (날짜=숫자, 타임스탬프 이용하는데 그게 시간 지날수록 커지게 설계)

-- 6. 전체 사원 수 조회
-- 전체 갯수 구하기 ***
-- 1) NOT NULL이 확실한 칼럼(대표적으로 PK)으로 갯수 구함
SELECT COUNT(EMPLOYEE_ID) AS 전체사원수
  FROM EMPLOYEES;
-- 2) 모든 칼럼(*)으로 갯수를 구함 ***
SELECT COUNT(*) AS 전체사원수
  FROM EMPLOYEES;
  
-- 7. 사원들이 근무하는 부서의 갯수 조회
SELECT COUNT(DISTINCT DEPARTMENT_ID) AS 전체부서수
  FROM EMPLOYEES; 
--NULL 빼고 11개 나옴