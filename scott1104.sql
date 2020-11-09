-- SCOTT 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- emp 테이블의 구조
DESC emp;


-- emp 테이블의 모든 내용 조회
SELECT * FROM emp;

-- emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;



-- 중복 레코드 제거한 후 조회 : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(별칭) : AS
SELECT empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job AS "직 책" from emp;

-- ORDER BY : 정렬하여 조회

-- 하나의 열로 기준을 주어 오름차순(ASC) 조회
SELECT ename,sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- 전체 데이터를 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

-- 부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- 출력되는 열의 별칭을 다음과 같이 지정한다.
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO

-- 부서번호를 기준으로 내림차순으로 정렬하되 부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬한다.

SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER,
       hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE : 조회를 할 때 기준 주기

-- 부서번호가 30번인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 조회
SELECT * FROM emp WHERE empno=7782;

-- 부서번호가 30이고, 사원직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 정보 조회
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

-- 부서번호가 30이거나, 사원직책이 CLERK 정보 조회
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

-- 부서번호가 20이거나, 사원직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno=20 OR job='SALESMAN';

-- 연산자를 이용한 조회

--산술연산자 : sal*12한 금액이 36000인 데이터 조회
select * from emp where sal*12=36000;


--관계연산자 : >, <, >=,<=
select*from emp where sal > 3000;
select*from emp where sal >= 3000;
select*from emp where ename >= 'F'; --f이후(ghigk.....)의 문자들 적용됨

--논리연산자 : and, or 
--급여가 2500이상이고, 직업이 analyst인 사원정보 조회
select*from emp where sal>=2500 and job = 'ANALYST';

--직무가 manager,salesman,clerk 인 사원정보 조회
select*from emp where job='MANAGER' or job = 'SALESMAN' or job='CLERK';

--등가연산자 : 양쪽 항목이 같은지 검사 == , =!
--sal이 3000이 아닌 사원정보 출력
select*from emp where sal!=3000;
select*from emp where sal<>3000;
select*from emp where sal^=3000; --제외하고


--IN 연산자 
select*from emp where job in('MANAGER','SALESMAN','CLERK');
--같은것select*from emp where job='MANAGER' or job = 'SALESMAN' or job='CLERK';
select*from emp where job!='MANAGER' and job != 'SALESMAN' and job!='CLERK';
--같은편
select*from emp where job not in('MANAGER','SALEMAN','CLERK');


---IN 을 사용해서 부서번호가 10.20번인 사원정보 조회
select*from emp where deptno in(10,20);


--between a and b

-- 1) 급여가 2000이상 3000이하인 사원정보 조회
select*from emp where sal >=2000 and sal<=3000;

select*from emp where sal between 2000 and 3000;

-- 2) 급여가 2000이상 3000이하가 아닌 사원정보 조회
select*from emp where sal not between 2000 and 3000;

--Like : 문자열 검색 사용(s로 시작하는 ~~, h로 끝나는....,가운데에 t가 있으면)
--1) 사원이름이 s로 시작하는 모든 사원정보 조회하기
select *from emp where ename like 'S%';

--2) 사원이름이 두번째 글자가 L인 사원만 조회
select*from emp where ename like '_L%';

--3) 사원 이름에 AM이 포함되어 있는 사원만 조회
select*from emp where ename like '%AM%';

--4) 사원 이름에 AM이 포함되어 있지 않는 사원만 조회
select*from emp where ename not like '%AM%';

-- is null
--select*from emp where comm = null; (x)
select*from emp where comm is null;

--mgr(매니저id)이 null인 사원정보 조회
select*from emp where mgr is null;

-- mgr(매니저id)이 null이 아닌 사원 정보 조회
select*from emp where mgr is not null;

-- 집합연산자 : 합집합(union),교집합(intersect),차집합(minus)
-- deptno가 10인 테이블 과 deptno가 20인 결과를 구해서 합해서 보여주기
select empno, ename, sal, deptno from emp where deptno = 10
union all
select empno, ename, sal, deptno from emp where deptno = 10;

-- 부서번호가 10이 아닌 사원들의 정보 조회
select empno, ename,sal,deptno
from emp
minus
select empno, ename,sal,deptno
from emp where deptno=10;

--부서번호가 10인 사원정보 조회
select empno, ename,sal,deptno
from emp
intersect
select empno, ename,sal,deptno
from emp where deptno=10;

-- 20,30번 부서에 근무하고 있는 사원 중 sal 이 2000 초과인 사원을 다음 두가지 
-- 방식의 select 문을 사용하여, 사원번호, 이름, 급여, 부서번호를 출력하는
-- sql 문 작성하기

-- 집합연산자 사용하지 않는 방식
select empno,ename,sal,deptno
from emp
where deptno in(20,30) and sal >2000;


--집합연산자 사용하는 방식

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


--오라클 함수
--1)문자함수 : upper(대문자),lower(소문자),initcap(처음에만대문자),length,lengthb
--ename 을 upper, lower,initcap으로 변환하여 조회
select ename, upper(ename),lower(ename),initcap(ename)
from emp;

--daul 테이블 이용( sys가 소유하고 있는 테이블로 임시연산이나 함수의 결과값 확인하는 용도)
select length('한글'),lengthb('한글') 
from dual;

-- 직책 이름이 6글자 이상인 사원들의 정보 추출
select*from emp where length(job)>=6;

-- 문자열 함수 : substr (글자 자리수 출력)

select job,substr(job,1,2),substr(job,3,2), substr(job,5) from emp;

-- -length(job) = -5
select job ,substr(job, -length(job)), substr(job,-length(job),2), substr(job,-3)
from emp;

-- 문자열 함수 : instr 특정 문자 위치 찾기)
select instr('HELLO, ORACLE!','L')as instr_1,--L위치좀알려줘봐 
       instr('HELLO, ORACLE!','L',5)as instr_2, --5번째 이후에서 찾아봐
       instr('HELLO, ORACLE!','L',2,2)as instr_3 --2번째부터 찾되 2번째나오는 L을 찾아줘
from dual;


--문자열함수 : replace(찾아서 바꾸기)
SELECT replace('이것이 oracle이다','이것이','This is')
from dual;

select '010-1234-5678' as replace_before, 
replace('010-1234-5678','-','  ') as replace_1,
replace('010-1234-5678','-') as replace_2
from dual;

-- 문자열 함수 : concat(연결)
--empno,ename을 연결하여 조회
select concat(empno,ename), concat(empno, concat(':',ename))
from emp
where ename='SCOTT';

--|| : 연결의 의미로 사용됨
select empno||ename,empno||':'||ename
from emp
where ename='SCOTT';

-- 문자열 함수 : trim(공백제거),ltrim(왼쪽공백제거),rtrim (오른쪽 공백 제거)
select '       이것이      ',trim('     이것이     ')
from dual;

-- 문자열 함수 :revers(거꾸로 출력)
select reverse('Oracle') from dual;

--2. 숫자함수 : Round(반올림),Trunc(버림), Ceil(입력된 숫자와 가까운 큰정수, 
--Floor(입력된 숫자와 가까운 작은 정수),Mod(나머지)

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


--3. 날짜함수 : sysdate, current_date, current_timestamp

select sysdate, current_date, current_timestamp from dual;

-- 날짜데이터는 연산이 가능함 : 날짜데이터 +1, -1, 날짜데이터-날짜데이터
-- 날짜데이터 + 날짜데이터는 안됨 ! 

SELECT sysdate AS NOW, sysdate-1 AS yesterday,sysdate+1 AS tomorrow
FROM dual;

--날짜함수 : ADD_MONTHS (월을 더하기하겠다)

SELECT sysdate, add_months(sysdate,3) FROM dual;

--입사10주년이 되는 사원들 조회
select EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE,120) from EMP;

-- 입사 38년 미만인 사원 조회
SELECT*FROM emp WHERE ADD_MONTHS(hiredate,12*38) > SYSDATE;

-- 날짜함수 : months_between(두날짜사이의 차이)
select*from emp where months_between(sysdate, hiredate) < 456;

SELECT empno,ename,hiredate,sysdate,months_between(hiredate,sysdate) AS months1,
months_between(sysdate,hiredate) AS months2, TRUNC(months_between(sysdate,hiredate))
FROM emp;

-- 날짜함수 : next_day,last_day(제일가깝게오는 날짜),(마지막날)
select sysdate, next_day(sysdate, '월요일'), last_day(sysdate)
from dual;

--4. 형변환 함수 : to_char(날짜,숫자데이터를 문자로 변환)//virchar -가변형(메모리안에 고정적으로 자리잡지않는것)
--               to_number(문자데이터를 숫자로 변환)
--               to_date(문자데이터를 날짜로 변환)

select to_char(sysdate, 'YYYY/MM/DD') as 현재날짜 from dual;
select to_char(sysdate, 'MM') as 현재날짜 from dual;
select to_char(sysdate, 'MON') as 현재날짜 from dual;
select to_char(sysdate, 'DD') as 현재날짜 from dual;
select to_char(sysdate, 'DAY') as 현재날짜 from dual;
select to_char(sysdate, 'HH12:MI:SS') as 현재날짜 from dual;
select to_char(sysdate, 'HH24:MI:SS pm') as 현재날짜 from dual; --am이든 pm이든 하나만 써도구분가능


--오늘날짜를 년/월/일 16:51:45 표현
SELECT TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss') As 今日時間 FROM DUAL;

select 1300-to_number('1500'), to_number('1300')+1500 from dual; --자바에선 불가능함
select to_number('1,300')-'1500', '1300'+to_number('1,500') from dual;--,콤마를 다른걸로 인식해버림//콤마가들어가면 에러가나버림
select to_number('1,300','999,999')-to_number('1,500','999,999'),
       to_number('1,300','999,999')+to_number('1,500','999,999') from dual;--그렇기때문에 수치의 형식을 만들어줘야함
select to_number('1,300,000','999,999,999')+to_number('1,500','999,999') from dual; 
--9,0(숫자의 한자리를 의미함),9 빈자리를 채우지 않는 형태, 0 빈자리를 채우는 형태

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

--1981년6월1일 이후에 입사한 사원정보 조회
select*from emp 
where hiredate >=to_date('81/06/01','yyyy/mm/dd');

select to_date('2019-12-20')-to_date('2019-10-20') from dual;
--select '2019-12-20'-'2019-10-20' from dual; //오류뜸에대한 처리

-- 널처리 함수 : NVL,NVL2 
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM
FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

--DECODE함수와 CASE문
--job이 manager인경우, salesman,analyst 경우에 각각의 다른 비율을 적용하고 싶다면?

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
                            WHEN COMM IS NULL THEN '해당사항없음'
                            WHEN COMM=0 THEN '수당없음'
                            WHEN COMM>0 THEN '수당 : ' || COMM
                           END AS COMM_TEXT FROM EMP;
 
 /*
    ppt 함수 연습문제
*/
DESC emp;

-- 월평균 근무일수는 21.5 일, DAY_PAY(하루급여) : SAL / 21.5, 
-- TIME_PAY(시급) : SAL/21.5/8

SELECT empno,ename,sal,ROUND((sal/21.5),2) as day_pay, 
       ROUND((sal/21.5/8),1) as time_pay
FROM emp;

-- 정직원 기준 : HIREDATE + 3 개월이 지난 첫 월요일

SELECT empno,ename,hiredate,NEXT_DAY(ADD_MONTHS(hiredate,3),'월요일') as R_JOB, 
       NVL(TO_CHAR(comm),'N/A') AS COMM
FROM emp;

-- EMP 테이블의 직속상관 사원번호

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

--ppt실습 1
select deptno,trunc(avg(sal),0) as avg_asl ,max(sal)as max_sal,min(sal) as min_sal,count(deptno)
from emp
group by deptno;

--선생님꺼
select deptno,floor(avg(sal)) as avg_asl, max(sal)as max_sal,min(sal) as min_sal,count(empno) as cnt
from emp
group by deptno;

--실습2

select job,count(job) 
from emp
group by job
having count(job)>=3;

--실습3
select to_char(hiredate,'yyyy'),deptno,count(*) as cnt
from emp
group by to_char(hiredate,'yyyy'),deptno
order by to_char(hiredate,'yyyy') desc;

--join 중요함 !!!!!!!!!!
-- 조인
select*from emp,dept order by empno;
select count(*) from emp,dept order by empno; --56개행나옴 (14*4)
--나올수 있는 모든 조합 조회
--너무많기때문에 원하는걸 추출하는 작업을 할때 불편함
select*from dept; --4행
select*from emp;  --14행

--1) 내부조인(등가조인)
select*
from emp,dept
where emp.deptno = dept.deptno --조인기준
order by empno;

select*
from emp e,dept d
where e.deptno = d.deptno --조인기준
order by empno;

select*
from emp inner join dept
on emp.deptno = dept.deptno --조인기준
order by empno;

select*
from emp e inner join dept d
on e.deptno = d.deptno --조인기준
order by empno;

--두 테이블에 같은 이름의 필드가 존재하는 경우
--어느테이블에 있는 필드를 가지고 올 것인지 정확히 명시
select empno,ename,job, b.deptno,dname
from emp e,dept d
where e.deptno = d.deptno --조인기준
order by empno;

--dmp 테이블과 dept 데이터를 조인하여 enpno,ename,sal, deptno
--dname, loc 를 조회한다 단,급여가 3000 이상인 사원만 출력
select e.empno, e.ename, e.sal, d.deptno,d.dname,d.loc
from emp e, dept d
where e.deptno = d.deptno and sal>=3000;

--emp 테이블의 별칭을 e로, dept 테이블 별칭을 d로 하여
--급여가 2500이하이고, 사원번호가 9999 이하인 사원의 정보를 출력
select * 
from emp e, dept d 
where e.deptno = d.deptno and sal<=2500 and empno<=9999;


-- emp 테이블의 별칭을 e로, salgrade 테이블 별칭을 s로 하여
--각 사원의 정보와 더불어 사원의 등급 정보를 출력

select*from salgrade;

select*
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--둘의 같은 이름이 없기때문에 sal의 값을 losal과 hisal의 사이에있는 숫자로 조인기준으로 넣음

--PPT23 실습1
SELECT
FROM EMP E, DEPT D
WHERE JOB



