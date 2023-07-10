/*
    ROWID
    1. 오라클에서 제공하는 가상 칼럼(PSEUDO (수두 슈두) COLUMN)
    2. 어떤 행이 어디에 저장되어 있는지 알고 있는 칼럼
    3. 실제 저장된 물리적 저장위치를 확인 가능
*/

-- ROWID 확인
SELECT ROWID, EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;
  
-- ROWID를 이용한 조회
--1. 오라클에서 가장 빠른 조회 방법
--2. 실무에서 사용하는 것은 불가능. 대신 사용하는 것이 인덱스
SELECT *
  FROM EMPLOYEES
 WHERE ROWID ='AAAR+IAAHAAAADOAAE'; -- ROWID 5번째 사람
 
 
/*
    인덱스
    1. 빠른 조회를 지원하는 데이터베이스 객체
    2. 어떤 데이터가 어떤 ROWID를 가지고 있는지 알고 있음
    3. 기본키(PK)와 중복이 없는 칼럼(UNIQUE)은 자동으로 인덱스가 만들어짐
    4. 데이터의 삽입/수정/삭제 시 인덱스도 함께 갱신해야 하기 때문에 인덱스가 많으면 전체 성능이 떨어질 수 있음
*/

-- 인덱스를 타는 조회
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID ='150'; -- 빠른 조회 가능

-- 인덱스를 안 타는 조회 (칼럼을 그대로 쓰지 않고 함수로 적으면 인덱스 타지 않음. 가능하면 칼럼(왼쪽) 건들지 말고 함수는 뒤로)
SELECT *
  FROM EMPLOYEES
 WHERE TO_CHAR(EMPLOYEES)='150';
 

/*
    데이터 사전
    1. 특정 데이터의 정보를 담고 있는 객체
    2. 시스템 카탈로그, 메타 데이터라고 함
    3. 계정 유형별로 관리
        1) DBA_ : 가장 많은 정보 담고 있음
        2) USER_ : 유저가 가지고 있는 것
        3) ALL_ : 유저가 접근할 수 있는 것

*/

-- 인덱스 정보가 저장되어 있는 데이터 사전(이미 만들어진 테이블)
-- DBA_INDEXES, USER_INDEXES, ALL_INDEXED 
SELECT * FROM USER_INDEXES; --HR 계정은 DBA가 아니라서 DBA_INDEXES 못봄

-- 인덱스가 설정된 칼럼 정보가 저장되어 있는 데이터 사전
-- DBA_IND_COLUMNS, USER_IND_COLUMNS, ALL_IND_COLUMNS
SELECT * FROM USER_IND_COLUMNS; -- 어느 테이블 어느 칼럼에 인덱스가 주어져있는지 명확하게 확인 가능

SELECT * FROM USER_IND_COLUMNS WHERE TABLE_NAME='EMPLOYEES'; -- EMPLOYEES 테이블의 인덱스만 확인



-- 부서 테이블의 부서명(DEPARTMENT_NAME) 칼럼에 인덱스 설정하기
CREATE INDEX DEPT_NAME_IX
    ON DEPARTMENTS(DEPARTMENT_NAME);
    
-- 인덱스 DEPT_NAME_IX 삭제하기
DROP INDEX DEPT_NAME_IX;