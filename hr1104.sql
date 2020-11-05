-- HR 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- employees 테이블 전체 내용 조회
SELECT * FROM employees;

-- employees 테이블의 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id FROM employees;

-- 사원번호가 176인 사람의 LAST_NAME와 부서번호 조회
select last_name, department_id from employees where employee_id=176;

-- 연봉이 12000 이상(>=) 되는 직원들의 LAST_NAME 및 연봉 조회
select last_name,salary from employees where salary >= 12000;

-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
select last_name,salary from employees where salary<5000 or salary>12000;


-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순으로 조회
select last_name,department_id from employees where department_id in(20,50) order by last_name,department_id asc;  

-- 커미션을 버는 모든 사원들의 last_name,연봉,커미션 조회하기. 단, 연봉의 역순 및
-- 커미션 역순으로 결과 출력하기
select last_name,salary,commission_pct from employees where commission_pct>0 order by salary ,commission_pct desc;

--연봉이 2500,3500,7000이 아니며, 직업이 sa_rep 이나 st_clerk 인 사람들 조회

select *from employees where salary not in(2500,3500,7000) and job_id in('SA_REP','ST_CLERK');

--2008/02/20~2008/05/01 사이에 고용된 사원들의 last_name,사원번호,고용일자 조회
--단, 고용일자 내림차순으로 정렬하여 출력

select last_name,employee_id,hire_date from employees where hire_date >='08/02/20' and hire_date<='08/05/01' order by hire_date desc;

--2004년도 고용된 모든 사람들의 last_name 및 고용일을 조회하여 입사일 기준으로
--오름차순 정렬하여 출력

select last_name,hire_date from employees where hire_date >='04/01/01' and hire_date <='04/12/31' order by hire_date, last_name asc;

-- 연봉이 5000에서 12000의 범위에 있고, 20 or 50번 부서에 근무하는 사람들의
-- 연봉을 조회하여 오름차순으로 보여주기 (last_name,salary)
select last_name,salary from employees where salary between 5000 and 12000 and department_id in(20 , 50) order by salary asc;

--2004년도의 고용된 모든 사람들의 last_name 및 고용일을 조회하여 입사일 기준으로 
--오름차순 정렬 하여 출력

select last_name , hire_date from employees where hire_date between '04/01/01' and '04/12/31' order by hire_date,last_name asc;

--연봉이 5000~12000 범위 이외의 사람들의 last_name,salary 조회

select last_name,salary from employees where salary not between 5000 and 12000;

--2004년도의 고용된 모든 사람들의 last_name 및 고용일을 조회하여 입사일 기준으로 
--오름차순 정렬 하여 출력
select last_name, hire_date from employees where hire_date like '04%' order by hire_date asc;

--LAST_NAME 에 u가 포함되는 사원들의 사번 및 last_name 조회
select employee_id,last_name from employees where last_name like '%u%';

--last_name 에 네번째 글자가 a 인 사람들의 last_name 조회
select Last_name from employees where last_name like '___a%';

--last_name 에 a 혹은 e 글자가 있는 사원들의 last_name을 조회하여 last_name
--기준으로 오름차순 정렬
select last_name from employees where last_name like '%a%' or last_name like '%e%'  order by last_name asc;

--last_name 에 a와 e 글자가 있는 사우너들의 last_naem을 조회하여 last_name
--기준으로 오름차순 정렬ㄹ
select last_name from employees where last_name like '%a%e%' or last_name like '%e%a%' order by last_name;

--is null 연습
-- 매니저가 없는 사람들의 last_name, job_id 조회
select last_name,job_id from employees where manager_id is null;

--st_clerk인 job_id를 가진 사원이 없는 부서 id 조회,부서번호가 null인 값 제외

select Distinct department_id from employees where job_id not in('ST_CLERK') and department_id is not null; 

-- commission_pct가 null 이 아닌 사원들 중에서 commission = salary*commission_pct
--를 구하여 employee_id, first_name,job_id 와 같이 조회

select employee_id,first_name,job_id,salary*commission_pct as commission from employees where commission_pct is not null;

--문자열 함수 실습
--1. first_name이 Curtis 인 사람의 first_name, last_name, email, phone_number,
-- job_id를 조회한다. 단 , job_id의 결과는 소문자로 출력되도록 한다.
select first_name,last_name,email,phone_number,lower(job_id)
from employees
where first_name = 'Curtis';


--2. 부서번호가 70,80,90인 사람들의 employee_id, first_name,hire_date, job_id를
--조죄한다. 단, job_id가 it_prog인 사원의 경우 프로그래머로 변경하여 출력한다.
select employee_id,first_name,hire_date,replace(job_id,'IT_PROG','프로그래머')
from employees
where department_id in (60,70,80,90);

--3. job_id가 ad_pres, pu_clerk인 사원들의 employee_id, first_name,last name,
-- department_id, job_id를 조회하시오, 단, 사원명은 first_name과 last_name을 연결
--하여 출력한다.
select employee_id,concat(first_name,concat(' ',last_name)),department_id, job_id
from employees
where job_id in('AD_PRES','PU_CLERK');

select employee_id,first_name||last_name,first_name||':'||last_name,department_id, job_id
from employees
where job_id in('AD_PRES','PU_CLERK');