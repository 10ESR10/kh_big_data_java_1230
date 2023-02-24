/
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
      OR JOB = 'SALESMAN'
      OR JOB = 'CLERK';
      
/* IN ������ : Ư�� ���� ���Ե� �����͸� ������ ��ȸ�� �� Ȱ��*/
SELECT * 
 FROM EMP
 WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
 
 /* IN �����ڸ� ����Ͽ� �μ���ȣ�� 10�� 20�� ����� �����ȣ, �̸�, �Ի���, �޿�, ����*/
 
 SELECT EMPNO, ENAME, HIREDATE, COMM, SAL
 FROM EMP
 WHERE DEPTNO IN (10,20);
 
 /* � �� �����ڿ� AND������ */
 SELECT *
 FROM EMP
 WHERE JOB != 'MANAGER'
        AND JOB <> 'SALESMAN'
        AND JOB ^= 'CLERK';
        
/* ���� ������ �����ϴ� BETWEEN ������ */
-- �޿��� 2000 ~ 3000 ���̿� �ִ� ��� ǥ��
SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

/* 2000�� 3000�� ����*/
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

/* BETWEEN ���� ����ؼ� �޿��� 1000���� 2500 �����̰� �μ��� 10,30�� ����� ����ϱ� */
SELECT *
FROM EMP
WHERE SAL BETWEEN 1000 AND 2500 
      AND DEPTNO IN (10,30);
      
      
/* BETWEEN ���� ����ؼ� �޿��� 1000���� 2500 �����̰�, �μ��� 10,20 �ƴ� ��� ��� */
SELECT *
FROM EMP
WHERE SAL BETWEEN 1000 AND 2500
     AND  DEPTNO NOT IN (10,20);
     
/* BETWEEN ���� ����ؼ� �����ȣ�� 7000���� 7999 �����̰�, �Ի����� 81�� 5�� 1�� ������ ��� ���*/
SELECT *
FROM EMP
WHERE EMPNO BETWEEN 7000 AND 7999
      AND HIREDATE > '81/05/01';
      

/* 1980���� �ƴ� �ؿ� �Ի��� ����� ��ȸ�ؼ� ��� */
SELECT *
FROM EMP
WHERE NOT HIREDATE BETWEEN '80/01/01' AND '80/12/31';

/* EXTRACT ���� ����ϴ� ���*/
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) != 1980;

/* LIKE ���� �Ϻ� ���ڿ��� ���ԵǾ� �ִ��� ���θ� Ȯ�� �� �� ��� */
-- % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- _ : ���� �� �ڸ� �ǹ�

SELECT * 
FROM EMP
WHERE ENAME LIKE '_L%';


/* �̸��� AM�� ���ԵǾ� �ִ� ��� ��� */
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

/* �̸��� AM�� ���ԵǾ� ���� ���� ��� ���*/
SELECT *
FROM EMP
WHERE NOT ENAME LIKE '%AM%';

/* ���ϵ�ī�� ���ڰ� ������ �Ϻ��� ��� */
INSERT INTO EMP VALUES(9999, 'TEST%PP','SALESMAN',7698, TO_DATE('22-02-14', 'DD-MM-YYYY'), 2000, 1000, 30);

SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE ENAME LIKE '%\%%' ESCAPE '\';

/* ���̺��� �ش��ϴ� �̸��� ������ ���� */
DELETE FROM EMP
 WHERE ENAME = 'TEST%PP';
 
 /* IS NULL */
 -- NULL�̶� ? 0�� �ƴϰ� �� ������ �ƴ��� �ǹ� ��, ��Ȯ���� ���̶�� �ǹ�
 SELECT *
 FROM EMP
 WHERE COMM = NULL; -- NULL�� ���� �� �� �� ����
 
 
 SELECT *
 FROM EMP
 WHERE COMM IS NULL;
 
 SELECT *
 FROM EMP
 WHERE COMM IS NOT NULL;
 
 /* NGER�� �ִ� ����� ��� �ϱ� */
 SELECT * FROM EMP;
 SELECT * FROM EMP
 WHERE MGR IS NOT NULL;
 
 /* ORDER BY �� : Ư�� �÷��� �����͸� �������� ���������̳� ������������ �����ϴ� ����� �ϴ� �� �Դϴ� */
 -- �ݵ�� ���� �������� ����Ǿ�� �ϸ�, �����ϸ� ���� �ʽ��ϴ�.
 -- ���� ������ ������� ������ �⺻������ ASC(��������)�Դϴ�.(���������� DESC �������)
 SELECT *
 FROM EMP
 ORDER BY SAL ;
 
 /* ��� ��ȣ �������� �������� �����ϱ� */
 SELECT *
 FROM EMP
 ORDER BY EMPNO;

/* �޿� �������� ���������ϰ� �޿��� ���� ��� �̸� ���� */
SELECT *
FROM EMP
ORDER BY SAL,ENAME;

/* �޿� �������� ���������ϰ� �޿��� ���� ��� ���� �������� ���� */
SELECT *
FROM EMP
ORDER BY SAL, ENAME DESC;

/* ��Ī ���� ORDER BY */
SELECT EMPNO �����ȣ, ENAME �����, SAL ����, HIREDATE �Ի���
     FROM EMP
     ORDER BY ���� DESC, ����� ASC;
     
/*���� ������ : SELECT ��ȸ�� �÷� ���̿� Ư���� ���ڸ� �ְ� ���� �� ����ϴ� ������ �Դϴ� */
SELECT ENAME || 'S JOB IS ' || JOB AS EMPLOYEE
FROM EMP;

/* �ǽ����� */
INSERT INTO EMP VALUES(7876, 'ADAMS', 'CLERK', 7788, TO_DATE('23-05-1987', 'DD-MM-YYYY'), 1100, NULL, 20);

-- S�� ������ ���
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';
-- 30�� �μ�, ��å'SALESMAN'
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN 30 AND JOB='SALESMAN';
-- 20,30 �μ��� �ٹ�, �޿��� 2000�ʰ�
SELECT *
FROM EMP
WHERE DEPTNO IN (20,30) AND SAL > 2000;
-- �޿��� 2000�̻�,3000 ���� ����
SELECT *
FROM EMP
WHERE  SAL <2000 OR SAL >3000; 
-- �̸��� E�� ����, 30�� �μ�, 1000 ~ 2000 ���̰� �ƴ�
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30 AND SAL NOT BETWEEN 1000 AND 2000;
-- �߰����� ����, ����ڰ� ����, ��å�� 'MANAGER', 'CLERK', �̸��� '_L'�� �ƴ� ��� ���
SELECT *
FROM EMP
WHERE (COMM IS NULL OR COMM = 0)
AND MGR IS NOT NULL  
AND JOB IN ('MANAGER','CLERK')
AND NOT ENAME LIKE '_L%';


-- COMM ���� NULL�� �ƴ� ���� ��ȸ
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;
-- Ŀ�̼��� ���� ���ϴ� ���� ��ȸ
SELECT*
FROM EMP
WHERE COMM IS NULL OR COMM = 0;
-- �����ڰ� ���� ���� ���� ��ȸ
SELECT*
FROM EMP
WHERE MGR IS NULL;
-- �޿��� ���� �޴� ���� ������ ��ȸ
SELECT*
FROM EMP
ORDER BY SAL DESC;
-- �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ
SELECT*
FROM EMP
ORDER BY SAL DESC, COMM DESC;
-- �����ȣ, �����, ����, �Ի��� ��ȸ(��, �Ի����� �������� ���� ó��)
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE;
-- �����ȣ, ����� ��ȸ (�����ȣ ���� �������� ����)
SELECT EMPNO,ENAME
FROM EMP
ORDER BY EMPNO DESC;
-- �����ȣ, �Ի���, �����, �޿� ��ȸ (�μ���ȣ�� ����������, ���� �μ� ��ȣ�� ���� �ֱ� �Ի��� ������ ó��)
SELECT EMPNO, DEPTNO, HIREDATE, ENAME, SAL
FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;

/* �Լ� : ����Ŭ������ ���� �Լ��� ����ڰ� �ʿ信 ���ؼ� ���� ������ ����� ���� �Լ��� ���������ϴ�.*/
-- ������ �Լ��� ������ �Լ�(���� �Լ�)�� ������ ���ϴ�.
-- DUAL ���̺� : SYS �������� �����ϴ� ���̺�� �Լ��� ������ ���̺� ���� ���� ���� �غ������� DUMMY ���̺� �Դϴ�.
/* ���� �Լ�*/
-- ABS : ���밪 ���ϴ� �Լ�
SELECT -10,ABS(10) FROM DUAL;
-- ROUND :�ݿø��� ����� ��ȯ�ϴ� �Լ�
SELECT ROUND(1234.5678) AS ROUND FROM DUAL;
-- �ݿø��� �ڸ��� �������� ������ 0���� �ݿø� �� �Ͱ� ����(������ ù��° �ڸ�)
SELECT ROUND(1234.5678, 0) ROUND_0,
ROUND(1234.5678, 1) ROUND_1,
ROUND(1234.5678, 2) ROUND _2,
ROUND(1234.5678, 3) ROUND _3, -- ����� ���� ��ŭ �Ҽ��� �Ʒ��� �̵�
ROUND(1234.5678, -1) ROUND_MINUS1,
ROUND(1234.5678, -2) ROUND_MINUS2,
FROM DUAL;
-- TRUNC : ������ �� ����� ��ȯ�ϴ� �Լ�
SELECT ROUND(1234.5678, 0) TRUNC_0,
ROUND(1234.5678, 1) TRUNC_1,
ROUND(1234.5678, 2) TRUNC _2
ROUND(1234.5678, 3) TRUNC _3, -- ����� ���� ��ŭ �Ҽ��� �Ʒ��� �̵�
ROUND(1234.5678, -1) TRUNC_MINUS1,
ROUND(1234.5678, -2) TRUNC_MINUS2
FROM DUAL;
-- MOD : �������� �� �� �������� ����ϴ� �Լ�
SELECT MOD(21, 5) FROM DUAL;
-- CEIL : �Ҽ��� ���ϰ� ������ ������ �ø�
SELECT CEIL(12.001) FROM DUAL;
-- FLOOR : �Ҽ��� ���ϸ� ������ ����
SELECT FLOOR(12.999) FROM DUAL;
-- POWER : ���� A�� ���� B��ŭ �����ϴ� �Լ�
SELECT POWER(3,4) FROM DUAL;

/* ���� �Լ� : ���� �����͸� �����ϰų� ���� �����ͷ� ���� Ư�� ����� ����� �� �� ����ϴ� �Լ��Դϴ�. */
-- UPPER : �빮�� ����
-- LOWER : �ҹ��� ����
-- INITCAP : ù ���ڴ� �빮�� �����ϰ� �������� �ҹ��ڷ� ����
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EXP;

-- WHERE ���������� ����ϱ�
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('james');

-- UPPER �Լ��� LIKE �Բ� ����ϱ�
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%ja%');

SELECT INITCAP('kwon young jin') AS �̸� FROM DUAL;
 
/* ��� �̸��� �빮��, ��å�� ù�� �빮�� �������� �ҹ��� �����ϰ� �ݿ��� ���� ������ ǥ���ϱ� */
SELECT UPPER(ENAME) AS �̸�, INITCAP(JOB) AS ��å, SAL AS �޿�
FROM EMP
ORDER BY SAL DESC;
/* ���ڿ� ���̸� ���ϴ� �Լ� (LENGTH) */
SELECT ENAME, LENGTH(ENAME) AS "�̸��� ����"
FROM EMP;

/* �̸��� ���̰� 5�� ���ų� ū ����� �̸�, �����ȣ, ��å�� ���� ������ ǥ��, �� ���ʽ� ����*/
SELECT ENAME �̸�, EMPNO �����ȣ, JOB ��å, SAL*12 AS ����
FROM EMP
WHERE LENGTH(ENAME)>=5
ORDER BY ���� DESC;

-- LENGTH : ���ڿ��� ���̸� ��ȯ
-- LENGTHB : ���ڿ��� ����Ʈ�� ��ȯ
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
FROM DUAL;

/*��å �̸��� 6�� �̻��̰� COMM�� �ִ� ��� ���*/
SELECT *
FROM EMP
WHERE LENGTH(JOB) > 6 AND (COMM IS NOT NULL AND COMM !=0);

/* SUBSTR / SUBSTRB : ��� ���ڿ��̳� �÷��� �ڷῡ�� ���� ��ġ���� ������ŭ�� ���ڸ� ��ȯ�ϴ� �Լ�, �ε��� ���� �ƴ� */
-- SUBSTR(���ڿ� ������, ���� ��ġ, ����)
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3,2), SUBSTR(JOB, 5)
FROM EMP;

-- SUBSTR �Լ��� �ٸ� �Լ� �Բ� ���
SELECT JOB,
SUBSTR(JOB, -LENGTH(JOB), 2) FROM EMP;

/* INSTR : ���ڿ� ������ �ȿ� Ư�� ���ڳ� ���ڿ��� ��� ���ԵǾ� �ִ��� �˰��� �� �� ���*/
SELECT INSTR ('HELLO, ORACLE!!', 'L') AS INSTR_1 FROM DUAL;
SELECT INSTR('HELLO, ORACLE!!', 'L', 5) AS INSTR_2 FROM DUAL; -- ã�� ���ڿ��� ���� ��ġ�� ���� �� �� ����
SELECT INSTR('HELLO, ORACLE!!', 'L', 5) AS INSTR_3 FROM DUAL; -- ���� ��ġ ã�� ���ڰ� �� ��° ���� ����








 
 
 
 
 
 
 

     