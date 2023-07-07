/*
    서브쿼리(sub query)
    1. 메인 쿼리에 포함되는 하위 쿼리
    2. 서브쿼리를 먼저 실행, 그 결과를 메인쿼리에 전달
    3. 종류
        1) SELECT절에 포함 : 스칼라 서브쿼리
        2) FROM절에 포함 : 인라인 뷰
        3) WHERE절에 포함: 단일 행 서브쿼리(결과가 1개) OR 다중 행 서브쿼리(결과가 N개)
*/

/*
    단일 행 서브쿼리(SINGLE ROW SUB QUERY)
    1. 결과가 1행 (1개)
    2. 단일 행 서브쿼리인 경우
        1) WHERE절에서 사용한 칼럼이 PK 또는 UNIQUE 칼럼인 경우
        2) 통계 함수를 사용한 경우 EX) SELECT COUNT(*) FROM EMPLOYEES 
    3. 단일 행 서브쿼리 연산자
        =, !=, >, >=, <, <=
        
    다중 행 서브쿼리(MULTIPLE ROW SUB QUERY)
    1. 결과가 N행
    2. 단일 행 서브쿼리 아니면 다중 행 서브쿼리임
    3. 다중 행 서브쿼리 연산자
        IN, ANY, ALL 등
*/

/*WHERE절의 서브쿼리*/
-- 1. 사원번호가 101인 사원의 직업과 동일한 직업을 가진 사원을 조회
SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = (SELECT JOB_ID 
                   FROM EMPLOYEES 
                  WHERE EMPLOYEE_ID = 101);
-- EMPLOYEE_ID는 PK 칼럼 -> 단일행서브쿼리 -> 등호 사용 가능

--2. 부서번호가 'IT'인 부서에 근무하는 사원 조회
--SELECT *
--  FROM EMPLOYEES
-- WHERE DEPARTMENT_ID = (부서명이 'IT'인 부서의 부서번호(부서테이블));
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'IT');
-- DEPARTMENT_NAME은 PK,UNIQUE 둘 다 아님 -> 중복이 지금은 없지만 중복 가능한 칼럼이므로 다중 행 서브쿼리 -> 등호 대신 IN 사용


-- 3. 'Seattle'에서 근무하는 사원 조회
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                           FROM DEPARTMENTS
                          WHERE LOCATION_ID IN (SELECT LOCATION_ID
                                                 FROM LOCATIONS
                                                WHERE CITY = 'Seattle'));
                                                
-- 4. 연봉 가장 높은 사원 조회
SELECT *
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);
 
-- 5. 가장 먼저 입사한 사원 조회
SELECT *
  FROM EMPLOYEES
 WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE) FROM EMPLOYEES);

-- 6. 평균 연봉 이상을 받는 사원 조회
SELECT *
  FROM EMPLOYEES
 WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES);
 
 
/* FROM절의 서브쿼리 */
-- 1. 연봉이 3번째로 높은 사원 조회
--    1) 높은 연봉 순으로 정렬
--    2) 정렬 결과에 행 번호 붙임
--    3) 행 번호 3을 가져옴

SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RN, EMPLOYEE_ID, SALARY
  FROM EMPLOYEES
 WHERE RN; --실행순서상 WHERE에서 RN 별명 인식 못함
 
SELECT RN, EMPLOYEE_ID, SALARY
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RN, EMPLOYEE_ID, SALARY
          FROM EMPLOYEES)
 WHERE RN = 3; --FROM이 실행순서 가장 빠르므로 RN 별명 다 인식됨
 
-- 2. 연봉 11~20번째 사원 조회
SELECT RN, EMPLOYEE_ID, SALARY
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RN, EMPLOYEE_ID, SALARY
          FROM EMPLOYEES)
 WHERE RN BETWEEN 11 AND 20;
 
-- 3. 21 ~ 30번째 입사한 사원 조회
SELECT EMPLOYEE_ID, HIRE_DATE
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE) AS RN, EMPLOYEE_ID, HIRE_DATE
          FROM EMPLOYEES)
 WHERE RN BETWEEN 21 AND 30;
 
/*SELECT 절의 서브쿼리*/
--부서번호가 50인 부서에 근무하는 사원번호, 사원명, 부서명 조회
--부서명=부서테이블, 나머지=사원테이블
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , (SELECT DEPARTMENT_NAME
          FROM DEPARTMENTS
         WHERE DEPARTMENT_ID =50) AS DEPT_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID =50; --메인쿼리와 서브커리가 서로 관계가 없는 비상관쿼리
 --WHERE 조건 안해주면 45개 조회되어야 하는데 107개 전체가 조회됨
 
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , (SELECT D.DEPARTMENT_NAME
          FROM DEPARTMENTS D
         WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
           AND D.DEPARTMENT_ID = 50) AS DEPT_NAME
  FROM EMPLOYEES E; --상관쿼리
--이 쿼리가 더 나음. 번호(50) 수정 시 바꿀게 적음
--조인으로 풀면 더 간단한 문제