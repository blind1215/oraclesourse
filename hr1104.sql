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

-- ppt 연습문제 
-- 부서 80의 각 사원에 대해 적용 가능한 세율 표시
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

--다중행 함수 연습
--회사 내의 최대 연봉 및 최소 연봉 차이를 조회

select max(salary)-min(salary)
from employees;


--매니저로 근무하는 사원들의 인원수 조회

select count(distinct MANAGER_ID) as 매니저 from employees;

--부서별 직원의 수를 구하여 부서번호의 오름차순으로 출력
select count(employee_id),department_id
from employees 
group by department_id order by department_id;

--부서별 급여의 평균 연봉을 출력하고, 평균연봉은 정수만 나오도록 한다
--부서번호별 오름차순으로 정렬
select employee_id,round(avg(salary),0),department_id
from employees
group by employee_id,department_id order by department_id;

--동일한 직업을 가진 사원수를 조회

select job_id, count(employee_id)
from employees
group by job_id;


-- JOIN 실습 
--자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 HIRE_DATE, LAST_NAME,
--MANAGER_ID를 출력하시오 (EMPLOYEES SELF JOIN)
SELECT E1.HIRE_DATE,E1.LAST_NAME,E1.HIRE_DATE AS 내입사일, E1.MANAGER_ID ,E2.HIRE_DATE AS 매니저입사일
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID AND E1.HIRE_DATE < E2.HIRE_DATE;


--도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
--조회(EMPLOYEES 와 DEPARTMENT_ID와 DEPARTMENTS의 DEPARTMENT_ID 연결후
--DEPARTMENTS의 LOCATION_ID 와 LOCATIONS의 LOCATION_ID 조인)
SELECT EMPLOYEE_ID,LAST_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
                        D.LOCATION_ID = L.LOCATION_ID AND CITY LIKE'T%';


--위치 ID가 1700인 동일한 사원들의 EMPLOYEES_ID, LAST_NAME, DEPARTMENT_ID, SALARY 조회
--조회(EMPLOYEES와 DEPARTMENTS 조인)
SELECT EMPLOYEE_ID,LAST_NAME, D.DEPARTMENT_ID, SALARY
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = 1700;


--DEPARTMENT_NAME, LOCATION_ID, 각 부서별 사원수(그룹을져야함), 각 부서별 평균 연봉 조회
-- (EMPLOYEES, DEPARTMENT 조인)
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID,COUNT(EMPLOYEE_ID),ROUND(AVG(SALARY),2)
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME,D.LOCATION_ID;

--EXECUTIVE 부서에 근무하는 모든 사원들의 DEPARTMENT_ID,LAST_NAME,JOB_ID 조회
--(EMPLOYEES,DEPARTMENT 조인)
SELECT LAST_NAME,D.DEPARTMENT_ID,JOB_ID
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.DEPARTMENT_NAME = 'Executive';



-- 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 조회
-- (EMPLOYEES, JOB_HISTORY 조인)
SELECT E.EMPLOYEE_ID, E.JOB_ID
FROM EMPLOYEES E, JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID AND E.JOB_ID = J.JOB_ID; 



-- 각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는
-- 사원이 존재하는 모든 사원들의 LAST_NAME을 조회
-- (EMPLOYEES SELF JOIN)

SELECT E1.DEPARTMENT_ID, E1.FIRST_NAME||' '||E1.LAST_NAME AS  NAME
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND 
      E1.HIRE_DATE < E2.HIRE_DATE AND E1.SALARY<E2.SALARY;
      

-- 서브쿼리 실습

-- 회사 전체 평균 연봉보다 더 많이 받는 사원들의 LAST_NAME, SALARY 조회
SELECT LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT AVG(SALARY) FROM EMPLOYEES);

-- LAST_NAME에 U 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 EMPLOYEE_ID, LAST_NAME
--조회
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%U%');   

--NOT EXISTS 연산자를 사용하여 매니저가 아닌 사원 이름을 조회
SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES E1
WHERE NOT EXISTS(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID); 

SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES E1
WHERE E1.EMPLOYEE_ID NOT IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID); 


