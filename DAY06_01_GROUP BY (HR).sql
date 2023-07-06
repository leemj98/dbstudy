/*
    GROUP BY절
    1. 같은 값을 가진 데이터들을 하나의 그룹으로 묶어서 처리
    2. 통계를 내는 목적으로 사용 (합계, 평균, 최댓값, 최솟값, 갯수 등)
    3. SELECT 절에서 조회하려는 칼럼은 반드시 GROUP BY 절에 명시되어 있어야 함
*/

-- 1. 사원 테이블에서 동일한 부서번호를 가진 사원들을 그룹화하여 각 그룹별로 몇명의 사원이 있는지 조회
SELECT DEPARTMENT_ID    -- GROUP BY 절에서 지정한 칼럼만 조회 가능
     , COUNT(*)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;
 
-- 2. 사원 테이블에서 같은 직업을 가진 사원들을 그룹화하여 각 그룹별로 연봉의 평균이 얼마인지 조회
SELECT JOB_ID
     , AVG(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID;
 
 -- 3. 사원 테이블에서 전화번호 앞 3자리가 같은 사원들을 그룹화하여 각 그룹별로 연봉의 합계가 얼마인지 조회
SELECT SUBSTR(PHONE_NUMBER,1,3)
     , SUM(SALARY)
  FROM EMPLOYEES
 GROUP BY SUBSTR(PHONE_NUMBER,1,3);
 
 -- 참고. GRUOP BY 절 없이 통계내기
 SELECT DISTINCT DEPARTMENT_ID
      , COUNT(*) OVER(PARTITION BY DEPARTMENT_ID)
      , ROUND(AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID), 2) --부서별 연봉 평균
   FROM EMPLOYEES;
   
   
/*
    HAVING 절
    1. GROUP BY 절 이후에 사용
    2. GROUP BY 절을 이용한 조회 결과에 조건을 지정하는 경우 사용
    3. GROUP BY 절이 필요하지 않은 조건은 WHERE 절로 지정
*/

-- 4. 사원 테이블에서 각 부서별 사원수가 20명 이상인 부서를 조회
-- 조건: 부서별 사원수 >=20
-- 조건에서 사용되는 부서별  사원수는 GROUP BY 절이 필요하므로 HAVING 절로 처리
SELECT DEPARTMENT_ID
     , COUNT(*)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 5. 사원 테이블에서 각 부서별 사원수를 조회. 단, 부서번호가 없는 사원은 제외
-- 조건: 부서번호 IS NOT NULL
-- 조건에서 사용되는 부서번호는 GROUP BY 절이 필요없으므로 WHERE절로 처리
SELECT DEPARTMENT_ID
     , COUNT(*)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL --GROUP BY를 하지 않아도 알 수 있는 조건은 WHERE로 작성 (성능문제)
 GROUP BY DEPARTMENT_ID; 