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












