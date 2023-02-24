/* 2023년 2월15일 */
-- SUBSTR함수와 다른 함수 함께 사용
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)), -- JOB의 길이는 5이고 5에 대한 음수를 취하면 뒤에서 부터 음수값이 커지면서 읽어냄
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
    --REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 때 사용 (자바의 문법과 유사), 대체할 문자열을 넣지 않으면 삭제의 효과
    SELECT '010-5006-4146' AS -- 변경이전,
     REPLACE('010-5006-4146', '-', ' ')-- 하이픈을 공백으로,
     REPLACE('010-5006-4146', '-') --하이픈삭제
     FROM DUAL;
     
     -- LPAD / RPAD : 공간에 칸수를 지정하고 빈칸 만큼 특정 문자로 채우는 기능
     SELECT LPAD('ORACLE', 10, '+') FROM DUAL;
     SELECT RPAD('ORACLE', 10, '+') FROM DUAL;
     SELECT 'ORACLE',
     LPAD('ORACLE', 10, '#')AS LPAD_1,
     RPAD('ORACLE', 10, '*') AS RPAD_1,
     LPAD('ORACLE', 10) AS LPAD_2,
      RPAD('ORACLE', 10) AS RPAD_2
      FROM DUAL;
      
-- 개인정보 뒷자리를 *표시로 출력하기
SELECT
RPAD('971225-', 14, '*') AS RPAD_JUMIN,
RPAD('010-5006-', 13, '*') AS RPAD_PHONE
FROM DUAL;

-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME))
    FROM EMP;
    
-- TRIM/LTRIM/RTRIM : 문자열 내에서 특정 문자를 지우기 위해서 사용
SELECT '[' || TRIM(' _ORACLE_ ') || ']' AS TRIM,
'[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM,
'[' || LTRIM('<_ORACLE_>', '<_') || ']' AS LTRIM_2, -- 문자열이 문자를 지우기 때문에 순서가 맞지 않아도 지워짐
'[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM,
'[' || RTRIM('<_ORACLE_>', '_>') || ']' AS RTRIM_2
FROM DUAL;

SELECT LTRIM('    KLS2024    ') AS TRIM FROM DUAL;

/* 날짜 데이터를 다루는 날짜 함수 */
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS NOW,
SYSDATE-1 AS YESTERDAY, -- 운영체제에서 읽어온 시간 정보에서 1일을 뺌
SYSDATE+1 AS TOMORROW --운영체제에서 읽어온 시간 정보에서 1일을 더함
FROM DUAL;

/* 몇 개월 이후의 날짜를 구하는 ADD_MONTHS 함수 */
-- 특정 날짜에 지정한 개월 수 이후 날짜 에디터를 반환하는 함수
-- ADD_MONTHS(날짜 데이터ㅡ 더할 개월 수)
 SELECT SYSDATE,
 ADD_MONTHS (SYSDATE, 5)
 FROM DUAL;
 
 /*실습 문제(EMP) :사원에 대해 사원번호, 이름, 입사일, 10년 경과된 날짜를 출력하기*/
 SELECT EMPNO AS 사원번호, ENAME AS 이름, HIREDATE AS 입사일, ADD_MONTHS(HIREDATE, 120) AS "10년 경과일"
 FROM EMP;
 
 /*실습문제(DUAL): 현재 시간과 8개월 이후 시간 출력하기*/
 SELECT SYSDATE 현재시간,
 ADD_MONTHS(SYSDATE, 8) AS "8개월 경과일"
 FROM DUAL;
 
 /*두 날짜간의 개월 수 차이를 구하는 MONTHS_BETWEEN 함수*/
 SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
 MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
 MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
 TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
 FROM EMP;
 
 /*돌아오는 요일, 달의 마지막 날짜를 구하는 NEXT_DAY, LAST_DAY 함수 */
 -- NEXT_DAY(날짜데이터, 요일문자) -> 날짜 기준으로 돌아오는 요일의 날짜를 출력
 -- LAST DAY(날짜데이터) -> 날짜가 속한 달의 마지막 날짜를 출력
 SELECT SYSDATE,
 NEXT_DAY(SYSDATE, '목요일'),
 LAST_DAY(SYSDATE)
 FROM DUAL;
 
 -- 날짜를 반올림, 버림을 하는 ROUND, TRUNC 함수 
 
 -- 날짜 정보를 추출 함수
 SELECT EXTRACT(YEAR FROM DATE '1998-03-07')
 FROM DUAL;
 
 SELECT *
 FROM EMP
 WHERE EXTRACT(MONTH FROM HIREDATE) = 12;
 
 SELECT 
 EXTRACT(MONTH FROM SYSDATE) FROM DUAL; -- 현재 몇 월인지 추출

/* 자료형을 변환하는 형 변환 함수 */
-- 오라클도 자바와 마찬가지로 명시적 형변환과 묵시적 형변환이 있습니다.
-- 자동(묵시적) 형 변환 : 숫자와 문자 자료형의 연산은 자동으로 숫자도 변환(자바와 다른점)
SELECT EMPNO, ENAME, EMPNO + '500'
 FROM EMP;
 
 SELECT EMPNO, ENAME, EMPNO + 'ABCD' -- 에러가 발생 함
 FROM EMP;
 
 /*날짜, 숫자를 문자로 변환하는 TO_CHAR 함수*/
 -- TO_CHAR 함수는 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수 입니다. 주로 날짜 데이터를 문자 데이터로 변환시 자주 사용
 -- TO_CHAR(날짜데이터, 출력되기를 원하는 문자 형태) 
 SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜와시간
 FROM DUAL;
 
 -- 다양한 형식으로 출력하기
 SELECT SYSDATE,
 TO_CHAR(SYSDATE, 'CC') AS 세기,
 TO_CHAR(SYSDATE, 'YY') AS 연도,
 TO_CHAR(SYSDATE, 'YYYY/MM/DD pm HH:MM:SS') AS "년/월/일 시:분:초",
 TO_CHAR(SYSDATE, 'Q') AS 쿼터,
 TO_CHAR(SYSDATE, 'DD') AS 일,
  TO_CHAR(SYSDATE, 'DDD') AS 경과일,
  TO_CHAR(SYSDATE, 'HH') AS "12시간제",
  TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
  TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
  TO_CHAR(SYSDATE, 'W' ) AS 몇주차
  FROM DUAL;
  
  -- 특정 언어에 맞춰서 날짜 출력하기
  SELECT SYSDATE,
  TO_CHAR(SYSDATE, 'MM') AS MM,
  TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
  TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
  TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
  TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
  TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
  TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
  FROM DUAL;
  
  -- 숫자 데이터 형식을 지정하여 출력하기
  -- 9 : 숫자의 한 자리를 의미하고 빈 자리를 채우지 않음
  -- 0 : 빈 자리를 0으로 채움
  -- $ : 달러 표시를 붙임
  -- L : 지역 화폐 단위를 표시
  -- . : 소수점 표시
  -- , : 천 단위 표시
  SELECT SAL,
  TO_CHAR(SAL, '$999,999') AS SAL_$, -- 달러 표시를 하고 빈 자리를 채우지 않음
  TO_CHAR(SAL, 'L999,999') AS SAL_L, -- 지역 화폐를 표시하고, 천단위에 ,추가
  TO_CHAR(SAL, '999,999.00') AS SAL_1, -- 소수점 이하 2자리 표시
  TO_CHAR(SAL, '$999,999,999.00') AS SAL_2, -- 빈 자리를 0으로 채움
  TO_CHAR(SAL, '000999999.99') AS SAL_3, -- 소수점
  FROM EMP;
  
  /* TO_NUMBER : 숫자 타입의 문자열의 숫자 데이터 타입으로 변환해주는 함수인데 자동 형변환으로 사용할 경우가 없음*/
  SELECT '1300' - '1500',
  '1300' +'1500'
  FROM DUAL;
  
  /* TO_DATE : 문자열로 명시된 날짜로 변환하는 함수 */
  SELECT TO_DATE ('22/08/20', 'YY/MM/DD')
  FROM DUAL;
  
  SELECT TO_CHAR(SYSDATE, 'YY/MM/DD') AS "현재날짜와 시간"
  FROM DUAL;
  
  DESC EMP;
  
  SELECT * 
  FROM EMP
  WHERE HIREDATE < TO_CHAR('1981/01/01', 'YYYY/MM/DD');
  
  /*1981 6월 1일 이후에 입사한 사원 정보 출력하기 */
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

/*NVL 함수의 사용법*/
-- NVL (데이터열, 앞의 데이터가 NULL인 경우 반환 할 데이터)
SELECT EMPNO, ENAME, SAL, COMM,
    NVL(COMM, 0),
    SAL * 12+NVL(COMM, 0)
FROM EMP;

--NVL2(검사 할 데이터열, NULL이 아닌 경우에 대한 계산식, NULL인 경우에 대한 계산식)
SELECT EMPNO, ENAME, COMM,
NVL2(COMM, 'O','X') AS "NULL 여부 표시",
NVL2(COMM, SAL*12+COMM, SAL*12) AS "연봉 계산"
FROM EMP;

-- NULLIF : 두 값을 비교하여 동일인지 아닌지에 대한 결과 반환 : 같으면 NULL을 반환, 동일하지 않으면 첫 번째 값을 반환
SELECT NULLIF(10, 10) , NULLIF('A','B') FROM DUAL;

/*DECODE : 주어진 데이터 값이 조건 값과 일치하는 값을 출력하고 일치하는 값이 없으면 기본값 출력*/
-- 조건문 또는 SWITCH문과 유사
SELECT EMPNO, ENAME, JOB, SAL,
DECODE(JOB,
 'MANAGER', SAL*1.1, 
 'SALESMAN',SAL*1.05,
 'ANALYST', SAL,
 SAL*1.03) AS 급여인상
 FROM EMP;
 
 /* CASE 문 :  주어진 데이터 값이 조건 값과 일치하는 값을 출력하고 일치하는 값이 없으면 기본값 출력*/
 SELECT EMPNO, ENAME, JOB, SAL,
 CASE JOB
 WHEN 'MANAGER' THEN SAL*1.1
 WHEN 'SALESMAN' THEN SAL*1.05
 WHEN 'ANALYST' THEN SAL
 ELSE SAL*1.03
 END AS 급여인상
 FROM EMP;
 
 -- 열 값에 따라서 출력 값이 달라지는 CASE 문, IF문과 유사함
 
 SELECT EMPNO, ENAME, COMM,
 CASE 
   WHEN COMM IS NULL THEN '해당사항 없음'
   WHEN COMM = 0 THEN '수당없음'
   WHEN COMM > 0 THEN '수당 : ' || COMM
   END AS 수당표시
   FROM EMP;
   
   /*오늘의 실습 문제*/
   -- 노션에 있는 4개의 문제
   -- 1.ENAME이 다섯글자인 사원, 두자리만 표시하고 나머지는 * 처리
   SELECT EMPNO,
   RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
   ENAME,
   RPAD(SUBSTR(ENAME,1, 1),5, '*') AS MASKING_ENAME
   FROM EMP
   WHERE LENGTH(ENAME)=5
   ORDER BY EMPNO;
   
   -- 2.
   SELECT EMPNO, ENAME, SAL,
   TRUNC(SAL/21.5, 2) AS DAY_PAY, -- 소수점 셋째자리에서 부터 버림
   ROUND(SAL/21.5/8, 1) AS TIME_PAY -- 소수점 둘째 자리에서 반올림
   FROM EMP;
   
   -- 3.
   SELECT EMPNO, ENAME, HIREDATE,
TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
NVL(TO_CHAR(COMM),'N/A')AS COMM
   FROM EMP;
   
   -- 4.
   SELECT EMPNO, ENAME, MGR,
   CASE
   WHEN MGR IS NULL THEN '0000'
   WHEN SUBSTR(MGR, 1,2)= '75' THEN '5555'
   WHEN SUBSTR(MGR,1,2) = '76' THEN '6666'
   WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
   WHEN SUBSTR(MGR,1,2)= '88' THEN '8888'
   ELSE TO_CHAR(MGR)
   END AS CHG_MGR
   FROM EMP;
   
   -- SCOTT 계정 문제
   --1.오늘 날짜에 대한 정보 조회
    SELECT SYSDATE
    FROM DUAL;
   --2. EMP테이블에서 사번, 사원명, 급여 조회 (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬), 둘째자리 반올림
   SELECT EMPNO,ENAME,
   ROUND(SAL,-2) AS 급여
   FROM EMP
   ORDER BY 급여 DESC;
   --3. EMP테이블에서 사원번호가 홀수인 사원들을 조회
   SELECT *
   FROM EMP
   WHERE MOD(EMPNO, 2) = 1;
   --4. EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
   SELECT ENAME, EXTRACT(YEAR FROM HIREDATE) AS 입사년도, EXTRACT(MONTH FROM HIREDATE) AS 입사월
     FROM EMP;
   --5. EMP테이블에서 9월에 입사한 직원의 정보 조회
   SELECT *
   FROM EMP
   WHERE EXTRACT(MONTH FROM HIREDATE) =9;
   
   --6. EMP테이블에서 81년도에 입사한 직원 조회
   SELECT *
   FROM EMP
   WHERE EXTRACT(YEAR FROM HIREDATE) =1981;
   --7. EMP테이블에서 이름이 'E'로 끝나는 직원 조회
   SELECT * 
   FROM EMP
   WHERE ENAME LIKE '%E';
   --8. EMP테이블에서 이름의 세 번째 글짜가 'R'인 직원의 정보 조회
   SELECT *
   FROM EMP
   WHERE ENAME LIKE '__R%';
   --9. EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
   SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE, 40*12)
   FROM EMP;
   
   --10. EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
   -- MONTHS_BETWEEN(날짜데이터, 날짜데이터) -> 두 날짜간의 날짜 차이를 개월수로 출력
   SELECT *
   FROM EMP
   WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE)/12 >=38;
   --11. 오늘 날짜에서 년도만 추출
   SELECT EXTRACT(YEAR FROM SYSDATE)
   FROM DUAL;
   
   /*함께 구하는 SUM함수*/
   -- DISTINCT : 중복 제거
   -- ALL : 사용하지 않아도 기본적으로 ALL 특성을 가집니다.
   SELECT  SUM(DISTINCT SAL) AS 중복제거, SUM(ALL SAL) AS 전부, SUM(SAL) AS 기본
   FROM EMP;
   
   SELECT SUM(SAL), SUM(COMM) FROM EMP;
   
   SELECT COUNT(*) FROM EMP;
   SELECT COUNT(COMM) FROM EMP; -- COMM이 NULL이 아닌 사원의 수
   
   SELECT COUNT(COMM)
   FROM EMP
   WHERE COMM IS NOT NULL;
   
   -- 부서 번호가 20인 사원 중 입사일이 가장 최근인 사원 출력
   SELECT MAX(HIREDATE)
   FROM EMP
   WHERE DEPTNO = 20;
   
   /*GROUP BY : 하나의 결과를 특정 열을 묶어서 출력하는 것을 그룹화한다고 합니다.*/
   -- 이 때 출력해야 할 대상열을 지정하는 것을 GROUP BY 수행합니다.
   SELECT TRUNC (AVG( SAL)), DEPTNO
   FROM EMP
   GROUP BY DEPTNO;
   
   SELECT TRUNC(AVG(SAL))FROM EMP WHERE DEPTNO = 10;
   SELECT TRUNC(AVG(SAL))FROM EMP WHERE DEPTNO = 20;
   SELECT TRUNC(AVG(SAL))FROM EMP WHERE DEPTNO = 30;
   
   /*부서 번호 및 직책별 평균 급여로 정렬하기*/
   SELECT DEPTNO, JOB, AVG(SAL)
   FROM EMP
   GROUP BY DEPTNO,JOB
   ORDER BY DEPTNO,JOB;
   
   /*GROUP BY를 사용하여 부서 번호별 평균 추가 수당을 출력*/
   SELECT NVL (AVG(COMM),0), DEPTNO
   FROM EMP
   GROUP BY DEPTNO;
   
   /* 부서 코드, 급여 합계, 부서 평균, 부서 코드 순 정렬 */
  SELECT DEPTNO 부서코드,
  SUM(SAL) 합계,
  FLOOR(AVG(SAL)) 평균,
  COUNT(*) 인원수
  FROM EMP
  GROUP BY DEPTNO;
  
  /* HAVING 절 : GROUP BY 절이 존재 할 때만 사용 할 수 있음*/
  -- 그룹화된 값의 범위를 제한하는 용도로 사용
  SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
  GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
  ORDER BY DEPTNO, JOB;
  
  SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
  WHERE AVG(SAL)
  GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
  ORDER BY DEPTNO, JOB;
  
  /* WHERE 절과 HAVING 절을 모두 사용하는 경우*/
  SELECT DEPTNO, JOB, AVG(SAL) AS 평균
  FROM EMP -- 첫번째 수행 : 12 ~ 13개 행이 있음
  WHERE SAL <= 2500
  GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
  ORDER BY DEPTNO, JOB;
  
 -- 1. HAVING절을 사용하여 EMP 테이블의 부서별 직책의 평균 급여가 500 이상인 사언들의 부서 번호 , 직책, 부서별 직책의 평균 급여 출력
SELECT DEPTNO,JOB,AVG(SAL) AS 평균
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >=500;

 --2.EMP 테이블을 이용하여 부서번호, 평균급여, 최고급여, 최저급여, 사원수를 출력,  단, 평균 급여를 출력 할 때는 소수점 제외하고 부서 번호별로 출력
 SELECT DEPTNO, TRUNC(AVG(SAL)) 평균급여,
 MAX(SAL) 최고급여,
 MIN(SAL) 최저급여,
 COUNT(*) 사원수
 FROM EMP
 GROUP BY DEPTNO
 ORDER BY DEPTNO;
 
 --3.같은 직책에 종사하는 사원이 3명 이상인 직책과 인원을 출력
 SELECT JOB 직업, COUNT(*) 사원수
 FROM EMP
 GROUP BY JOB
 HAVING COUNT(*) >= 3;
 --4.사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력
 SELECT TO_CHAR(HIREDATE, 'YYYY') AS "입사일",
 DEPTNO,
 COUNT(*) AS "사원수"
 FROM EMP
 GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
 
 
 --5.추가 수당을 받는 사원 수와 받지 않는 사원수를 출력 (O, X로 표기 필요)
 SELECT NVL2(COMM, 'O', 'X') AS "추가수당",
    COUNT(*) AS "사원수"
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

 --6. 각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력
SELECT DEPTNO,
TO_CHAR(HIREDATE, 'YYYY') AS 입사년도,
COUNT(*) AS 사원수,
MAX(SAL) AS 최고급여,
TRUNC(AVG(SAL)) AS 평균급여,
SUM(SAL) AS "합계"
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY')
ORDER BY DEPTNO;

/*ROLLUP 함수를 적용한 그룹화*/
-- 명시한 열을 소그룹부터 대그룹의 순서로 각 그룹별 결과를 출력하고 마지막에 총 데이터 결과를 출력
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB;

/*집합 연산자 : 두 개 이상의 쿼리 결과를 하나로 결합하는 연산자*/
-- UNION : 합집합, 중복 제거
-- UNION ALL : 합집합, 중복 제거 하지 않음
-- MINUS : 차집합
-- INTERSECT : 교집합

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE DEPTNO = 20;

-- INTERSECT : 교집합 : 두개의 쿼리문에 모두 포함되어 있는 데이터를 표시
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 2000;

--MINUS : 차집합 : 앞의 쿼리문 결과에서 뒤의 쿼리문 결과를 뺀 것
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 2000;

/*JOIN*/
-- JOIN은 두 개 이상의 테이블에서 데이터를 가져와서 연결하는데 사용되는 SQL의 기능
-- 테이블의 식별 값인 PRIMARY KEY와 테이블간 공통 값인 FOREIGN KEY 값을 사용하여 조인
-- INNER JOIN : 두 테이블에서 일치하는 데이터만 선택
-- LEFT JOIN : 왼쪽 테이블의 모든 데이터와 오른쪽 데이터에서 일치하는 데이터를 선택
-- RIGHT JOIN : 오른쪽 테이블의 모든 데이터와 왼쪽 테이블에서 일치하는 데이터 선택

--두개의 테이블의 모든열의 결합되어 데이터 * 데이터 만큼의 결과가 표시 됩니다.(카테시안 곱)
SELECT * 
FROM EMP, DEPT;

SELECT*
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

/*테이블의 별칭 주기 : 양쪽 테이블 모두에 존재하는 열에 대해서는 테이블 이름을 명시해야함 */
SELECT EMPNO, ENAME, JOB, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE  E.JOB = 'MANAGER'
AND E.DEPTNO = D.DEPTNO;


/*등가 조인*/
-- 테이블을 연결한 후에 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정하는 방식
-- ANSI 조인 방식으로 연결하기
-- 오라클 9I 까지는 오라클 조인만 사용 할 수 있었으나, 오라클 10G 부터는 ANSI 조인을 추가로 사용 가능
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
FROM EMP E JOIN  DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER';

--EMP와 DEPT 테이블을 조인하고 급여가 3000 이상인 사원 정보 출력(사원번호, 이름, 급여, 입사일, 부서번호, 부서이름)
-- 오라클 방식과 ANSI 방식으로...
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D. DEPTNO
AND SAL>=3000;

SELECT EMPNO,ENAME,SAL,HIREDATE, D.DEPTNO,DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 3000;

/*EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 다음과 같이 등가조인을 했을 때, 
급여가 2500 이하이고 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성 : 오라클 방식, ASNI 방식으로*/
SELECT EMPNO,ENAME,SAL,HIREDATE,D.DEPTNO,DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D. DEPTNO
AND SAL BETWEEN 2500 AND 9999;


SELECT EMPNO,ENAME,SAL,HIREDATE,D.DEPTNO,DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL BETWEEN 2500 AND 9999;
/*비등가 조인 : 도일 열이 아닌 다른 조건을 사용하여 조인 할 때 사용되면 자주 사용되지 않습니다.*/

SELECT * FROM EMP;
SELECT * FROM SALGRADE;

/* 급여에 대한 등급을 표시하기 위해서는 급여의 금액이 일피 할 수 없으므로 최소와 최대 급여 사이에 있어야 함 
이런 경우 BETWEEN A AND B 연산자를 사용하면 처리 가능 */
SELECT ENAME, SAL, GRADE
FROM EMP E JOIN SALGRADE S
ON SAL BETWEEN LOSAL AND HISAL;

--1.사원번호가 7499인 사원의 이름, 입사일 부서번호 출력
SELECT ENAME, HIREDATE,DEPTNO
FROM EMP
WHERE EMPNO = 7499;

--2. 이름이 ALLEN인 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE ENAME = 'ALLEN';

--3. 이름이 K보다 큰 글자로 시작하는 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE ENAME > 'k';

--4.입사일이 81년 4월2일 보다 늦고, 82년 12월9일 보다 빠른 사원의 이름, 급여, 부서번호 출력
SELECT ENAME, SAL, DEPTNO, HIREDATE
FROM EMP
WHERE HIREDATE > '81/04/02' AND HIREDATE <'82/12/09';

--5.급여가 1,600 보다 크고, 3000보다 작은 사원의 이름, 직무, 급여를 출력
SELECT ENAME,JOB,SAL
FROM EMP
WHERE SAL BETWEEN 1601 AND 2999;

--6. 입사일이 81년 이외에 입사한 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE HIREDATE > '81/12/31' OR HIREDATE < '81/01/01';

--7. 직업이 MANAGER와 SALESMAN인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' OR 
JOB ='SALESMAN';

--8. 부서가 20번, 30번을 제외한 모든 사원의 이름, 사원번호, 부서번호를 출력
SELECT ENAME, EMPNO, DEPTNO
FROM EMP
WHERE DEPTNO < 20 OR DEPTNO >30;

--9. 이름이 S로 시작하는 사원의 사원번호, 이름, 부서번호 출력
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE ('S%');

--10.처음 글자는 관계없고, 두 번째 글자가 A인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE ENAME LIKE('_A%');

--11. 커미션이 NULL이 아닌 사원의 모든 정보를 출력
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL;

--12. 이름이 J자로 시작하고 마지막 글자가 S인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE ENAME LIKE ('J%S');

--13. 급여가 1500이상이고, 부서번호가 30번인 사원 중 직무가 MANAGER인 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE SAL >= 1500 
AND DEPTNO = 30
AND JOB = 'MANAGER';

--14.모든 사원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력 (단, 커미션이 null인 사원도 0으로 포함)
SELECT ENAME, SAL, NVL(COMM,0), SAL+NVL(COMM,0) AS 총액 
FROM EMP
ORDER BY 총액 DESC;


--15.10번 부서의 모든 사원에게 급여의 13%를 보너스로 지불하기로 하였다. 10번 부서 사원들의 이름, 급여, 보너스, 부서번호 출력
SELECT ENAME, SAL, SAL*1.13, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--16.모든 사원에 대해 입사한 날로 부터 60일이 지난 후의 ‘월요일’에 대한 년,월,일를 구하여 이름, 입사일, 60일 후의 ‘월요일’ 날짜를 출력
SELECT ENAME, HIREDATE, TO_CHAR(NEXT_DAY(HIREDATE+60,'월요일'),'YYYY/MM/DD')
FROM EMP;

--17.이름의 글자수가 6자 이상인 사원의 이름을 앞에서 3자만 구하여 소문자로 이름만 출력
SELECT LOWER(SUBSTR(ENAME,1,3))
FROM EMP
WHERE LENGTH(ENAME) >=6;

--18.사원들의 사원 번호와 급여, 커미션, 연봉((comm+sal)*12)을 연봉이 많은 순서로 출력
SELECT EMPNO, SAL, NVL(COMM,0) AS 커미션, SAL*12+NVL(COMM,0) AS 연봉
FROM EMP
ORDER BY 연봉 DESC;


--19.모든 사원들의 입사한 년/월/일 
SELECT TO_CHAR(HIREDATE,'YYYY"년"MM"월"DD"일"')
FROM EMP;

 --20.10번 부서에 대해 급여의 평균 값, 최대 값, 최소 값, 인원 수를 출력
 SELECT AVG(SAL), MAX(SAL), MIN(SAL), COUNT(*)
 FROM EMP
 WHERE DEPTNO = 10;
 
 --21.사원번호가 짝수인 사원들의 모든 정보를 출력
 SELECT *
 FROM EMP
 WHERE MOD(EMPNO, 2) = 0;
 
 
 --22.각 부서별 같은 직무를 갖는 사원의 인원수를 구하여 부서 번호, 직무, 인원수 출력
 SELECT DEPTNO, JOB, COUNT(*)
 FROM EMP
 GROUP BY DEPTNO,JOB;
 
 --23.EMP와 DEPT테이블을 조인하여 모든 사원에 대해 부서 번호, 부서이름, 사원이름 급여를 출력
 SELECT E.DEPTNO, DNAME, ENAME, SAL
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO;
 
 -- 24.이름이 ‘ALLEN’인 사원의 부서 번호, 부서 이름, 사원 이름, 급여 출력
 SELECT D.DEPTNO, DNAME, ENAME, SAL
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE ENAME = 'ALLEN';
 
 --25. ‘ALLEN’과 직무가 같은 사원의 이름, 부서 이름, 급여, 부서위치를 출력
  SELECT D.DEPTNO, DNAME, ENAME, SAL
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE JOB = (SELECT JOB 
 FROM EMP
 WHERE ENAME= 'ALLEN');
 
 --26. 모든 사원들의 평균 급여보다 많이 받는 사원들의 사원번호와 이름 출력
 SELECT EMPNO, ENAME
 FROM EMP
 WHERE SAL > (SELECT AVG(SAL) FROM EMP);
 
--27. 부서별 평균 급여가 2000보다 적은 부서 사원들의 부서 번호 출력
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) < 2000;

/*자체 조인 : 같은 테이블을 두번 사용하는 것*/
SELECT E1.EMPNO,E1.ENAME,E1.MGR,
E2.EMPNO AS MGR_EMPNO,
E2.ENAME AS MGR_ENAME
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;

/*외부조인(OUTER JOIN) : 내부조인(INNER JOIN) 또는 동등 조인의 경우 한 쪽의 컬럼(열)에 값이 없다면 조회 되지 않음
외부 조인의 경우는 내부 조인과 다르게 공통되지 않은 열도 표시 합니다.*/
-- ANSI 문법
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP e LEFT OUTER JOIN DEPT d
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;
-- 오라클 문법
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP e , DEPT d
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY E.DEPTNO;

 










 
 
 
  
  
  
  
   
  

 
      
    