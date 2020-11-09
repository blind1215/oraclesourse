CREATE TABLE TEST(
    ID NUMBER(4),
    NAME VARCHAR2(3));
    
DESC TEST;

--�ѱ��� ���� �ϳ��� 2Byte�� ó�� 
INSERT INTO TEST VALUES(1000,'ȫ�浿');
--����� ���� �ϳ��� 1BYTE�� ó��
INSERT INTO TEST VALUES(1000,'ABC');

-- ���� ���� �ٸ� BYTE ó���� �����ϱ� ���� NCHAR,NVARCHAR2


--NCHAR,NVARCHAR2 ���� : ������ ���̸� �׻� ������ �ִ��� �ƴϳ��� ����
--NCHAR ��쿡�� ���ڰ� 1�� �Է��� �ǵ� 4�ڸ��� ����
CREATE TABLE TEST2(
    ID NCHAR(4),
    NAME NVARCHAR2(3)); --����Ʈ���ڰ��ƴ϶� ���ڰ���
    
INSERT INTO TEST2 VALUES('Ȳ������','ȫ�浿');

CREATE  TABLE TEST3(
    ID NVARCHAR2(4),
    NAME NVARCHAR2(4),
    REG_DATE DATE);
    
INSERT INTO TEST3 VALUES('Ȳ������','ȫ�浿',SYSDATE);
INSERT INTO TEST3 VALUES('Ȳ������','ȫ�浿','2020-11-09');

--���̺� �����ϱ�
--CREATE TABLE ���̺���( ���̸� Ÿ��,.......);
--CREATE TABLE ���̺��� AS SELECT * FROM EMP;
--CREATE TABLE ���̺��� AS SELECT * FROM EMP WHERE DEPTNO=20;
--CREATE TABLE ���̺��� AS SELECT * FROM EMP WHERE 1<>1;

DESC EMP;

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),--��ü �ڸ����� 7�ڸ� (�Ҽ��� 2�ڸ��� �����Ҽ�����)
    COMM NUMBER(7,2), --12345.78
    DEPTNO NUMBER(2));
    
-- ALTER : ����(���̺�����)
--�÷� �߰� 
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

--���� �÷��� ����
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

--���� Ÿ�� ����
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

--���� �÷� ����
ALTER TABLE EMP_DDL DROP COLUMN TEL;

--���̺� �� ����
RENAME EMP_DDL TO EMP_RENAME;



DESC EMP_RENAME;

--��� ���̺������

CREATE TABLE MEMBER(
    ID CHAR(8),
    NAME NVARCHAR2(10),
    ADDR NVARCHAR2(50),
    NATION NCHAR(4),
    EMAIL VARCHAR2(50),
    AGE NUMBER(7,2));
    
DESC MEMBER;

--�ǽ�2 ���̺�����
ALTER TABLE MEMBER ADD BIGO NVARCHAR2(20);

ALTER TABLE MEMBER MODIFY BIGO NVARCHAR2(30);

ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;   

DROP TABLE MEMBER;
    