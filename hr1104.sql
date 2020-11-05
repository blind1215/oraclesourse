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