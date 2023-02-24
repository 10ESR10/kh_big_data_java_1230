/
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
      OR JOB = 'SALESMAN'
      OR JOB = 'CLERK';
      
/* IN 연산자 : 특정 열에 포함된 데이터를 여러개 조회할 때 활용*/
SELECT * 
 FROM EMP
 WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
 
 /* IN 연산자를 사용하여 부서번호가 10과 20번 사원의 사원번호, 이름, 입사일, 급여, 연봉*/
 
 SELECT EMPNO, ENAME, HIREDATE, COMM, SAL
 FROM EMP
 WHERE DEPTNO IN (10,20);
 
 /* 등가 비교 연산자와 AND연산자 */
 SELECT *
 FROM EMP
 WHERE JOB != 'MANAGER'
        AND JOB <> 'SALESMAN'
        AND JOB ^= 'CLERK';
        
/* 일정 범위를 지정하는 BETWEEN 연산자 */
-- 급여가 2000 ~ 3000 사이에 있는 사원 표시
SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

/* 2000과 3000도 포함*/
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

/* BETWEEN 절을 사용해서 급여가 1000에서 2500 사이이고 부서가 10,30인 사원을 출력하기 */
SELECT *
FROM EMP
WHERE SAL BETWEEN 1000 AND 2500 
      AND DEPTNO IN (10,30);
      
      
/* BETWEEN 절을 사용해서 급여가 1000에서 2500 사이이고, 부서가 10,20 아닌 사원 출력 */
SELECT *
FROM EMP
WHERE SAL BETWEEN 1000 AND 2500
     AND  DEPTNO NOT IN (10,20);
     
/* BETWEEN 절을 사용해서 사원번호가 7000에서 7999 사이이고, 입사일이 81년 5월 1일 이후인 사원 출력*/
SELECT *
FROM EMP
WHERE EMPNO BETWEEN 7000 AND 7999
      AND HIREDATE > '81/05/01';
      

/* 1980년이 아닌 해에 입사한 사원을 조회해서 출력 */
SELECT *
FROM EMP
WHERE NOT HIREDATE BETWEEN '80/01/01' AND '80/12/31';

/* EXTRACT 절을 사용하는 방법*/
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) != 1980;

/* LIKE 절은 일부 문자열이 포함되어 있는지 여부를 확인 할 때 사용 */
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 문자 한 자를 의미

SELECT * 
FROM EMP
WHERE ENAME LIKE '_L%';


/* 이름에 AM이 포함되어 있는 사원 출력 */
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

/* 이름에 AM이 포함되어 있지 않은 사원 출력*/
SELECT *
FROM EMP
WHERE NOT ENAME LIKE '%AM%';

/* 와일드카드 문자가 데이터 일부일 경우 */
INSERT INTO EMP VALUES(9999, 'TEST%PP','SALESMAN',7698, TO_DATE('22-02-14', 'DD-MM-YYYY'), 2000, 1000, 30);

SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE ENAME LIKE '%\%%' ESCAPE '\';

/* 테이블에서 해당하는 이름의 데이터 삭제 */
DELETE FROM EMP
 WHERE ENAME = 'TEST%PP';
 
 /* IS NULL */
 -- NULL이란 ? 0이 아니고 빈 공간이 아님을 의미 즉, 미확정된 값이라는 의미
 SELECT *
 FROM EMP
 WHERE COMM = NULL; -- NULL은 값을 비교 할 수 없음
 
 
 SELECT *
 FROM EMP
 WHERE COMM IS NULL;
 
 SELECT *
 FROM EMP
 WHERE COMM IS NOT NULL;
 
 /* NGER이 있는 사원만 출력 하기 */
 SELECT * FROM EMP;
 SELECT * FROM EMP
 WHERE MGR IS NOT NULL;
 
 /* ORDER BY 절 : 특정 컬럼의 데이터를 기준으로 오름차순이나 내림차순으로 정렬하는 기능을 하는 절 입니다 */
 -- 반드시 가장 마지막에 기술되어야 하며, 남발하면 좋지 않습니다.
 -- 정렬 조건을 기술하지 않으면 기본적으로 ASC(오름차순)입니다.(내림차순은 DESC 적어야함)
 SELECT *
 FROM EMP
 ORDER BY SAL ;
 
 /* 사원 번호 기준으로 오름차순 정렬하기 */
 SELECT *
 FROM EMP
 ORDER BY EMPNO;

/* 급여 기준으로 오름차순하고 급여가 같은 경우 이름 기준 */
SELECT *
FROM EMP
ORDER BY SAL,ENAME;

/* 급여 기준으로 오름차순하고 급여가 같을 경우 림을 내림차순 기준 */
SELECT *
FROM EMP
ORDER BY SAL, ENAME DESC;

/* 별칭 사용과 ORDER BY */
SELECT EMPNO 사원번호, ENAME 사원명, SAL 월급, HIREDATE 입사일
     FROM EMP
     ORDER BY 월급 DESC, 사원명 ASC;
     
/*연결 연산자 : SELECT 조회시 컬럼 사이에 특정한 문자를 넣고 싶을 때 사용하는 연산자 입니다 */
SELECT ENAME || 'S JOB IS ' || JOB AS EMPLOYEE
FROM EMP;

/* 실습문제 */
INSERT INTO EMP VALUES(7876, 'ADAMS', 'CLERK', 7788, TO_DATE('23-05-1987', 'DD-MM-YYYY'), 1100, NULL, 20);

-- S로 끝나는 사원
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';
-- 30번 부서, 직책'SALESMAN'
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN 30 AND JOB='SALESMAN';
-- 20,30 부서에 근무, 급여가 2000초과
SELECT *
FROM EMP
WHERE DEPTNO IN (20,30) AND SAL > 2000;
-- 급여가 2000이상,3000 이하 제외
SELECT *
FROM EMP
WHERE  SAL <2000 OR SAL >3000; 
-- 이름에 E가 포함, 30번 부서, 1000 ~ 2000 사이가 아님
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30 AND SAL NOT BETWEEN 1000 AND 2000;
-- 추가수당 없음, 상급자가 있음, 직책이 'MANAGER', 'CLERK', 이름이 '_L'이 아닌 사원 출력
SELECT *
FROM EMP
WHERE (COMM IS NULL OR COMM = 0)
AND MGR IS NOT NULL  
AND JOB IN ('MANAGER','CLERK')
AND NOT ENAME LIKE '_L%';


-- COMM 값이 NULL이 아닌 정보 조회
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;
-- 커미션을 받지 못하는 지원 조회
SELECT*
FROM EMP
WHERE COMM IS NULL OR COMM = 0;
-- 관리자가 없는 직원 정보 조회
SELECT*
FROM EMP
WHERE MGR IS NULL;
-- 급여를 많이 받는 직원 순으로 조회
SELECT*
FROM EMP
ORDER BY SAL DESC;
-- 급여가 같을 경우 커미션을 내림차순 정렬 조회
SELECT*
FROM EMP
ORDER BY SAL DESC, COMM DESC;
-- 사원번호, 사원명, 직급, 입사일 조회(단, 입사일을 오름차순 정렬 처리)
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE;
-- 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
SELECT EMPNO,ENAME
FROM EMP
ORDER BY EMPNO DESC;
-- 사원번호, 입사일, 사원명, 급여 조회 (부서번호가 빠른순으로, 같은 부서 번호일 때는 최근 입사일 순으로 처리)
SELECT EMPNO, DEPTNO, HIREDATE, ENAME, SAL
FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;

/* 함수 : 오라클에서는 내장 함수와 사용자가 필요에 의해서 직접 정의한 사용자 정의 함수로 나누어집니다.*/
-- 단일행 함수와 다중행 함수(집계 함수)로 나누어 집니다.
-- DUAL 테이블 : SYS 계정에서 제공하는 테이블로 함수나 계산식을 테이블 참조 없이 실행 해보기위한 DUMMY 테이블 입니다.
/* 숫자 함수*/
-- ABS : 절대값 구하는 함수
SELECT -10,ABS(10) FROM DUAL;
-- ROUND :반올림한 결과를 반환하는 함수
SELECT ROUND(1234.5678) AS ROUND FROM DUAL;
-- 반올림한 자리를 지정하지 않으면 0으로 반올림 한 것과 같음(정수의 첫번째 자리)
SELECT ROUND(1234.5678, 0) ROUND_0,
ROUND(1234.5678, 1) ROUND_1,
ROUND(1234.5678, 2) ROUND _2,
ROUND(1234.5678, 3) ROUND _3, -- 양수의 범위 만큼 소수점 아래로 이동
ROUND(1234.5678, -1) ROUND_MINUS1,
ROUND(1234.5678, -2) ROUND_MINUS2,
FROM DUAL;
-- TRUNC : 버림을 한 결과를 반환하는 함수
SELECT ROUND(1234.5678, 0) TRUNC_0,
ROUND(1234.5678, 1) TRUNC_1,
ROUND(1234.5678, 2) TRUNC _2
ROUND(1234.5678, 3) TRUNC _3, -- 양수의 범위 만큼 소수점 아래로 이동
ROUND(1234.5678, -1) TRUNC_MINUS1,
ROUND(1234.5678, -2) TRUNC_MINUS2
FROM DUAL;
-- MOD : 나눗셈을 한 후 나머지를 출력하는 함수
SELECT MOD(21, 5) FROM DUAL;
-- CEIL : 소숫점 이하가 있으면 무조건 올림
SELECT CEIL(12.001) FROM DUAL;
-- FLOOR : 소수점 이하를 무조건 날림
SELECT FLOOR(12.999) FROM DUAL;
-- POWER : 정수 A를 정수 B만큼 제곱하는 함수
SELECT POWER(3,4) FROM DUAL;

/* 문자 함수 : 문자 데이터를 가공하거나 문제 데이터로 부터 특정 결과를 얻고자 할 때 사용하는 함수입니다. */
-- UPPER : 대문자 변경
-- LOWER : 소문자 변경
-- INITCAP : 첫 글자는 대문자 변경하고 나머지는 소문자로 변경
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EXP;

-- WHERE 조건절에서 사용하기
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('james');

-- UPPER 함수와 LIKE 함께 사용하기
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%ja%');

SELECT INITCAP('kwon young jin') AS 이름 FROM DUAL;
 
/* 사원 이름은 대문자, 직책은 첫자 대문자 나머지는 소문자 변경하고 금여가 높은 순으로 표시하기 */
SELECT UPPER(ENAME) AS 이름, INITCAP(JOB) AS 직책, SAL AS 급여
FROM EMP
ORDER BY SAL DESC;
/* 문자열 길이를 구하는 함수 (LENGTH) */
SELECT ENAME, LENGTH(ENAME) AS "이름의 길이"
FROM EMP;

/* 이름의 길이가 5와 같거나 큰 사원의 이름, 사원번호, 직책을 연봉 순으로 표시, 단 보너스 제외*/
SELECT ENAME 이름, EMPNO 사원번호, JOB 직책, SAL*12 AS 연봉
FROM EMP
WHERE LENGTH(ENAME)>=5
ORDER BY 연봉 DESC;

-- LENGTH : 문자열의 길이를 반환
-- LENGTHB : 문자열의 바이트수 반환
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

/*직책 이름이 6자 이상이고 COMM이 있는 사원 출력*/
SELECT *
FROM EMP
WHERE LENGTH(JOB) > 6 AND (COMM IS NOT NULL AND COMM !=0);

/* SUBSTR / SUBSTRB : 대상 문자열이나 컬럼의 자료에서 시작 위치부터 개수만큼의 문자를 반환하는 함수, 인덱스 개념 아님 */
-- SUBSTR(문자열 데이터, 시작 위치, 길이)
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3,2), SUBSTR(JOB, 5)
FROM EMP;

-- SUBSTR 함수와 다른 함수 함께 사용
SELECT JOB,
SUBSTR(JOB, -LENGTH(JOB), 2) FROM EMP;

/* INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지 알고자 할 때 사용*/
SELECT INSTR ('HELLO, ORACLE!!', 'L') AS INSTR_1 FROM DUAL;
SELECT INSTR('HELLO, ORACLE!!', 'L', 5) AS INSTR_2 FROM DUAL; -- 찾을 문자열의 시작 위치를 지정 할 수 있음
SELECT INSTR('HELLO, ORACLE!!', 'L', 5) AS INSTR_3 FROM DUAL; -- 시작 위치 찾을 문자가 몇 번째 인지 지정








 
 
 
 
 
 
 

     