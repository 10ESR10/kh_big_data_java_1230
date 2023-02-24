/* 2023�� 2��15�� */
-- SUBSTR�Լ��� �ٸ� �Լ� �Բ� ���
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)), -- JOB�� ���̴� 5�̰� 5�� ���� ������ ���ϸ� �ڿ��� ���� �������� Ŀ���鼭 �о
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
    --REPLACE : Ư�� ���ڿ� �����Ϳ� ���Ե� ���ڸ� �ٸ� ���ڷ� ��ü �� �� ��� (�ڹ��� ������ ����), ��ü�� ���ڿ��� ���� ������ ������ ȿ��
    SELECT '010-5006-4146' AS -- ��������,
     REPLACE('010-5006-4146', '-', ' ')-- �������� ��������,
     REPLACE('010-5006-4146', '-') --�����»���
     FROM DUAL;
     
     -- LPAD / RPAD : ������ ĭ���� �����ϰ� ��ĭ ��ŭ Ư�� ���ڷ� ä��� ���
     SELECT LPAD('ORACLE', 10, '+') FROM DUAL;
     SELECT RPAD('ORACLE', 10, '+') FROM DUAL;
     SELECT 'ORACLE',
     LPAD('ORACLE', 10, '#')AS LPAD_1,
     RPAD('ORACLE', 10, '*') AS RPAD_1,
     LPAD('ORACLE', 10) AS LPAD_2,
      RPAD('ORACLE', 10) AS RPAD_2
      FROM DUAL;
      
-- �������� ���ڸ��� *ǥ�÷� ����ϱ�
SELECT
RPAD('971225-', 14, '*') AS RPAD_JUMIN,
RPAD('010-5006-', 13, '*') AS RPAD_PHONE
FROM DUAL;

-- �� ���ڿ��� ��ġ�� CONCAT �Լ�
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME))
    FROM EMP;
    
-- TRIM/LTRIM/RTRIM : ���ڿ� ������ Ư�� ���ڸ� ����� ���ؼ� ���
SELECT '[' || TRIM(' _ORACLE_ ') || ']' AS TRIM,
'[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM,
'[' || LTRIM('<_ORACLE_>', '<_') || ']' AS LTRIM_2, -- ���ڿ��� ���ڸ� ����� ������ ������ ���� �ʾƵ� ������
'[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM,
'[' || RTRIM('<_ORACLE_>', '_>') || ']' AS RTRIM_2
FROM DUAL;

SELECT LTRIM('    KLS2024    ') AS TRIM FROM DUAL;

/* ��¥ �����͸� �ٷ�� ��¥ �Լ� */
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS NOW,
SYSDATE-1 AS YESTERDAY, -- �ü������ �о�� �ð� �������� 1���� ��
SYSDATE+1 AS TOMORROW --�ü������ �о�� �ð� �������� 1���� ����
FROM DUAL;

/* �� ���� ������ ��¥�� ���ϴ� ADD_MONTHS �Լ� */
-- Ư�� ��¥�� ������ ���� �� ���� ��¥ �����͸� ��ȯ�ϴ� �Լ�
-- ADD_MONTHS(��¥ �����ͤ� ���� ���� ��)
 SELECT SYSDATE,
 ADD_MONTHS (SYSDATE, 5)
 FROM DUAL;
 
 /*�ǽ� ����(EMP) :����� ���� �����ȣ, �̸�, �Ի���, 10�� ����� ��¥�� ����ϱ�*/
 SELECT EMPNO AS �����ȣ, ENAME AS �̸�, HIREDATE AS �Ի���, ADD_MONTHS(HIREDATE, 120) AS "10�� �����"
 FROM EMP;
 
 /*�ǽ�����(DUAL): ���� �ð��� 8���� ���� �ð� ����ϱ�*/
 SELECT SYSDATE ����ð�,
 ADD_MONTHS(SYSDATE, 8) AS "8���� �����"
 FROM DUAL;
 
 /*�� ��¥���� ���� �� ���̸� ���ϴ� MONTHS_BETWEEN �Լ�*/
 SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
 MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
 MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
 TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
 FROM EMP;
 
 /*���ƿ��� ����, ���� ������ ��¥�� ���ϴ� NEXT_DAY, LAST_DAY �Լ� */
 -- NEXT_DAY(��¥������, ���Ϲ���) -> ��¥ �������� ���ƿ��� ������ ��¥�� ���
 -- LAST DAY(��¥������) -> ��¥�� ���� ���� ������ ��¥�� ���
 SELECT SYSDATE,
 NEXT_DAY(SYSDATE, '�����'),
 LAST_DAY(SYSDATE)
 FROM DUAL;
 
 -- ��¥�� �ݿø�, ������ �ϴ� ROUND, TRUNC �Լ� 
 
 -- ��¥ ������ ���� �Լ�
 SELECT EXTRACT(YEAR FROM DATE '1998-03-07')
 FROM DUAL;
 
 SELECT *
 FROM EMP
 WHERE EXTRACT(MONTH FROM HIREDATE) = 12;
 
 SELECT 
 EXTRACT(MONTH FROM SYSDATE) FROM DUAL; -- ���� �� ������ ����

/* �ڷ����� ��ȯ�ϴ� �� ��ȯ �Լ� */
-- ����Ŭ�� �ڹٿ� ���������� ����� ����ȯ�� ������ ����ȯ�� �ֽ��ϴ�.
-- �ڵ�(������) �� ��ȯ : ���ڿ� ���� �ڷ����� ������ �ڵ����� ���ڵ� ��ȯ(�ڹٿ� �ٸ���)
SELECT EMPNO, ENAME, EMPNO + '500'
 FROM EMP;
 
 SELECT EMPNO, ENAME, EMPNO + 'ABCD' -- ������ �߻� ��
 FROM EMP;
 
 /*��¥, ���ڸ� ���ڷ� ��ȯ�ϴ� TO_CHAR �Լ�*/
 -- TO_CHAR �Լ��� ��¥, ���� �����͸� ���� �����ͷ� ��ȯ���ִ� �Լ� �Դϴ�. �ַ� ��¥ �����͸� ���� �����ͷ� ��ȯ�� ���� ���
 -- TO_CHAR(��¥������, ��µǱ⸦ ���ϴ� ���� ����) 
 SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ͽð�
 FROM DUAL;
 
 -- �پ��� �������� ����ϱ�
 SELECT SYSDATE,
 TO_CHAR(SYSDATE, 'CC') AS ����,
 TO_CHAR(SYSDATE, 'YY') AS ����,
 TO_CHAR(SYSDATE, 'YYYY/MM/DD pm HH:MM:SS') AS "��/��/�� ��:��:��",
 TO_CHAR(SYSDATE, 'Q') AS ����,
 TO_CHAR(SYSDATE, 'DD') AS ��,
  TO_CHAR(SYSDATE, 'DDD') AS �����,
  TO_CHAR(SYSDATE, 'HH') AS "12�ð���",
  TO_CHAR(SYSDATE, 'HH12') AS "12�ð���",
  TO_CHAR(SYSDATE, 'HH24') AS "24�ð���",
  TO_CHAR(SYSDATE, 'W' ) AS ������
  FROM DUAL;
  
  -- Ư�� �� ���缭 ��¥ ����ϱ�
  SELECT SYSDATE,
  TO_CHAR(SYSDATE, 'MM') AS MM,
  TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
  TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
  TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
  TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
  TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
  TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
  FROM DUAL;
  
  -- ���� ������ ������ �����Ͽ� ����ϱ�
  -- 9 : ������ �� �ڸ��� �ǹ��ϰ� �� �ڸ��� ä���� ����
  -- 0 : �� �ڸ��� 0���� ä��
  -- $ : �޷� ǥ�ø� ����
  -- L : ���� ȭ�� ������ ǥ��
  -- . : �Ҽ��� ǥ��
  -- , : õ ���� ǥ��
  SELECT SAL,
  TO_CHAR(SAL, '$999,999') AS SAL_$, -- �޷� ǥ�ø� �ϰ� �� �ڸ��� ä���� ����
  TO_CHAR(SAL, 'L999,999') AS SAL_L, -- ���� ȭ�� ǥ���ϰ�, õ������ ,�߰�
  TO_CHAR(SAL, '999,999.00') AS SAL_1, -- �Ҽ��� ���� 2�ڸ� ǥ��
  TO_CHAR(SAL, '$999,999,999.00') AS SAL_2, -- �� �ڸ��� 0���� ä��
  TO_CHAR(SAL, '000999999.99') AS SAL_3, -- �Ҽ���
  FROM EMP;
  
  /* TO_NUMBER : ���� Ÿ���� ���ڿ��� ���� ������ Ÿ������ ��ȯ���ִ� �Լ��ε� �ڵ� ����ȯ���� ����� ��찡 ����*/
  SELECT '1300' - '1500',
  '1300' +'1500'
  FROM DUAL;
  
  /* TO_DATE : ���ڿ��� ��õ� ��¥�� ��ȯ�ϴ� �Լ� */
  SELECT TO_DATE ('22/08/20', 'YY/MM/DD')
  FROM DUAL;
  
  SELECT TO_CHAR(SYSDATE, 'YY/MM/DD') AS "���糯¥�� �ð�"
  FROM DUAL;
  
  DESC EMP;
  
  SELECT * 
  FROM EMP
  WHERE HIREDATE < TO_CHAR('1981/01/01', 'YYYY/MM/DD');
  
  /*1981 6�� 1�� ���Ŀ� �Ի��� ��� ���� ����ϱ� */
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

/*NVL �Լ��� ����*/
-- NVL (�����Ϳ�, ���� �����Ͱ� NULL�� ��� ��ȯ �� ������)
SELECT EMPNO, ENAME, SAL, COMM,
    NVL(COMM, 0),
    SAL * 12+NVL(COMM, 0)
FROM EMP;

--NVL2(�˻� �� �����Ϳ�, NULL�� �ƴ� ��쿡 ���� ����, NULL�� ��쿡 ���� ����)
SELECT EMPNO, ENAME, COMM,
NVL2(COMM, 'O','X') AS "NULL ���� ǥ��",
NVL2(COMM, SAL*12+COMM, SAL*12) AS "���� ���"
FROM EMP;

-- NULLIF : �� ���� ���Ͽ� �������� �ƴ����� ���� ��� ��ȯ : ������ NULL�� ��ȯ, �������� ������ ù ��° ���� ��ȯ
SELECT NULLIF(10, 10) , NULLIF('A','B') FROM DUAL;

/*DECODE : �־��� ������ ���� ���� ���� ��ġ�ϴ� ���� ����ϰ� ��ġ�ϴ� ���� ������ �⺻�� ���*/
-- ���ǹ� �Ǵ� SWITCH���� ����
SELECT EMPNO, ENAME, JOB, SAL,
DECODE(JOB,
 'MANAGER', SAL*1.1, 
 'SALESMAN',SAL*1.05,
 'ANALYST', SAL,
 SAL*1.03) AS �޿��λ�
 FROM EMP;
 
 /* CASE �� :  �־��� ������ ���� ���� ���� ��ġ�ϴ� ���� ����ϰ� ��ġ�ϴ� ���� ������ �⺻�� ���*/
 SELECT EMPNO, ENAME, JOB, SAL,
 CASE JOB
 WHEN 'MANAGER' THEN SAL*1.1
 WHEN 'SALESMAN' THEN SAL*1.05
 WHEN 'ANALYST' THEN SAL
 ELSE SAL*1.03
 END AS �޿��λ�
 FROM EMP;
 
 -- �� ���� ���� ��� ���� �޶����� CASE ��, IF���� ������
 
 SELECT EMPNO, ENAME, COMM,
 CASE 
   WHEN COMM IS NULL THEN '�ش���� ����'
   WHEN COMM = 0 THEN '�������'
   WHEN COMM > 0 THEN '���� : ' || COMM
   END AS ����ǥ��
   FROM EMP;
   
   /*������ �ǽ� ����*/
   -- ��ǿ� �ִ� 4���� ����
   -- 1.ENAME�� �ټ������� ���, ���ڸ��� ǥ���ϰ� �������� * ó��
   SELECT EMPNO,
   RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
   ENAME,
   RPAD(SUBSTR(ENAME,1, 1),5, '*') AS MASKING_ENAME
   FROM EMP
   WHERE LENGTH(ENAME)=5
   ORDER BY EMPNO;
   
   -- 2.
   SELECT EMPNO, ENAME, SAL,
   TRUNC(SAL/21.5, 2) AS DAY_PAY, -- �Ҽ��� ��°�ڸ����� ���� ����
   ROUND(SAL/21.5/8, 1) AS TIME_PAY -- �Ҽ��� ��° �ڸ����� �ݿø�
   FROM EMP;
   
   -- 3.
   SELECT EMPNO, ENAME, HIREDATE,
TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3), '������'), 'YYYY-MM-DD') AS R_JOB,
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
   
   -- SCOTT ���� ����
   --1.���� ��¥�� ���� ���� ��ȸ
    SELECT SYSDATE
    FROM DUAL;
   --2. EMP���̺��� ���, �����, �޿� ��ȸ (��, �޿��� 100���������� ���� ��� ó���ϰ� �޿� ���� �������� ����), ��°�ڸ� �ݿø�
   SELECT EMPNO,ENAME,
   ROUND(SAL,-2) AS �޿�
   FROM EMP
   ORDER BY �޿� DESC;
   --3. EMP���̺��� �����ȣ�� Ȧ���� ������� ��ȸ
   SELECT *
   FROM EMP
   WHERE MOD(EMPNO, 2) = 1;
   --4. EMP���̺��� �����, �Ի��� ��ȸ (��, �Ի����� �⵵�� ���� �и� �����ؼ� ���)
   SELECT ENAME, EXTRACT(YEAR FROM HIREDATE) AS �Ի�⵵, EXTRACT(MONTH FROM HIREDATE) AS �Ի��
     FROM EMP;
   --5. EMP���̺��� 9���� �Ի��� ������ ���� ��ȸ
   SELECT *
   FROM EMP
   WHERE EXTRACT(MONTH FROM HIREDATE) =9;
   
   --6. EMP���̺��� 81�⵵�� �Ի��� ���� ��ȸ
   SELECT *
   FROM EMP
   WHERE EXTRACT(YEAR FROM HIREDATE) =1981;
   --7. EMP���̺��� �̸��� 'E'�� ������ ���� ��ȸ
   SELECT * 
   FROM EMP
   WHERE ENAME LIKE '%E';
   --8. EMP���̺��� �̸��� �� ��° ��¥�� 'R'�� ������ ���� ��ȸ
   SELECT *
   FROM EMP
   WHERE ENAME LIKE '__R%';
   --9. EMP���̺��� ���, �����, �Ի���, �Ի��Ϸκ��� 40�� �Ǵ� ��¥ ��ȸ
   SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE, 40*12)
   FROM EMP;
   
   --10. EMP���̺��� �Ի��Ϸκ��� 38�� �̻� �ٹ��� ������ ���� ��ȸ
   -- MONTHS_BETWEEN(��¥������, ��¥������) -> �� ��¥���� ��¥ ���̸� �������� ���
   SELECT *
   FROM EMP
   WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE)/12 >=38;
   --11. ���� ��¥���� �⵵�� ����
   SELECT EXTRACT(YEAR FROM SYSDATE)
   FROM DUAL;
   
   /*�Բ� ���ϴ� SUM�Լ�*/
   -- DISTINCT : �ߺ� ����
   -- ALL : ������� �ʾƵ� �⺻������ ALL Ư���� �����ϴ�.
   SELECT  SUM(DISTINCT SAL) AS �ߺ�����, SUM(ALL SAL) AS ����, SUM(SAL) AS �⺻
   FROM EMP;
   
   SELECT SUM(SAL), SUM(COMM) FROM EMP;
   
   SELECT COUNT(*) FROM EMP;
   SELECT COUNT(COMM) FROM EMP; -- COMM�� NULL�� �ƴ� ����� ��
   
   SELECT COUNT(COMM)
   FROM EMP
   WHERE COMM IS NOT NULL;
   
   -- �μ� ��ȣ�� 20�� ��� �� �Ի����� ���� �ֱ��� ��� ���
   SELECT MAX(HIREDATE)
   FROM EMP
   WHERE DEPTNO = 20;
   
   /*GROUP BY : �ϳ��� ����� Ư�� ���� ��� ����ϴ� ���� �׷�ȭ�Ѵٰ� �մϴ�.*/
   -- �� �� ����ؾ� �� ����� �����ϴ� ���� GROUP BY �����մϴ�.
   SELECT TRUNC (AVG( SAL)), DEPTNO
   FROM EMP
   GROUP BY DEPTNO;
   
   SELECT TRUNC(AVG(SAL))FROM EMP WHERE DEPTNO = 10;
   SELECT TRUNC(AVG(SAL))FROM EMP WHERE DEPTNO = 20;
   SELECT TRUNC(AVG(SAL))FROM EMP WHERE DEPTNO = 30;
   
   /*�μ� ��ȣ �� ��å�� ��� �޿��� �����ϱ�*/
   SELECT DEPTNO, JOB, AVG(SAL)
   FROM EMP
   GROUP BY DEPTNO,JOB
   ORDER BY DEPTNO,JOB;
   
   /*GROUP BY�� ����Ͽ� �μ� ��ȣ�� ��� �߰� ������ ���*/
   SELECT NVL (AVG(COMM),0), DEPTNO
   FROM EMP
   GROUP BY DEPTNO;
   
   /* �μ� �ڵ�, �޿� �հ�, �μ� ���, �μ� �ڵ� �� ���� */
  SELECT DEPTNO �μ��ڵ�,
  SUM(SAL) �հ�,
  FLOOR(AVG(SAL)) ���,
  COUNT(*) �ο���
  FROM EMP
  GROUP BY DEPTNO;
  
  /* HAVING �� : GROUP BY ���� ���� �� ���� ��� �� �� ����*/
  -- �׷�ȭ�� ���� ������ �����ϴ� �뵵�� ���
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
  
  /* WHERE ���� HAVING ���� ��� ����ϴ� ���*/
  SELECT DEPTNO, JOB, AVG(SAL) AS ���
  FROM EMP -- ù��° ���� : 12 ~ 13�� ���� ����
  WHERE SAL <= 2500
  GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
  ORDER BY DEPTNO, JOB;
  
 -- 1. HAVING���� ����Ͽ� EMP ���̺��� �μ��� ��å�� ��� �޿��� 500 �̻��� ������ �μ� ��ȣ , ��å, �μ��� ��å�� ��� �޿� ���
SELECT DEPTNO,JOB,AVG(SAL) AS ���
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >=500;

 --2.EMP ���̺��� �̿��Ͽ� �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ������� ���,  ��, ��� �޿��� ��� �� ���� �Ҽ��� �����ϰ� �μ� ��ȣ���� ���
 SELECT DEPTNO, TRUNC(AVG(SAL)) ��ձ޿�,
 MAX(SAL) �ְ�޿�,
 MIN(SAL) �����޿�,
 COUNT(*) �����
 FROM EMP
 GROUP BY DEPTNO
 ORDER BY DEPTNO;
 
 --3.���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
 SELECT JOB ����, COUNT(*) �����
 FROM EMP
 GROUP BY JOB
 HAVING COUNT(*) >= 3;
 --4.������� �Ի� ������ �������� �μ����� �� ���� �Ի��ߴ��� ���
 SELECT TO_CHAR(HIREDATE, 'YYYY') AS "�Ի���",
 DEPTNO,
 COUNT(*) AS "�����"
 FROM EMP
 GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
 
 
 --5.�߰� ������ �޴� ��� ���� ���� �ʴ� ������� ��� (O, X�� ǥ�� �ʿ�)
 SELECT NVL2(COMM, 'O', 'X') AS "�߰�����",
    COUNT(*) AS "�����"
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

 --6. �� �μ��� �Ի� ������ ��� ��, �ְ� �޿�, �޿� ��, ��� �޿��� ���
SELECT DEPTNO,
TO_CHAR(HIREDATE, 'YYYY') AS �Ի�⵵,
COUNT(*) AS �����,
MAX(SAL) AS �ְ�޿�,
TRUNC(AVG(SAL)) AS ��ձ޿�,
SUM(SAL) AS "�հ�"
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY')
ORDER BY DEPTNO;

/*ROLLUP �Լ��� ������ �׷�ȭ*/
-- ����� ���� �ұ׷���� ��׷��� ������ �� �׷캰 ����� ����ϰ� �������� �� ������ ����� ���
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB;

/*���� ������ : �� �� �̻��� ���� ����� �ϳ��� �����ϴ� ������*/
-- UNION : ������, �ߺ� ����
-- UNION ALL : ������, �ߺ� ���� ���� ����
-- MINUS : ������
-- INTERSECT : ������

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE DEPTNO = 20;

-- INTERSECT : ������ : �ΰ��� �������� ��� ���ԵǾ� �ִ� �����͸� ǥ��
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 2000;

--MINUS : ������ : ���� ������ ������� ���� ������ ����� �� ��
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 2000;

/*JOIN*/
-- JOIN�� �� �� �̻��� ���̺��� �����͸� �����ͼ� �����ϴµ� ���Ǵ� SQL�� ���
-- ���̺��� �ĺ� ���� PRIMARY KEY�� ���̺� ���� ���� FOREIGN KEY ���� ����Ͽ� ����
-- INNER JOIN : �� ���̺��� ��ġ�ϴ� �����͸� ����
-- LEFT JOIN : ���� ���̺��� ��� �����Ϳ� ������ �����Ϳ��� ��ġ�ϴ� �����͸� ����
-- RIGHT JOIN : ������ ���̺��� ��� �����Ϳ� ���� ���̺��� ��ġ�ϴ� ������ ����

--�ΰ��� ���̺��� ��翭�� ���յǾ� ������ * ������ ��ŭ�� ����� ǥ�� �˴ϴ�.(ī�׽þ� ��)
SELECT * 
FROM EMP, DEPT;

SELECT*
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

/*���̺��� ��Ī �ֱ� : ���� ���̺� ��ο� �����ϴ� ���� ���ؼ��� ���̺� �̸��� ����ؾ��� */
SELECT EMPNO, ENAME, JOB, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE  E.JOB = 'MANAGER'
AND E.DEPTNO = D.DEPTNO;


/*� ����*/
-- ���̺��� ������ �Ŀ� ��� ���� �� ���̺��� Ư�� ���� ��ġ�� �����͸� �������� �����ϴ� ���
-- ANSI ���� ������� �����ϱ�
-- ����Ŭ 9I ������ ����Ŭ ���θ� ��� �� �� �־�����, ����Ŭ 10G ���ʹ� ANSI ������ �߰��� ��� ����
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
FROM EMP E JOIN  DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER';

--EMP�� DEPT ���̺��� �����ϰ� �޿��� 3000 �̻��� ��� ���� ���(�����ȣ, �̸�, �޿�, �Ի���, �μ���ȣ, �μ��̸�)
-- ����Ŭ ��İ� ANSI �������...
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D. DEPTNO
AND SAL>=3000;

SELECT EMPNO,ENAME,SAL,HIREDATE, D.DEPTNO,DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 3000;

/*EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� ������ ���� ������� ���� ��, 
�޿��� 2500 �����̰� ��� ��ȣ�� 9999 ������ ����� ������ ��µǵ��� �ۼ� : ����Ŭ ���, ASNI �������*/
SELECT EMPNO,ENAME,SAL,HIREDATE,D.DEPTNO,DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D. DEPTNO
AND SAL BETWEEN 2500 AND 9999;


SELECT EMPNO,ENAME,SAL,HIREDATE,D.DEPTNO,DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL BETWEEN 2500 AND 9999;
/*�� ���� : ���� ���� �ƴ� �ٸ� ������ ����Ͽ� ���� �� �� ���Ǹ� ���� ������ �ʽ��ϴ�.*/

SELECT * FROM EMP;
SELECT * FROM SALGRADE;

/* �޿��� ���� ����� ǥ���ϱ� ���ؼ��� �޿��� �ݾ��� ���� �� �� �����Ƿ� �ּҿ� �ִ� �޿� ���̿� �־�� �� 
�̷� ��� BETWEEN A AND B �����ڸ� ����ϸ� ó�� ���� */
SELECT ENAME, SAL, GRADE
FROM EMP E JOIN SALGRADE S
ON SAL BETWEEN LOSAL AND HISAL;

--1.�����ȣ�� 7499�� ����� �̸�, �Ի��� �μ���ȣ ���
SELECT ENAME, HIREDATE,DEPTNO
FROM EMP
WHERE EMPNO = 7499;

--2. �̸��� ALLEN�� ����� ��� ���� ���
SELECT *
FROM EMP
WHERE ENAME = 'ALLEN';

--3. �̸��� K���� ū ���ڷ� �����ϴ� ����� ��� ���� ���
SELECT *
FROM EMP
WHERE ENAME > 'k';

--4.�Ի����� 81�� 4��2�� ���� �ʰ�, 82�� 12��9�� ���� ���� ����� �̸�, �޿�, �μ���ȣ ���
SELECT ENAME, SAL, DEPTNO, HIREDATE
FROM EMP
WHERE HIREDATE > '81/04/02' AND HIREDATE <'82/12/09';

--5.�޿��� 1,600 ���� ũ��, 3000���� ���� ����� �̸�, ����, �޿��� ���
SELECT ENAME,JOB,SAL
FROM EMP
WHERE SAL BETWEEN 1601 AND 2999;

--6. �Ի����� 81�� �̿ܿ� �Ի��� ����� ��� ���� ���
SELECT *
FROM EMP
WHERE HIREDATE > '81/12/31' OR HIREDATE < '81/01/01';

--7. ������ MANAGER�� SALESMAN�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' OR 
JOB ='SALESMAN';

--8. �μ��� 20��, 30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ���
SELECT ENAME, EMPNO, DEPTNO
FROM EMP
WHERE DEPTNO < 20 OR DEPTNO >30;

--9. �̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE ('S%');

--10.ó�� ���ڴ� �������, �� ��° ���ڰ� A�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE ENAME LIKE('_A%');

--11. Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ���
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL;

--12. �̸��� J�ڷ� �����ϰ� ������ ���ڰ� S�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE ENAME LIKE ('J%S');

--13. �޿��� 1500�̻��̰�, �μ���ȣ�� 30���� ��� �� ������ MANAGER�� ����� ��� ���� ���
SELECT *
FROM EMP
WHERE SAL >= 1500 
AND DEPTNO = 30
AND JOB = 'MANAGER';

--14.��� ����� �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ��� (��, Ŀ�̼��� null�� ����� 0���� ����)
SELECT ENAME, SAL, NVL(COMM,0), SAL+NVL(COMM,0) AS �Ѿ� 
FROM EMP
ORDER BY �Ѿ� DESC;


--15.10�� �μ��� ��� ������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. 10�� �μ� ������� �̸�, �޿�, ���ʽ�, �μ���ȣ ���
SELECT ENAME, SAL, SAL*1.13, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--16.��� ����� ���� �Ի��� ���� ���� 60���� ���� ���� �������ϡ��� ���� ��,��,�ϸ� ���Ͽ� �̸�, �Ի���, 60�� ���� �������ϡ� ��¥�� ���
SELECT ENAME, HIREDATE, TO_CHAR(NEXT_DAY(HIREDATE+60,'������'),'YYYY/MM/DD')
FROM EMP;

--17.�̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸��� ���
SELECT LOWER(SUBSTR(ENAME,1,3))
FROM EMP
WHERE LENGTH(ENAME) >=6;

--18.������� ��� ��ȣ�� �޿�, Ŀ�̼�, ����((comm+sal)*12)�� ������ ���� ������ ���
SELECT EMPNO, SAL, NVL(COMM,0) AS Ŀ�̼�, SAL*12+NVL(COMM,0) AS ����
FROM EMP
ORDER BY ���� DESC;


--19.��� ������� �Ի��� ��/��/�� 
SELECT TO_CHAR(HIREDATE,'YYYY"��"MM"��"DD"��"')
FROM EMP;

 --20.10�� �μ��� ���� �޿��� ��� ��, �ִ� ��, �ּ� ��, �ο� ���� ���
 SELECT AVG(SAL), MAX(SAL), MIN(SAL), COUNT(*)
 FROM EMP
 WHERE DEPTNO = 10;
 
 --21.�����ȣ�� ¦���� ������� ��� ������ ���
 SELECT *
 FROM EMP
 WHERE MOD(EMPNO, 2) = 0;
 
 
 --22.�� �μ��� ���� ������ ���� ����� �ο����� ���Ͽ� �μ� ��ȣ, ����, �ο��� ���
 SELECT DEPTNO, JOB, COUNT(*)
 FROM EMP
 GROUP BY DEPTNO,JOB;
 
 --23.EMP�� DEPT���̺��� �����Ͽ� ��� ����� ���� �μ� ��ȣ, �μ��̸�, ����̸� �޿��� ���
 SELECT E.DEPTNO, DNAME, ENAME, SAL
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO;
 
 -- 24.�̸��� ��ALLEN���� ����� �μ� ��ȣ, �μ� �̸�, ��� �̸�, �޿� ���
 SELECT D.DEPTNO, DNAME, ENAME, SAL
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE ENAME = 'ALLEN';
 
 --25. ��ALLEN���� ������ ���� ����� �̸�, �μ� �̸�, �޿�, �μ���ġ�� ���
  SELECT D.DEPTNO, DNAME, ENAME, SAL
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE JOB = (SELECT JOB 
 FROM EMP
 WHERE ENAME= 'ALLEN');
 
 --26. ��� ������� ��� �޿����� ���� �޴� ������� �����ȣ�� �̸� ���
 SELECT EMPNO, ENAME
 FROM EMP
 WHERE SAL > (SELECT AVG(SAL) FROM EMP);
 
--27. �μ��� ��� �޿��� 2000���� ���� �μ� ������� �μ� ��ȣ ���
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) < 2000;

/*��ü ���� : ���� ���̺��� �ι� ����ϴ� ��*/
SELECT E1.EMPNO,E1.ENAME,E1.MGR,
E2.EMPNO AS MGR_EMPNO,
E2.ENAME AS MGR_ENAME
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;

/*�ܺ�����(OUTER JOIN) : ��������(INNER JOIN) �Ǵ� ���� ������ ��� �� ���� �÷�(��)�� ���� ���ٸ� ��ȸ ���� ����
�ܺ� ������ ���� ���� ���ΰ� �ٸ��� ������� ���� ���� ǥ�� �մϴ�.*/
-- ANSI ����
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP e LEFT OUTER JOIN DEPT d
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;
-- ����Ŭ ����
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP e , DEPT d
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY E.DEPTNO;

 










 
 
 
  
  
  
  
   
  

 
      
    