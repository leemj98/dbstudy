/*
    뷰
    1. 테이블이나 다른 뷰를 이용해서 만든 가상 테이블
    2. 데이터가 아닌 쿼리문만을 저장하고 있음
    3. 자주 하고 복잡한 쿼리문을 뷰로 만들어두면 쉽게 호출해서 사용할 수 있음
*/

-- 뷰 생성
CREATE VIEW V_EMP AS  (
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.JOB_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
    );
    
-- 뷰 조회
SELECT *
  FROM V_EMP;
  
-- 뷰 조회 연습
--1. 사원번호, 사원명, 부서번호, 부서명, 지역번호, 도로명 주소를 조회
SELECT V.EMPLOYEE_ID, V.FIRST_NAME, V.LAST_NAME, V.DEPARTMENT_ID, V.DEPARTMENT_NAME, L.LOCATION_ID, L.STREET_ADDRESS
  FROM LOCATIONS L INNER JOIN V_EMP V
    ON L.LOCATION_ID = V.LOCATION_ID;
-- 뷰 이용한 두 개 조인이지만 사실은 세 개(E,D,L) 조인이랑 같은 결과


--2. 사원번호, 사원명, 직무번호, 직무이름(JOB_TITLE)을 조회
SELECT V.EMPLOYEE_ID, V.FIRST_NAME, V.LAST_NAME, J.JOB_ID, J.JOB_TITLE
  FROM JOBS J INNER JOIN V_EMP V
    ON J.JOB_ID = V.JOB_ID;

-- 뷰 삭제
DROP VIEW V_EMP;