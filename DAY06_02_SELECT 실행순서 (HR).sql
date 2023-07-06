/*
    SELECT문의 실행 순서
    SELECT 칼럼       5
      FROM 테이블     1
     WHERE 조건       2
     GROUP BY 그룹    3
    HAVING 그룹조건   4
     ORDER BY 정렬    6
*/

-- 사원 테이블에서 부서별 연봉 평균을 조회
SELECT DEPARTMENT_ID
     , ROUND(AVG(SALARY), 2)
  FROM EMPLOYEES E
 GROUP BY E.DEPARTMENT_ID; --실행됨. FROM이 GROUP BY보다 먼저 실행되므로 별명 적용
 
SELECT DEPARTMENT_ID AS DEPT_ID
     , ROUND(AVG(SALARY), 2)
  FROM EMPLOYEES 
 GROUP BY DEPT_ID; --실행안됨. SELECT는 GROUP BY보다 나중에 실행되기 때문에 별명 적용 안됨
 
-- 사원 테이블에서 부서별 연봉 평균과 사원수를 조회. 부서별 사원수가 2명 이상인 부서만 조회
SELECT DEPARTMENT_ID AS DEPT_ID
     , ROUND(AVG(SALARY), 2)
     , COUNT(*) AS 부서별사원수
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >=2 -- 별명인 부서별사원수로 적어주면 실행안됨
 ORDER BY DEPT_ID; -- DEPT_ID 별명 적용됨