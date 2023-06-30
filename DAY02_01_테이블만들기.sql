/*
    테이블(table)
    1. 데이터베이스에서 데이터를 저장하는 객체
    2. 표 형식
    3. 행(row)과 열(column)의 집합 형태
*/

/*
    데이터타입
    1. NUMBER(p, s): 정밀도 p, 스케일 s로 표현하는 숫자 형식 (정밀도와 스케일은 생략 가능)
        1) 정밀도 p: 전체 유효 숫자의 갯수
        1, 01, 001 전부 정밀도 1 (의미있는 숫자의 수)
        0.99 정밀도 2 (9만 유효 숫자)
        2) 스케일 s: 소수부의 유효 숫자의 갯수
        0.1=1, 0.01=2, 0.10=1
        3) ex number(2,2)=스케일 2니까 소수 둘째자리, 정밀도 2니까 정수부는 0 --> ~0.99까지
    2. CHAR(size): 고정 문자(character)
        1) 글자 수가 고정된 타입 (예시: 폰번호, 주민번호 등)
        2) size: 최대 2000 byte (1byte=영어나 숫자 한글자)
    3. VARCHAR2(size): 가변 문자
        1) 글자 수가 고정되지 않은 타입(예시: 이름, 이메일, 주소 등)
        2) size: 최대 4000 byte
    4. CLOB: 큰 텍스트 타입
    5. DATE: 날짜와 시간을 동시에 표현하는 타입(년, 월, 일, 시, 분, 초)
    6, TIMESTAMP: 날짜와 시간을 동시에 표현하는 타입(년, 월, 일, 시, 분, 초, 마이크로초)
*/

/*
    제약조건 5가지
    1. NOT NULL: 필수
    2. UNIQUE: 중복 불가
    3. PRIMARY KEY: 기본키
    4. FOREIGN KEY: 외래키
    5. CHECK: 값 제한 (들어올 수 있는 값 제한해서 잘못된 데이터 들어오는 것 막음, 안중요)
*/

-- 고객 테이블
-- 테이블 만들기 전에 DROP부터 (혹시 이전에 만들어져있던게 있다면 먼저 지우기 위해)
DROP TABLE CUSTOMER_T;
CREATE TABLE CUSTOMER_T (
    no   NUMBER            NOT NULL PRIMARY KEY,
    id   VARCHAR2(32 BYTE) NOT NULL UNIQUE,
    name VARCHAR2(32 BYTE) NOT NULL,
    job  VARCHAR2(32 BYTE) NULL,
    phone CHAR(13 BYTE)     UNIQUE,
    JUBUN CHAR(14 BYTE)     NULL UNIQUE
);