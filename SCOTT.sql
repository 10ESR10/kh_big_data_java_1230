/* ��� ���� ���̺�*/
DESC EMP;
/* ���ʽ� ���̺�*/
DESC BONUS;
/*�޿� ���� ���̺�*/
DESC SALGRADE;

/*SELECT���� �����ͺ��̽��� ����� �����͸� ��ȸ�ϴµ� ����ϴ� �����Դϴ�.*/
/*SELECT (��ȸ�� ��......) FROM ��ȸ�� ���̺�*/
SELECT * FROM EMP;
SELECT EMPNO, ENAME, HIREDATE FROM EMP;

/* ��� ��ȣ�� �μ� ��ȣ�� �������� ������ �ۼ��ϱ� */
SELECT EMPNO, DEPTNO FROM EMP;

/* ��Ī(ALIAS) ����ϱ�*/
-- �����࿡ ���� �ּ�
SELECT EMPNO "��ȣ", ENAME "�̸�" FROM EMP;
SELECT EMPNO ��ȣ, ENMAE �̸� FROM EMP;
SELECT EMPNO AS ��ȣ, ENAME AS �̸� FROM EMP;

SELECT ENAME, SAL, SAL*12+COMM, COMM FROM EMP;
SELECT ENAME, SAL, SAL*12+COMM AS "�� ��", COMM FROM EMP;


SHOW USER; -- ���� USER ǥ����, ����Ŭ ���� ��ɾ�
SELECT * FROM TAB;

/* �ߺ� ���� (DISTINCT) : �����͸� ��ȸ�� �� ���� �ߺ��Ǵ� ���� ���� �� ��ȸ�Ǵµ�, ���� �ߺ��� ���� �Ѱ����� ���� �ϰ��� �� �� ����ϴ� Ű����*/
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP; -- �� ���� ���ǿ� ���� �ߺ� ����

/* �÷��� ����ϴ� ���������(+, -, *, / ) : �ڷ����� ������ �÷������� ����� ���� ��ȸ�ϰ��� �� �� ���*/
SELECT ENAME, SAL, sal * 12 AS "����"
FROM EMP;

/* �������� : JOB ���� ���� �ߺ� ���� ��� �غ��� */
SELECT DISTINCT JOB  FROM EMP;

/* WHERE ���� : �����͸� ��ȸ�� �� ����ڰ� ���ϴ� ���ǿ� �´� �����͸��� ��ȸ�ϰ� ���� �� ��� �ϴ� ��*/
SELECT *
     FROM EMP
     WHERE DEPTNO = 10; -- SQL���� ������ ���ϴ� �����ڴ� = �Դϴ�.
     
     /* WHERE ������ ����� ��� ��ȣ�� 7500 ���� ū ����� ��� �����ȣ, ����̸�, �Ի���, �μ���ȣ ��� �ϱ� */
     
    SELECT EMPNO, ENAME, HIREDATE, DEPTNO 
    FROM EMP
     WHERE EMPNO > 7500;
     
/* �޿��� 2500 �̻��� �����ȣ, �̸�, ����, �޿� ��� */
SELECT EMPNO, ENAME, JOB, SAL
     FROM EMP
     WHERE SAL > 2500;
     
     

/* ��������� : +, -, *, /  */
SELECT *
  FROM EMP
  WHERE SAL * 12 = 36000;
  
  /* �񱳿����� : > ,>= ,<, <= */
  -- ���ʽ��� 500 �̻��� ����� ���
  SELECT *
  FROM EMP
  WHERE COMM >= 500;
  
  DESC EMP;
  /* �Ի����� 81�� 1�� 1�� ������ ����� ��� ��� */
  SELECT *
  FROM EMP
  WHERE HIREDATE < '81/ 01/01'; -- ��¥�� ���ϰų� ���ڿ��� ���� ���� '' �����־�� �մϴ�.
  
  /* ������ SALESMAN�� ����� ����ϱ�*/
  SELECT * 
  FROM EMP
  WHERE JOB = 'SALESMAN';
  
  /* �������� : AND, OR, NOT */
  --  �޿��� 2500�� ���ų� ũ�� �μ��� 20���� ����� ����ϱ� */
  SELECT *
  FROM EMP
  WHERE SAL >= 2500 AND DEPTNO = 20;
  
  -- �޿��� 2500 �̻� �Ǵ� �μ��� 20���� ����� ���(�� �� �ϳ��� �����ص� �� OR)
  SELECT  * 
  FROM EMP
  WHERE SAL >= 2500 OR DEPTNO = 20;

-- �޿��� 2500 ���� ũ�� �μ��� 20���̰� �Ի����� 82��� 1�� 1�� ���� �Ի��� ���
SELECT *
FROM EMP
WHERE SAL > 2500 AND DEPTNO = 20 AND HIREDATE < '82/01/01';

-- �޿��� 2000 �̻��̰� ������ MANAGER�� ����� �����ȣ, �̸�, ��å, �޿�, �μ���ȣ�� ����ϼ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL >= 2000 AND JOB = 'MANAGER';

-- ������ ������ ����ϱ� : NOT, !=, ^=, <>
-- �޿��� 2500 �̻��̰�, ��å�� SALESMAN�� �ƴ� ����� ����ϱ�
SELECT *
FROM EMP
WHERE SAL >= 2500 AND JOB != 'SALESMAN';


  
  

  
  

     
    
     





