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


--between a and b

-- 1) �޿��� 2000�̻� 3000������ ������� ��ȸ
select*from emp where sal >=2000 and sal<=3000;

select*from emp where sal between 2000 and 3000;

-- 2) �޿��� 2000�̻� 3000���ϰ� �ƴ� ������� ��ȸ
select*from emp where sal not between 2000 and 3000;

--Like : ���ڿ� �˻� ���(s�� �����ϴ� ~~, h�� ������....,����� t�� ������)
--1) ����̸��� s�� �����ϴ� ��� ������� ��ȸ�ϱ�
select *from emp where ename like 'S%';

--2) ����̸��� �ι�° ���ڰ� L�� ����� ��ȸ
select*from emp where ename like '_L%';

--3) ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
select*from emp where ename like '%AM%';

--4) ��� �̸��� AM�� ���ԵǾ� ���� �ʴ� ����� ��ȸ
select*from emp where ename not like '%AM%';

-- is null
--select*from emp where comm = null; (x)
select*from emp where comm is null;

--mgr(�Ŵ���id)�� null�� ������� ��ȸ
select*from emp where mgr is null;

-- mgr(�Ŵ���id)�� null�� �ƴ� ��� ���� ��ȸ
select*from emp where mgr is not null;

-- ���տ����� : ������(union),������(intersect),������(minus)
-- deptno�� 10�� ���̺� �� deptno�� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
select empno, ename, sal, deptno from emp where deptno = 10
union all
select empno, ename, sal, deptno from emp where deptno = 10;

-- �μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
select empno, ename,sal,deptno
from emp
minus
select empno, ename,sal,deptno
from emp where deptno=10;

--�μ���ȣ�� 10�� ������� ��ȸ
select empno, ename,sal,deptno
from emp
intersect
select empno, ename,sal,deptno
from emp where deptno=10;

-- 20,30�� �μ��� �ٹ��ϰ� �ִ� ��� �� sal �� 2000 �ʰ��� ����� ���� �ΰ��� 
-- ����� select ���� ����Ͽ�, �����ȣ, �̸�, �޿�, �μ���ȣ�� ����ϴ�
-- sql �� �ۼ��ϱ�

-- ���տ����� ������� �ʴ� ���
select empno,ename,sal,deptno
from emp
where deptno in(20,30) and sal >2000;


--���տ����� ����ϴ� ���

select empno,ename,sal,deptno
from emp
where sal>2000
minus
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
where sal>2000 and deptno=20
union
select empno,ename,sal,deptno
from emp
where sal>2000 and deptno=30;


--����Ŭ �Լ�
--1)�����Լ� : upper(�빮��),lower(�ҹ���),initcap(ó�������빮��),length,lengthb
--ename �� upper, lower,initcap���� ��ȯ�Ͽ� ��ȸ
select ename, upper(ename),lower(ename),initcap(ename)
from emp;

--daul ���̺� �̿�( sys�� �����ϰ� �ִ� ���̺�� �ӽÿ����̳� �Լ��� ����� Ȯ���ϴ� �뵵)
select length('�ѱ�'),lengthb('�ѱ�') 
from dual;

-- ��å �̸��� 6���� �̻��� ������� ���� ����
select*from emp where length(job)>=6;

-- ���ڿ� �Լ� : substr (���� �ڸ��� ���)

select job,substr(job,1,2),substr(job,3,2), substr(job,5) from emp;

-- -length(job) = -5
select job ,substr(job, -length(job)), substr(job,-length(job),2), substr(job,-3)
from emp;

-- ���ڿ� �Լ� : instr Ư�� ���� ��ġ ã��)
select instr('HELLO, ORACLE!','L')as instr_1,--L��ġ���˷���� 
       instr('HELLO, ORACLE!','L',5)as instr_2, --5��° ���Ŀ��� ã�ƺ�
       instr('HELLO, ORACLE!','L',2,2)as instr_3 --2��°���� ã�� 2��°������ L�� ã����
from dual;


--���ڿ��Լ� : replace(ã�Ƽ� �ٲٱ�)
SELECT replace('�̰��� oracle�̴�','�̰���','This is')
from dual;

select '010-1234-5678' as replace_before, 
replace('010-1234-5678','-','  ') as replace_1,
replace('010-1234-5678','-') as replace_2
from dual;

-- ���ڿ� �Լ� : concat(����)
--empno,ename�� �����Ͽ� ��ȸ
select concat(empno,ename), concat(empno, concat(':',ename))
from emp
where ename='SCOTT';

--|| : ������ �ǹ̷� ����
select empno||ename,empno||':'||ename
from emp
where ename='SCOTT';

-- ���ڿ� �Լ� : trim(��������),ltrim(���ʰ�������),rtrim (������ ���� ����)
select '       �̰���      ',trim('     �̰���     ')
from dual;

-- ���ڿ� �Լ� :revers(�Ųٷ� ���)
select reverse('Oracle') from dual;

--2. �����Լ� : Round(�ݿø�),Trunc(����), Ceil(�Էµ� ���ڿ� ����� ū����, 
--Floor(�Էµ� ���ڿ� ����� ���� ����),Mod(������)

SELECT round(1234.5678) as round,
       round(1234.5678,0) as round_1,
       round(1234.5678,1) as round_2,
       round(1234.5678,-1) as round_minus,
       round(1234.5678,-2) as round_minus2
from dual;

SELECT trunc(1234.5678) as trunc,
       trunc(1234.5678,0) as trunc_1,
       trunc(1234.5678,1) as trunc_2,
       trunc(1234.5678,-1) as trunc_minus,
       trunc(1234.5678,-2) as trunc_minus2
from dual;

select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
from dual;

select mod(15,6),mod(10,2),mod(11,2) from dual;


--3. ��¥�Լ� : sysdate, current_date, current_timestamp

select sysdate, current_date, current_timestamp from dual;

-- ��¥�����ʹ� ������ ������ : ��¥������ +1, -1, ��¥������-��¥������
-- ��¥������ + ��¥�����ʹ� �ȵ� ! 

SELECT sysdate AS NOW, sysdate-1 AS yesterday,sysdate+1 AS tomorrow
FROM dual;

--��¥�Լ� : ADD_MONTHS (���� ���ϱ��ϰڴ�)

SELECT sysdate, add_months(sysdate,3) FROM dual;

--�Ի�10�ֳ��� �Ǵ� ����� ��ȸ
select EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE,120) from EMP;

-- �Ի� 38�� �̸��� ��� ��ȸ
SELECT*FROM emp WHERE ADD_MONTHS(hiredate,12*38) > SYSDATE;

-- ��¥�Լ� : months_between(�γ�¥������ ����)
select*from emp where months_between(sysdate, hiredate) < 456;

SELECT empno,ename,hiredate,sysdate,months_between(hiredate,sysdate) AS months1,
months_between(sysdate,hiredate) AS months2, TRUNC(months_between(sysdate,hiredate))
FROM emp;

-- ��¥�Լ� : next_day,last_day(���ϰ����Կ��� ��¥),(��������)
select sysdate, next_day(sysdate, '������'), last_day(sysdate)
from dual;

--4. ����ȯ �Լ� : to_char(��¥,���ڵ����͸� ���ڷ� ��ȯ)//virchar -������(�޸𸮾ȿ� ���������� �ڸ������ʴ°�)
--               to_number(���ڵ����͸� ���ڷ� ��ȯ)
--               to_date(���ڵ����͸� ��¥�� ��ȯ)

select to_char(sysdate, 'YYYY/MM/DD') as ���糯¥ from dual;
select to_char(sysdate, 'MM') as ���糯¥ from dual;
select to_char(sysdate, 'MON') as ���糯¥ from dual;
select to_char(sysdate, 'DD') as ���糯¥ from dual;
select to_char(sysdate, 'DAY') as ���糯¥ from dual;
select to_char(sysdate, 'HH12:MI:SS') as ���糯¥ from dual;
select to_char(sysdate, 'HH24:MI:SS pm') as ���糯¥ from dual; --am�̵� pm�̵� �ϳ��� �ᵵ���а���


--���ó�¥�� ��/��/�� 16:51:45 ǥ��
SELECT TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss') As �������� FROM DUAL;

select 1300-to_number('1500'), to_number('1300')+1500 from dual; --�ڹٿ��� �Ұ�����
select to_number('1,300')-'1500', '1300'+to_number('1,500') from dual;--,�޸��� �ٸ��ɷ� �ν��ع���//�޸������� ������������
select to_number('1,300','999,999')-to_number('1,500','999,999'),
       to_number('1,300','999,999')+to_number('1,500','999,999') from dual;--�׷��⶧���� ��ġ�� ������ ����������
select to_number('1,300,000','999,999,999')+to_number('1,500','999,999') from dual; 
--9,0(������ ���ڸ��� �ǹ���),9 ���ڸ��� ä���� �ʴ� ����, 0 ���ڸ��� ä��� ����

select sal, to_char(sal, '$999,999') as sal_$,
       to_char(sal, 'L999,999') as sal_L,
       to_char(sal, '$999,999,00')as sal_1,
       to_char(sal, '000,999,999.00')as sal_2,
       to_char(sal, '999,999,999.00')as sal_6,
       to_char(sal, '000999999.99')as sal_3,
       to_char(sal, '999,999,00')as sal_4
from emp;

select to_date('2020-11-05','yyyy/mm/dd') as todate1,
       to_date('20201105','yyyy-mm-dd')as todate2 from dual;

--1981��6��1�� ���Ŀ� �Ի��� ������� ��ȸ
select*from emp 
where hiredate >=to_date('81/06/01','yyyy/mm/dd');

select to_date('2019-12-20')-to_date('2019-10-20') from dual;
--select '2019-12-20'-'2019-10-20' from dual; //�����信���� ó��

-- ��ó�� �Լ� : NVL,NVL2 
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM
FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

--DECODE�Լ��� CASE��
--job�� manager�ΰ��, salesman,analyst ��쿡 ������ �ٸ� ������ �����ϰ� �ʹٸ�?

SELECT empno,ename,job,sal, DECODE(JOB,'MANAGER',SAL*1.1,
                                        'SALESMAN',SAL*1.05,
                                        'ANALYST',SAL,
                                        SAL*1.03) AS UPSAL 
FROM EMP;

SELECT empno,ename,job,sal, CASE JOB
                                WHEN 'MANAGER' THEN SAL*1.1
                                WHEN 'SALESMAN'THEN SAL*1.05
                                WHEN 'ANALYST'THEN SAL
                                ELSE  SAL*1.03 
                            END AS UPSAL 
FROM EMP;

SELECT empno,ename,job,sal,case
                            WHEN COMM IS NULL THEN '�ش���׾���'
                            WHEN COMM=0 THEN '�������'
                            WHEN COMM>0 THEN '���� : ' || COMM
                           END AS COMM_TEXT FROM EMP;
 
 /*
    ppt �Լ� ��������
*/
DESC emp;

-- ����� �ٹ��ϼ��� 21.5 ��, DAY_PAY(�Ϸ�޿�) : SAL / 21.5, 
-- TIME_PAY(�ñ�) : SAL/21.5/8

SELECT empno,ename,sal,ROUND((sal/21.5),2) as day_pay, 
       ROUND((sal/21.5/8),1) as time_pay
FROM emp;

-- ������ ���� : HIREDATE + 3 ������ ���� ù ������

SELECT empno,ename,hiredate,NEXT_DAY(ADD_MONTHS(hiredate,3),'������') as R_JOB, 
       NVL(TO_CHAR(comm),'N/A') AS COMM
FROM emp;

-- EMP ���̺��� ���ӻ�� �����ȣ

SELECT SUBSTR(TO_CHAR(mgr),1,2) FROM EMP;


SELECT empno,ename,mgr,
       DECODE(SUBSTR(TO_CHAR(mgr),1,2),
            null, '0000',
            '75', '5555',
            '76', '6666',
            '77', '7777',
            '78', '8888',
            TO_CHAR(mgr)) AS CHG_MGR
FROM emp;

--ppt�ǽ� 1
select deptno,trunc(avg(sal),0) as avg_asl ,max(sal)as max_sal,min(sal) as min_sal,count(deptno)
from emp
group by deptno;

--�����Բ�
select deptno,floor(avg(sal)) as avg_asl, max(sal)as max_sal,min(sal) as min_sal,count(empno) as cnt
from emp
group by deptno;

--�ǽ�2

select job,count(job) 
from emp
group by job
having count(job)>=3;

--�ǽ�3
select to_char(hiredate,'yyyy'),deptno,count(*) as cnt
from emp
group by to_char(hiredate,'yyyy'),deptno
order by to_char(hiredate,'yyyy') desc;

--join �߿��� !!!!!!!!!!
-- ����
select*from emp,dept order by empno;
select count(*) from emp,dept order by empno; --56���೪�� (14*4)
--���ü� �ִ� ��� ���� ��ȸ
--�ʹ����⶧���� ���ϴ°� �����ϴ� �۾��� �Ҷ� ������
select*from dept; --4��
select*from emp;  --14��

--1) ��������(�����)
select*
from emp,dept
where emp.deptno = dept.deptno --���α���
order by empno;

select*
from emp e,dept d
where e.deptno = d.deptno --���α���
order by empno;

select*
from emp inner join dept
on emp.deptno = dept.deptno --���α���
order by empno;

select*
from emp e inner join dept d
on e.deptno = d.deptno --���α���
order by empno;

--�� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
--������̺� �ִ� �ʵ带 ������ �� ������ ��Ȯ�� ���
select empno,ename,job, b.deptno,dname
from emp e,dept d
where e.deptno = d.deptno --���α���
order by empno;

--dmp ���̺�� dept �����͸� �����Ͽ� enpno,ename,sal, deptno
--dname, loc �� ��ȸ�Ѵ� ��,�޿��� 3000 �̻��� ����� ���
select e.empno, e.ename, e.sal, d.deptno,d.dname,d.loc
from emp e, dept d
where e.deptno = d.deptno and sal>=3000;

--emp ���̺��� ��Ī�� e��, dept ���̺� ��Ī�� d�� �Ͽ�
--�޿��� 2500�����̰�, �����ȣ�� 9999 ������ ����� ������ ���
select * 
from emp e, dept d 
where e.deptno = d.deptno and sal<=2500 and empno<=9999;


-- emp ���̺��� ��Ī�� e��, salgrade ���̺� ��Ī�� s�� �Ͽ�
--�� ����� ������ ���Ҿ� ����� ��� ������ ���

select*from salgrade;

select*
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--���� ���� �̸��� ���⶧���� sal�� ���� losal�� hisal�� ���̿��ִ� ���ڷ� ���α������� ����

--PPT23 �ǽ�1
SELECT
FROM EMP E, DEPT D
WHERE JOB



