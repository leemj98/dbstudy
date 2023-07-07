-- 알아볼 수 있는 것도 전부 오너 명시 하기


-- 내부 조인
-- 1. 사원번호, 사원명, 부서번호, 부서명 조회
-- 사원번호, 사원명, 부서번호 - 사원 테이블
-- 부서번호, 부서명 - 부서 테이블
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID 
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E -- INNER JOIN 대신 콤마 사용
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID; -- ON 대신 WHERE 사용
    
    
-- 2. 사원번호, 사원명, 지업, 직업별 최대연봉, 최소 연봉
SELECT EMPLOYEE_ID
      , FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME
      , J.JOB_ID
      , SALARYY
      , MAX_SALARY
      , MIN_SALARY
  FROM JOBS , EMPLOYEES E
 WHERE J.JOB_ID = E.JOB_ID;
    
-- 외부 조인
-- 3. 모든 사원들의(부서가 없는 사원도 포함) 사원번호, 사원명, 부서번호, 부서명 조회
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E -- 오른쪽 테이블(EMPLOYEES)의 모든 데이터를 조회하시오 (EMPLOYEES에서 부서번호가 없는 사원도 조회)
 WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID; -- RIGHT OUTER JOIN은 반대방향(LEFT)에 '+' 추가함

-- 4. 사원번호, 사원명, 부서번호, 부서명 조회. 사원이 근무하지 않는 유령 부서도 조회
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E -- 왼쪽 테이블(DEPARTMENTS)의 모든 데이터를 조회하시오 (사원이 근무하지 않는 부서도 조회)
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID(+); --LEFT OUT JOIN은 반대방향(RIGHT)에 '+' 추가함    


-- 3개 이상 테이블 조인하기
--5. 사원번호, 사원명, 부서번호, 부서명, 근무지역을 조회
-- 사원번호, 사원명, 부서번호 - EMPLOYEES
-- 부서번호, 부서명, 근무지역 - DEPARTMENT
-- 근무지역 - LOCATION
SELECT EMPLOYEE_ID 
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
     , L.LOCATION_ID
     , CITY
  FROM LOCATIONS L ,DEPARTMENTS D, EMPLOYEES E
 WHERE L.LOCATION_ID = D.LOCATION_ID
    AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;

    
--6. 부서번호, 부서명, 근무도시, 근무국가를 조회
SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME
     , CITY
     , COUNTRY_NAME
  FROM COUNTRIES C, LOCATIONS L, DEPARTMENTS D
 WHERE C.COUNTRY_ID = L.COUNTRY_ID
   AND L.LOCATION_ID = D.LOCATION_ID;