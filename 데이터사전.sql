--데이터 사전: 데이터베이스 메모리,성능,사용자,권한,객체와 같은 오라클
--운영에 필요한 중요한 데이터가 보관된 장소

--scott 계정에서 사용 가능한 데이터 사전
SELECT * FROM DICT;

SELECT*FROM USER_TABLES;

SELECT*FROM ALL_TABLES;


--뷰 : 가상 테이블

CREATE VIEW VM_EMP20 AS (SELECT EMPNO,ENAME,JOB,DEPTNO 
                         FROM EMP WHERE DEPTNO=20);

SELECT*FROM VM_EMP20;

--뷰 확인
SELECT*FROM USER_VIEWS;

CREATE VIEW VM_EMP30ALL AS SELECT*FROM EMP;

--생성된 뷰를 통해서 INSERT 작업

INSERT INTO VM_EMP30ALL VALUES(7777,'KIM','JUNKI',NULL,'20/10/19',2650,NULL,20);

SELECT *FROM VM_EMP30ALL;
SELECT*FROM EMP;

--뷰는 SELECT만 가능하도록 생성
CREATE VIEW VM_EMP_READ AS
    SELECT EMPNO,ENAME, JOB FROM EMP WITH READ ONLY;


-- 생성된 뷰에 수정이 가능한가?
SELECT*FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VM_EMP30ALL';

SELECT*FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='VM_EMP_READ';

--뷰를 사용하는 목적
--보안(원본 테이블이 가지고 있는 민감한 정보 제한)
SELECT*FROM EMP; --SAL,COMM
--서브쿼리,조인과 같은 복잡한 쿼리 결과를 저장해서 사용

--인덱스(목차같은개념,빨리찾게해줌) - 색인이기 때문에 SELECT 문에 효능을 높임

--SCOTT 계정이 소유한 인덱스 정보 보기
SELECT*FROM USER_INDEXES;

--기본키 생성 => 자동 인덱스가 됨
--인덱스 생성(EMP 테이블의 SAL열에 인덱스를 생성)
CREATE INDEX IDX_EMP_SQL ON EMP(SAL);

SELECT * FROM EMP WHERE SAL = 1250;

--

CREATE TABLE USERTBL(
    USERID CHAR(8) NOT NULL PRIMARY KEY,
    USERNAME NVARCHAR2(10) NOT NULL,
    BIRTHYEAR NUMBER(4) NOT NULL,
    MOBILE CHAR(3));
    
SELECT INDEX_NAME,UNIQUENESS,INDEX_TYPE FROM USER_INDEXES;

SELECT*FROM USER_INDEXES;

--시퀀스 : 특정 규칙에 맞는 연속 숫자 생성
--      : 게시글 번호, 상품 번호, 주문번호......

CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10  --10씩증가
START WITH 10    --처음 시작 숫자
MAXVALUE 90      --마지막숫자
MINVALUE 0       --START 값보다 작게 설정
NOCYCLE CACHE 2; --반복하지 않음, 미리 생성할 것인지 여부


DROP SEQUENCE DEPT_SEQ;

CREATE TABLE DEPT_SEQ_TBL AS SELECT*FROM DEPT WHERE 1<>1;

--시퀀스를 이용해서 삽입 --오류
SELECT * FROM DEPT_SEQ_TBL;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.NEXTVAL,'DATABASE','SEOUL');

--마지막 발행된 시퀀스 확인하기 
SELECT DEPT_SEQ.CURRVAL FROM DUAL;


--시퀀스 수정
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;


-- SYNONYM (동의어):공식 별칭
-- 테이블, 뷰, 시퀀스 등 객체들에게 대신 사용할 수 있는 이름 부여

CREATE SYNONYM E FOR EMP; --E로 표현하겠다

SELECT*FROM E;

DROP SYNONYM E;

--PPT7번 실습1 

CREATE TABLE EMPIDX AS SELECT*FROM EMP WHERE 1<>1;
    
DROP TABLE EMPIDX;
SELECT*FROM EMPIDX;


CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);
DROP INDEX IDX_EMPIDX_EMPNO;

SELECT*FROM USER_INDEXES;

CREATE VIEW EMPIDX_OVER15K AS SELECT*FROM EMPIDX WHERE SAL > 1500;

CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

CREATE SEQUENCE DEPTSEQ_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99
MINVALUE 1
NOCYCLE NOCACHE; --실습3번 설정

SELECT*FROM USER_SEQUENCES;

INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.NEXTVAL, 'DATABASE','SEOUL');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.NEXTVAL, 'WEB','BUSAN');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.NEXTVAL, 'MOBILE','ILSAN');

SELECT*FROM DEPTSEQ;

