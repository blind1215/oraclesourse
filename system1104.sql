-- scott 계정 암호 지정/계정 해제
ALTER USER scott identified by tiger account unlock;


-- hr 계정 암호 지정/계정 해제
alter user hr identified by 12345 account unlock;

--데이터 사전
--DBA_:SYSTEM,SYS만 볼수있음 (DB관리를 위한 정보)
SELECT*FROM DBA_TABLES;

--SCOTT에게 CREATE VIEW 권한 부여
-- DCL
GRANT CREATE VIEW TO SCOTT;

GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

--새로운 사용자 생성(= 새로운 스키마(데이터베이스)를 생성)
CREATE USER TEST IDENTIFIED BY 12345;

--권한 부여 
GRANT CREATE SESSION TO TEST;--접속권한

--여러작업의 권한을 가지고 있는 롤 부여
GRANT CONNECT, RESOURCE TO TEST;
