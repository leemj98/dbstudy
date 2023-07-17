DROP TABLE STUDENT_T;
DROP TABLE PROFESSOR_T;
DROP TABLE DEPARTMENT_T;

CREATE TABLE DEPARTMENT_T (
    DEPT_NO   NUMBER(4)         NOT NULL
  , DEPT_NAME VARCHAR2(30 BYTE) NULL
  , DEPT_LOC  VARCHAR2(10 BYTE) NULL
  , CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO)
);

CREATE TABLE PROFESSOR_T (
    PROF_NO    NUMBER(4)         NOT NULL
  , PROF_NAME  VARCHAR2(10 BYTE) NULL 
  , PROF_POS   VARCHAR2(20 BYTE) NULL
  , PROF_SAL   NUMBER(10)        NULL
  , PROF_HIRED DATE              NULL
  , PROF_COMM  NUMBER(2)         NULL
  , DEPT_NO    NUMBER(4)         NULL
  , CONSTRAINT PK_PROF PRIMARY KEY(PROF_NO)
  , CONSTRAINT FK_DEPT_PROF FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT_T(DEPT_NO)
);

CREATE TABLE STUDENT_T (
    STUD_NO     NUMBER(5)         NOT NULL
  , STUD_NAME   VARCHAR2(20 BYTE) NULL
  , STUD_GRADE  VARCHAR2(1 BYTE)  NULL
  , STUD_BORN   DATE              NULL
  , STUD_TEL    VARCHAR2(13 BYTE) NULL
  , STUD_HEIGHT NUMBER(5,2)       NULL
  , STUD_WEIGHT NUMBER(5,2)       NULL
  , DEPT_NO     NUMBER(4)         NULL
  , CONSTRAINT PK_STUD PRIMARY KEY(STUD_NO)
  , CONSTRAINT FK_DEPT_STUD FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT_T(DEPT_NO)
);

INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(100, '컴퓨터공학과', '1호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(200, '멀티미디어학과', '2호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(300, '전자공학과', '3호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(400, '기계공학과', '4호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(500, '정보미디어학과', '5호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(600, '메카트로닉스학과', '6호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(700, '빅데이터학과', '7호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(800, '응용소프트웨어학과', '8호관');
COMMIT;

INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9901, '김도훈', '교수', 5000, TO_DATE('24-01-1982','DD-MM-YYYY'), 20, 100);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9902, '이재우', '조교수', 4200, TO_DATE('12-04-1995','DD-MM-YYYY'), NULL, 200);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9903, '성연희', '조교수', 4600, TO_DATE('17-05-1993','DD-MM-YYYY'), 15, 300);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9904, '염일웅', '전임강사', 5400, TO_DATE('02-12-1998','DD-MM-YYYY'), NULL, 400);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9905, '권혁일', '교수', 6500, TO_DATE('08-01-1986','DD-MM-YYYY'), 25, 500);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9906, '이만식', '부교수', 4200, TO_DATE('13-09-1988','DD-MM-YYYY'), NULL, 600);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9907, '전은지', '전임강사', 6100, TO_DATE('01-06-2001','DD-MM-YYYY'), NULL, 700);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9908, '남은혁', '부교수', 4200, TO_DATE('18-11-1990','DD-MM-YYYY'), 17, 800);
COMMIT;

INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10101, '전인하', '4', TO_DATE('02-01-1979','DD-MM-YYYY'), '051)781-2158', 176, 72, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20101, '이동훈', '1', TO_DATE('10-12-1983','DD-MM-YYYY'), '055)426-1752', 172, 64, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10102, '박미경', '1', TO_DATE('16-05-1984','DD-MM-YYYY'), '055)261-8947', 168, 52, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10103, '김영균', '3', TO_DATE('11-01-1981','DD-MM-YYYY'), '051)824-9637', 170, 88 ,100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20102, '박동진', '1', TO_DATE('24-11-1985','DD-MM-YYYY'), '051)742-6384', 182, 70, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10201, '김진영', '2', TO_DATE('06-06-1982','DD-MM-YYYY'), '055)419-6328', 164, 48, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10104, '지은경', '2', TO_DATE('12-04-1980','DD-MM-YYYY'), '055)418-9627', 161, 42, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10202, '오유석', '4', TO_DATE('12-10-1977','DD-MM-YYYY'), '051)724-9618', 177, 92, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10203, '하나리', '1', TO_DATE('18-12-1984','DD-MM-YYYY'), '055)296-3784', 160, 68, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10105, '임유진', '2', TO_DATE('21-01-1983','DD-MM-YYYY'), '02)312-9838', 171, 54, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10106, '서재진', '1', TO_DATE('29-11-1985','DD-MM-YYYY'), '051)239-4861', 186, 72, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10204, '윤진욱', '3', TO_DATE('02-04-1979','DD-MM-YYYY'), '053)487-2698', 171, 70, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10107, '이광훈', '4', TO_DATE('13-10-1981','DD-MM-YYYY'), '055)736-4981', 175, 92, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20103, '김진경', '2', TO_DATE('28-02-1983','DD-MM-YYYY'), '052)175-3941', 166, 51, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20104, '조명훈', '1', TO_DATE('16-09-1984','DD-MM-YYYY'), '02)785-6984', 184, 62, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10108, '류민정', '2', TO_DATE('19-08-1981','DD-MM-YYYY'), '055)248-3679', 162, 72, 100);
COMMIT;

SET SERVEROUTPUT ON;

-- 1. 다음 사용자를 만드는 쿼리문을 모두 작성하시오.(5점)
--    1) 사용자명 : SUPERVISOR
--    2) 비밀번호 : SUPERVISOR
--    3) 사용자명이 "C##SUPERVISOR"가 되지 않도록 주의하시오.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; 
CREATE USER SUPERVISOR IDENTIFIED BY SUPERVISOR;

-- 2. SUPERVISOR 계정에 DBA 권한을 부여하는 쿼리문을 작성하시오.(5점)
GRANT DBA TO SUPERVISOR;

-- 3. SUPERVISOR 계정의 DBA 권한을 회수하는 쿼리문을 작성하시오.(5점)
REVOKE DBA FROM SUPERVISOR;

-- 4. SUPERVISOR 계정을 삭제하는 쿼리문을 작성하시오.(5점)
DROP USER SUPERVISOR CASCADE;

-- 5. 학생(STUDENT_T) 테이블에서 학생 이름과 생일을 조회하시오. 생일(STUD_BORN)은 'YYYY-MM-DD' 형식으로 조회하시오.(5점)
--학생명  생일
--전인하  1979-01-02
--이동훈  1983-12-10
--박미경  1984-05-16
--김영균  1981-01-11
--박동진  1985-11-24
--김진영  1982-06-06
--지은경  1980-04-12
--오유석  1977-10-12
--하나리  1984-12-18
--임유진  1983-01-21
--서재진  1985-11-29
--윤진욱  1979-04-02
--이광훈  1981-10-13
--김진경  1983-02-28
--조명훈  1984-09-16
--류민정  1981-08-19
SELECT STUD_NAME AS 학생명
     , TO_CHAR(STUD_BORN, 'YYYY-MM-DD') AS 생일
  FROM STUDENT_T;

-- 6. 교수(PROFESSOR_T) 테이블에서 교수 이름과 '2020-12-31'까지 근무한 근속일을 조회하시오. 근속일은 정수로 내림 또는 절사하여 조회하시오.(5점)
--교수명  근속일
--김도훈  14221
--이재우  9395
--성연희  10090
--염일웅  8065
--권혁일  12776
--이만식  11797
--전은지  7153
--남은혁  11001
SELECT PROF_NAME AS 교수명
     , TRUNC(TO_DATE('20-12-31') - PROF_HIRED) AS 근속일
  FROM PROFESSOR_T;

-- 7. 학생(STUDENT_T) 테이블에서 가장 키가 큰 학생과 가장 키가 작은 학생을 조회하시오.(10점)
--학번  학생명  키
--10203 하나리  160
--10106 서재진  186
SELECT STUD_NO AS 학번
     , STUD_NAME AS 학생명
     , STUD_HEIGHT AS 키
  FROM STUDENT_T
 WHERE STUD_HEIGHT = (SELECT MAX(STUD_HEIGHT)
                        FROM STUDENT_T) 
   OR STUD_HEIGHT = (SELECT MIN(STUD_HEIGHT)
                       FROM STUDENT_T); 
