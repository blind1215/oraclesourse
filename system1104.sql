-- scott ���� ��ȣ ����/���� ����
ALTER USER scott identified by tiger account unlock;


-- hr ���� ��ȣ ����/���� ����
alter user hr identified by 12345 account unlock;

--������ ����
--DBA_:SYSTEM,SYS�� �������� (DB������ ���� ����)
SELECT*FROM DBA_TABLES;

--SCOTT���� CREATE VIEW ���� �ο�
-- DCL
GRANT CREATE VIEW TO SCOTT;

GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

--���ο� ����� ����(= ���ο� ��Ű��(�����ͺ��̽�)�� ����)
CREATE USER TEST IDENTIFIED BY 12345;

--���� �ο� 
GRANT CREATE SESSION TO TEST;--���ӱ���

--�����۾��� ������ ������ �ִ� �� �ο�
GRANT CONNECT, RESOURCE TO TEST;
