-- 한 줄 주석

/* 
    여러 줄 주석
*/

/*
    관리자 계정
    1. SYS, SYSTEM 
    2. 관리자 계정으로 접속해서 수업에서 사용할 새로운 계정을 만든다.
    3. 관리자 계정으로 작업하지 않도록 주의
    
    새로운 계정 만드는 방법
    1. CREATE USER 계정명 IDENTIFIED BY 비밀번호;
    2. GRANT 권한 TO 계정명;
*/

/* 
    SQL Developer 쿼리문 실행하는 방법
    1. 커서를 두고 컨트롤 엔터: 커서가 있는 쿼리문만 실행
    2. 블록을 잡고 컨트롤 엔터: 블록이 잡힌 쿼리문만 실행
    3. 그냥 F5: 전체 스크립트 실행
*/

CREATE USER C##GD IDENTIFIED BY 1111;
GRANT CONNECT TO C##GD;