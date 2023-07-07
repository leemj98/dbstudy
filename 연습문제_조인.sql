-- 1. LOCATION_ID가 1700인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오.
-- 1) ANSI
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E 
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 WHERE LOCATION_ID = 1700;

-- 2) 오라클
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND D.LOCATION_ID = 1700;

-- 2. DEPARTMENT_NAME이 'Executive'인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME을 조회하시오.
-- 1) ANSI
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE  

-- 2) 오라클



-- 3. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME, STREET_ADDRESS, CITY를 조회하시오.
-- 1) ANSI


-- 2) 오라클



-- 4. 부서별 DEPARTMENT_NAME과 사원 수와 평균 연봉을 조회하시오.
-- 1) ANSI


-- 2) 오라클



-- 5. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오. 부서가 없는 사원의 부서명은 'None'으로 조회되도록 처리하시오.
-- 1) ANSI


-- 2) 오라클



-- 6. 모든 부서의 DEPARTMENT_NAME과 근무 중인 사원 수를 조회하시오. 근무하는 사원이 없으면 0으로 조회하시오.
-- 1) ANSI


-- 2) 오라클



-- 7. 모든 부서의 DEPARTMENT_ID, DEPARTMENT_NAME, STATE_PROVINCE, COUNTRY_NAME, REGION_NAME을 조회하시오.
-- 1) ANSI


-- 2) 오라클



-- 8. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER의 FIRST_NAME을 조회하시오. (SELF JOIN)
-- 1) ANSI

-- FROM
-- EMPLOYEES E : 사원 테이블
-- EMPLOYEES M : 상사 테이블

-- 0N 
-- 사원테이블의 매니저번호 = 매니저의 사원번호

-- 사원테이블 E (드리븐테이블)       | 상사테이블 M (드라이브테이블)
--                        FK         | PK
-- 사원번호     이름      매니저번호 | 사원번호    이름      매니저번호
--    1         KIM         NULL     |    1         KIM         NULL   
--    2         LEE          1       |    2         LEE          2
--    3         PARK         1       |    3         PARK         2
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME -- 사원정보
     , M.EMPLOYEE_ID, M.FIRST_NAME, M.LAST_NAME -- 상사정보
  FROM EMPLOYEES M RIGHT OUTER JOIN EMPLOYEES E
    ON M.EMPLOYEE_ID = E.MANAGER_ID;

-- 2) 오라클
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME -- 사원정보
     , M.EMPLOYEE_ID, M.FIRST_NAME, M.LAST_NAME -- 상사정보
  FROM EMPLOYEES M, EMPLOYEES E
 WHERE M.EMPLOYEE_ID(+) = E.MANAGER_ID;


-- 9. 각 사원 중에서 매니저보다 먼저 입사한 사원을 조회하시오. (SELF JOIN)
-- 1) ANSI


-- 2) 오라클



-- 10. 같은 부서에 근무하는 사원 중에서 나보다 SALARY가 높은 사원 정보를 조회하시오. (SELF JOIN)
-- 1) ANSI

-- 2) 오라클
