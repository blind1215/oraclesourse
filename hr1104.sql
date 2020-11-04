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

select last_name,hire_date from employees where hire_date >='04/01/01' order by hire_date, last_name asc;












