/*
    DML
    1. Data Manipulation Language
    2. 데이터(행, row)를 조작(삽입, 수정, 삭제)하는 언어
    3. 트랜잭션 대상이다 (작업이 완료되면 COMMIT(저장), 작업을 취소하려면 ROLLBACK이 필요) -커밋 안해주면 저장 안됨
        1) COMMIT: 작업을 저장, COMMIT이 완료되면 ROLLBACK으로 취소할 수 없음
        2) ROLLBACK: 작업을 취소, COMMIT 이후 작업을 취소하는 것
    4. 종류
        1) 삽입: INSERT INTO VALUES
        2) 수정: UPDATE SET WHERE
        3) 삭제: DELETE FROM WHERE
*/

-- 참고.
-- 자격증에서는 DML의 범주를 INSERT,UPDATE,DELETE+SELECT로 보기도 함 (수업에서는 SELECT 별도로)

DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;

CREATE TABLE DEPARTMENT_T (
    DEPT_NO NUMBER              NOT NULL,
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
    LOCATION VARCHAR2(15 BYTE)  NOT NULL,
    CONSTRAINT PK_DEPART PRIMARY KEY(DEPT_NO) 
    );
   
  
CREATE TABLE EMPLOYEE_T (
    EMP_NO    NUMBER            NOT NULL,
    NAME      VARCHAR2(20 BYTE) NOT NULL,
    DEPART    NUMBER,
    POSITION  VARCHAR2(20 BYTE),
    GENDER    CHAR(2 BYTE),
    HIRE_DATE DATE,
    SALARY    NUMBER,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_DEPART_EMP FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL
);

/*
-- 부서번호를 생성하는 시퀀스 만들기 
CREATE SEQUENCE DEPT_SEQ -- (전부 디폴트값으로 적음)
    INCREMENT BY 1 -- 1식 증가하는 번호 생성
    START WITH 1 -- 1부터 번호를 만듦
    NOMAXVALUE -- 번호의 상한선 없음
    NOMINVALUE -- 번호의 하한선 없음
    NOCYCLE -- 상한선, 하한선 다음번호는 한바퀴 돌아서(번호 순환 없음), 상한선이나 하한선을 정했을 때 함께 쓰는 옵션
    CACHE 20 -- 한번에 20개씩 번호를 미리 만들어 둠
    NOORDER -- 번호를 순서없이 사용 (순서대로 사용하지 않음) - 번호를 순서대로 사용하는 ORDER 옵션으로 바꿔서 시퀀스 생성함
; 
*/

-- 부서번호 생성 시퀀스
DROP SEQUENCE DEPT_SEQ;
CREATE SEQUENCE DEPT_SEQ ORDER; -- 나머지는 생략해서 디폴트값으로 써도 시퀀스 작업 가능

-- 부서 데이터 입력
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '영업부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '총무부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '기획부', '서울');

-- 사원번호 생성 시퀀스
DROP SEQUENCE EMP_SEQ;
CREATE SEQUENCE EMP_SEQ 
    START WITH 1001
    ORDER;

-- 사원 데이터 입력
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95-05-01', 5000000); -- 날짜는 하이픈 또는 슬래시로 구분
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '김민서', 1, '사원', 'M', '17-09-01', 2500000);
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '이은영', 2, '부장', 'F', '90/09/01', 5500000);
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '한성일', 2, '과장', 'M', '93/04/01', 5000000);
-- INSERT INTO EMPLOYEE_T VALUES(EMP_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95-05-01', 5000000); 순서대로 다 적으면 칼럼 이름 생략 가능한데 다 적는게 낫다

COMMIT;

ROLLBACK; -- 이전 커밋으로 돌아가는 것 (커밋을 취소하는 것 아님. 커밋 이후 작업을 취소하는 것)
