-- SCOTT ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- emp ���̺��� ����
DESC emp;


-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;



-- �ߺ� ���ڵ� ������ �� ��ȸ : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(��Ī) : AS
SELECT empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job AS "�� å" from emp;

-- ORDER BY : �����Ͽ� ��ȸ

-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ
SELECT ename,sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- ��ü �����͸� ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

-- �μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- ��µǴ� ���� ��Ī�� ������ ���� �����Ѵ�.
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO

-- �μ���ȣ�� �������� ������������ �����ϵ� �μ� ��ȣ�� ���ٸ� ��� �̸��� �������� �������� �����Ѵ�.

SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER,
       hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE : ��ȸ�� �� �� ���� �ֱ�

-- �μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno=7782;

-- �μ���ȣ�� 30�̰�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ���� ��ȸ
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

-- �μ���ȣ�� 20�̰ų�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=20 OR job='SALESMAN';

-- �����ڸ� �̿��� ��ȸ

--��������� : sal*12�� �ݾ��� 36000�� ������ ��ȸ
select * from emp where sal*12=36000;


--���迬���� : >, <, >=,<=
select*from emp where sal > 3000;
select*from emp where sal >= 3000;
select*from emp where ename >= 'F'; --f����(ghigk.....)�� ���ڵ� �����

--�������� : and, or 
--�޿��� 2500�̻��̰�, ������ analyst�� ������� ��ȸ
select*from emp where sal>=2500 and job = 'ANALYST';

--������ manager,salesman,clerk �� ������� ��ȸ
select*from emp where job='MANAGER' or job = 'SALESMAN' or job='CLERK';

--������� : ���� �׸��� ������ �˻� == , =!
--sal�� 3000�� �ƴ� ������� ���
select*from emp where sal!=3000;
select*from emp where sal<>3000;
select*from emp where sal^=3000; --�����ϰ�


--IN ������ 
select*from emp where job in('MANAGER','SALESMAN','CLERK');
--������select*from emp where job='MANAGER' or job = 'SALESMAN' or job='CLERK';
select*from emp where job!='MANAGER' and job != 'SALESMAN' and job!='CLERK';
--������
select*from emp where job not in('MANAGER','SALEMAN','CLERK');


---IN �� ����ؼ� �μ���ȣ�� 10.20���� ������� ��ȸ
select*from emp where deptno in(10,20);











