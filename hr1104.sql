-- HR ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;

-- employees ���̺��� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id FROM employees;

-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
select last_name, department_id from employees where employee_id=176;

-- ������ 12000 �̻�(>=) �Ǵ� �������� LAST_NAME �� ���� ��ȸ
select last_name,salary from employees where salary >= 12000;

-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
select last_name,salary from employees where salary<5000 or salary>12000;


-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ������� ��ȸ
select last_name,department_id from employees where department_id in(20,50) order by last_name,department_id asc;  

-- Ŀ�̼��� ���� ��� ������� last_name,����,Ŀ�̼� ��ȸ�ϱ�. ��, ������ ���� ��
-- Ŀ�̼� �������� ��� ����ϱ�
select last_name,salary,commission_pct from employees where commission_pct>0 order by salary ,commission_pct desc;

--������ 2500,3500,7000�� �ƴϸ�, ������ sa_rep �̳� st_clerk �� ����� ��ȸ

select *from employees where salary not in(2500,3500,7000) and job_id in('SA_REP','ST_CLERK');

--2008/02/20~2008/05/01 ���̿� ���� ������� last_name,�����ȣ,������� ��ȸ
--��, ������� ������������ �����Ͽ� ���

select last_name,employee_id,hire_date from employees where hire_date >='08/02/20' and hire_date<='08/05/01' order by hire_date desc;

--2004�⵵ ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� ��������
--�������� �����Ͽ� ���

select last_name,hire_date from employees where hire_date >='04/01/01' and hire_date <='04/12/31' order by hire_date, last_name asc;

-- ������ 5000���� 12000�� ������ �ְ�, 20 or 50�� �μ��� �ٹ��ϴ� �������
-- ������ ��ȸ�Ͽ� ������������ �����ֱ� (last_name,salary)
select last_name,salary from employees where salary between 5000 and 12000 and department_id in(20 , 50) order by salary asc;

--2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� �������� 
--�������� ���� �Ͽ� ���

select last_name , hire_date from employees where hire_date between '04/01/01' and '04/12/31' order by hire_date,last_name asc;

--������ 5000~12000 ���� �̿��� ������� last_name,salary ��ȸ

select last_name,salary from employees where salary not between 5000 and 12000;

--2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� �������� 
--�������� ���� �Ͽ� ���
select last_name, hire_date from employees where hire_date like '04%' order by hire_date asc;

--LAST_NAME �� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
select employee_id,last_name from employees where last_name like '%u%';

--last_name �� �׹�° ���ڰ� a �� ������� last_name ��ȸ
select Last_name from employees where last_name like '___a%';

--last_name �� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name
--�������� �������� ����
select last_name from employees where last_name like '%a%' or last_name like '%e%'  order by last_name asc;

--last_name �� a�� e ���ڰ� �ִ� ���ʵ��� last_naem�� ��ȸ�Ͽ� last_name
--�������� �������� ���Ĥ�
select last_name from employees where last_name like '%a%e%' or last_name like '%e%a%' order by last_name;

--is null ����
-- �Ŵ����� ���� ������� last_name, job_id ��ȸ
select last_name,job_id from employees where manager_id is null;

--st_clerk�� job_id�� ���� ����� ���� �μ� id ��ȸ,�μ���ȣ�� null�� �� ����

select Distinct department_id from employees where job_id not in('ST_CLERK') and department_id is not null; 

-- commission_pct�� null �� �ƴ� ����� �߿��� commission = salary*commission_pct
--�� ���Ͽ� employee_id, first_name,job_id �� ���� ��ȸ

select employee_id,first_name,job_id,salary*commission_pct as commission from employees where commission_pct is not null;

--���ڿ� �Լ� �ǽ�
--1. first_name�� Curtis �� ����� first_name, last_name, email, phone_number,
-- job_id�� ��ȸ�Ѵ�. �� , job_id�� ����� �ҹ��ڷ� ��µǵ��� �Ѵ�.
select first_name,last_name,email,phone_number,lower(job_id)
from employees
where first_name = 'Curtis';


--2. �μ���ȣ�� 70,80,90�� ������� employee_id, first_name,hire_date, job_id��
--�����Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.
select employee_id,first_name,hire_date,replace(job_id,'IT_PROG','���α׷���')
from employees
where department_id in (60,70,80,90);

--3. job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name,last name,
-- department_id, job_id�� ��ȸ�Ͻÿ�, ��, ������� first_name�� last_name�� ����
--�Ͽ� ����Ѵ�.
select employee_id,concat(first_name,concat(' ',last_name)),department_id, job_id
from employees
where job_id in('AD_PRES','PU_CLERK');

select employee_id,first_name||last_name,first_name||':'||last_name,department_id, job_id
from employees
where job_id in('AD_PRES','PU_CLERK');

-- ppt �������� 
-- �μ� 80�� �� ����� ���� ���� ������ ���� ǥ��
SELECT last_name,salary,
       CASE 
            WHEN salary < 2000 THEN 0
            WHEN (salary < 4000) THEN 0.09
            WHEN (salary < 6000) THEN 0.2
            WHEN (salary < 8000) THEN 0.3
            WHEN (salary < 10000) THEN 0.4
            WHEN (salary < 12000) THEN 0.42
            WHEN (salary < 14000) THEN 0.44
            ELSE 0.45
        END AS TAX_RATE
FROM employees WHERE department_id=80;


SELECT last_name,salary,
       DECODE(TRUNC(salary/2000,0),
                    0,0.00,
                    1,0.09,
                    2,0.20,
                    3,0.30,
                    4,0.40,
                    5,0.42,
                    6,0.44,
                    0.45) AS TAX_RATE
FROM employees WHERE department_id=80;

--������ �Լ� ����
--ȸ�� ���� �ִ� ���� �� �ּ� ���� ���̸� ��ȸ

select max(salary)-min(salary)
from employees;


--�Ŵ����� �ٹ��ϴ� ������� �ο��� ��ȸ

select count(distinct MANAGER_ID) as �Ŵ��� from employees;

--�μ��� ������ ���� ���Ͽ� �μ���ȣ�� ������������ ���
select count(employee_id),department_id
from employees 
group by department_id order by department_id;

--�μ��� �޿��� ��� ������ ����ϰ�, ��տ����� ������ �������� �Ѵ�
--�μ���ȣ�� ������������ ����
select employee_id,round(avg(salary),0),department_id
from employees
group by employee_id,department_id order by department_id;

--������ ������ ���� ������� ��ȸ

select job_id, count(employee_id)
from employees
group by job_id;


-- JOIN �ǽ� 
--�ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã�� HIRE_DATE, LAST_NAME,
--MANAGER_ID�� ����Ͻÿ� (EMPLOYEES SELF JOIN)
SELECT E1.HIRE_DATE,E1.LAST_NAME,E1.HIRE_DATE AS ���Ի���, E1.MANAGER_ID ,E2.HIRE_DATE AS �Ŵ����Ի���
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID AND E1.HIRE_DATE < E2.HIRE_DATE;


--���� �̸��� T�� �����ϴ� ������ ��� ������� ���, LAST_NAME, �μ���ȣ ��ȸ
--��ȸ(EMPLOYEES �� DEPARTMENT_ID�� DEPARTMENTS�� DEPARTMENT_ID ������
--DEPARTMENTS�� LOCATION_ID �� LOCATIONS�� LOCATION_ID ����)
SELECT EMPLOYEE_ID,LAST_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
                        D.LOCATION_ID = L.LOCATION_ID AND CITY LIKE'T%';


--��ġ ID�� 1700�� ������ ������� EMPLOYEES_ID, LAST_NAME, DEPARTMENT_ID, SALARY ��ȸ
--��ȸ(EMPLOYEES�� DEPARTMENTS ����)
SELECT EMPLOYEE_ID,LAST_NAME, D.DEPARTMENT_ID, SALARY
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = 1700;


--DEPARTMENT_NAME, LOCATION_ID, �� �μ��� �����(�׷���������), �� �μ��� ��� ���� ��ȸ
-- (EMPLOYEES, DEPARTMENT ����)
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID,COUNT(EMPLOYEE_ID),ROUND(AVG(SALARY),2)
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME,D.LOCATION_ID;

--EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� DEPARTMENT_ID,LAST_NAME,JOB_ID ��ȸ
--(EMPLOYEES,DEPARTMENT ����)
SELECT LAST_NAME,D.DEPARTMENT_ID,JOB_ID
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.DEPARTMENT_NAME = 'Executive';



-- ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID ��ȸ
-- (EMPLOYEES, JOB_HISTORY ����)
SELECT E.EMPLOYEE_ID, E.JOB_ID
FROM EMPLOYEES E, JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID AND E.JOB_ID = J.JOB_ID; 



-- �� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴�
-- ����� �����ϴ� ��� ������� LAST_NAME�� ��ȸ
-- (EMPLOYEES SELF JOIN)

SELECT E1.DEPARTMENT_ID, E1.FIRST_NAME||' '||E1.LAST_NAME AS  NAME
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND 
      E1.HIRE_DATE < E2.HIRE_DATE AND E1.SALARY<E2.SALARY;
      

-- �������� �ǽ�

-- ȸ�� ��ü ��� �������� �� ���� �޴� ������� LAST_NAME, SALARY ��ȸ
SELECT LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT AVG(SALARY) FROM EMPLOYEES);

-- LAST_NAME�� U �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� EMPLOYEE_ID, LAST_NAME
--��ȸ
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%U%');   

--NOT EXISTS �����ڸ� ����Ͽ� �Ŵ����� �ƴ� ��� �̸��� ��ȸ
SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES E1
WHERE NOT EXISTS(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID); 

SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES E1
WHERE E1.EMPLOYEE_ID NOT IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID); 


