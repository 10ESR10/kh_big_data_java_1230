/*2023.02.20*/
/*ANSI*/
/*NATURAL JOIN : �������ΰ� ��������� WHERE ������ ���� �����ϴ� ���*/
-- �� ���̺��� ������ �̸�(�÷� �Ǵ� ��)�� ���� �÷��� ��� ���ε�
-- DEPTNO ���� ���� ���̺� ��� ������
SELECT EMPNO, ENAME,DNAME
FROM EMP NATURAL JOIN DEPT;

-- �Ϲ����� ���������� ���� �Ʒ��� �������� ������ �߻��մϴ�. DEPTNO�� ��� �Ҽ����� ��ȣ���� �߻���
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, DNAME, LOC
FROM EMP NATURAL JOIN DEPT 
ORDER BY DEPTNO, EMPNO;

/*JOIN ~ USING : ������ � ������ ����ϴ� ���� ��� �Դϴ�.*/
-- FROM TABLE1 JOIN TABLE2 USING(���ؿ�)
SELECT EMPNO, ENAME, JOB, MGR,HIREDATE, SAL, COMM,DEPTNO, DANME, LOC
FROM EMP JOIN DEPT USING(DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPT. EMPNO;

/*JOIN~ON : ���� ���뼺 �ִ� JOIN ~ ON Ű���带 ����� ���� ���*/
-- FROM TABLE1 JOIN TABLE2 ON (���� ���ǽ�)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D. DEPTNO 
WHERE SAL <= 3000
ORDER BY E.DEPTNO, EMPNO;

/*ANSI OUTER JOIN*/
-- LEFT OUTER JOIN : ���� ���̺� �������� ������ ���̺��� ��� ���� ��� ��
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--ANSI
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
FROM EMP E LEFT OUTER JOIN DEPT D
ON E.DEPTNO= D.DEPTNO;

-- RIGHT OUTER JOIN : ������ ���̺� �������� ���� ���̺��� ��� ���� ��� ��
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--ANSI
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO= D.DEPTNO;
/*���� ����*/
-- 1. �޿�(SAL)�� 2000 �ʰ��� ������� �μ� ����, ��� ������ �μ���ȣ, �μ��̸�, ����̸�, �޿� ǥ��
-- ����Ŭ ������ ANSI �������� ǥ��(NATURAL, JOIN~USING, JOIN ~ ON)
SELECT E.DEPTNO,EMPNO,DNAME,ENAME,SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL > 2000;
--ANSI NATURAL
SELECT DEPTNO,EMPNO,DNAME,ENAME,SAL
FROM EMP NATURAL JOIN DEPT
WHERE SAL > 2000;
--ANSI JOIN USING
SELECT DEPTNO,EMPNO,DNAME,ENAME,SAL
FROM EMP JOIN DEPT USING(DEPTNO)
WHERE SAL > 2000;
-- ANSI JOIN ON
SELECT E.DEPTNO,EMPNO,DNAME,ENAME,SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL > 2000;
--2. �� �μ��� �μ���ȣ,�μ��̸�, ��� �޿�, �ִ� �޿�, �ּ� �޿�, ��� �� ���
-- ����Ŭ ������ ANSI �������� ǥ��(NATURAL, JOIN~USING, JOIN ~ ON)
SELECT D.DEPTNO, D.DNAME, TRUNC (AVG(SAL)) AVG, MAX(SAL) MAX, MIN(SAL) MIN, COUNT(*) CNT
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;
-- ANSI NATURAL
SELECT DEPTNO, DNAME, TRUNC (AVG(SAL)) AVG, MAX(SAL) MAX, MIN(SAL) MIN, COUNT(*) CNT
FROM EMP NATURAL JOIN DEPT
GROUP BY DEPTNO, DNAME;
-- ANSI JOIN USING
SELECT DEPTNO, DNAME, TRUNC (AVG(SAL)) AVG, MAX(SAL) MAX, MIN(SAL) MIN, COUNT(*) CNT
FROM EMP JOIN DEPT USING(DEPTNO)
GROUP BY DEPTNO, DNAME;
-- ANSI JOIN ON
SELECT D.DEPTNO, DNAME, TRUNC (AVG(SAL)) AVG, MAX(SAL) MAX, MIN(SAL) MIN, COUNT(*) CNT
FROM EMP E JOIN DEPT D
ON E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO, DNAME;

--3. ��� �μ� ������ ��� ������ �μ���ȣ, �μ� �̸�, �����ȣ, ��� �̸�, ��å, �޿��� ��� �̸������� ���
-- ����Ŭ ������ ANSI �������� ǥ��
SELECT E.DEPTNO,DNAME,EMPNO,ENAME,JOB,SAL
FROM EMP E,DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO,ENAME;
-- ANSI OUTER
SELECT D.DEPTNO, DNAME, EMPNO, ENAME, JOB, SAL
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO ,ENAME;

/*���� ���� : SQL�� �ȿ� �ۼ��ϴ� ���� SELECT ���� �ǹ��մϴ�. �ַ� WHERE ������ ����մϴ�.*/
-- ���������� �ݵ�� ��ȣ(���� ����) �ȿ� �־� ǥ���մϴ�.
-- ����� �̸����� ����� ���� �μ� ��ȣ�� ã�� (��������)
-- ���� �������� �μ� �̸��� �μ� ��ȣ�� ���ؼ� ���ϴ� ����� ã��
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                  FROM EMP
                   WHERE ENAME = 'KING');

/*���� ������ �̿��� 'JONES'�� �޿� ���� ���� �޿��� �޴� ��� ���� ����ϱ�*/
SELECT *
FROM EMP
WHERE SAL >  (SELECT SAL
              FROM EMP 
              WHERE ENAME ='JONES' );

/*���� ������ Ư¡*/
-- ��ȸ ����� �����ʿ� ���̸� () ��� ���
-- ��κ��� ��� ORDER BY ���� �� �� ����
-- ���� ������ ���� ���������� ����� ���� �ڷ����̰ų� ���� ������ ���� �ؾ���
-- ���������� ���������� �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���� ������ ������ ��������

/* �������� : ���������� ����Ͽ� EMP ���̺��� ��� ���� �߿��� ��� �̸��� ALLEN�� ����� �߰� ����
���� ���� �߰� ������ �޴� ��� ������ ����ϱ�*/
SELECT *
FROM EMP
WHERE COMM > (SELECT COMM
              FROM EMP
              WHERE ENAME='ALLEN');

SELECT * 
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE 
                       FROM EMP
                        WHERE ENAME = 'JAMES');

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ������ �Ҽ� �μ� ������ ��ȸ
SELECT EMPNO,ENAME,JOB,SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
AND E.SAL > (SELECT AVG (SAL)
             FROM EMP);

/*���� ����� �������� ������ ���� ����*/
-- IN ������ : ���� ������ �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� �ִٸ� TRUE
SELECT *
 FROM EMP 
 WHERE SAL IN (SELECT MAX(SAL) 
           FROM EMP 
           GROUP BY DEPTNO);
           
-- ANY ������ : ���������� �� ������ ���������� ���� �˻� ��� �� �ϳ� �̻� �����Ǹ� TRUE ��ȯ
SELECT *
FROM EMP
WHERE SAL > ANY(SELECT SAL
               FROM EMP
            WHERE JOB = 'SALESMAN');
/* 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ��� */
SELECT *
FROM EMP
WHERE SAL < ANY (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO = 30)
 ORDER BY SAL, EMPNO;
 
 SELECT SAL FROM EMP WHERE DEPTNO = 30;
 
 -- ALL ������ : ���� ������ �� ������ ���� ������ ���� �˻� ����� ��� ���� ��ġ�ϸ� ��ȯ
 
 SELECT *
 FROM EMP
 WHERE SAL < ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < ALL(SELECT SAL
                FROM EMP
                WHERE JOB = 'MANAGER');

-- EXISTS ������ : ���������� ��� ���� �ϳ� �̻� �����ϸ� TRUE, �ƴϸ� FALSE
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME
              FROM DEPT
              WHERE DEPTNO =10);
              
/*���߿� ���� ���� : ���� ������ ����� �� �� �̻��� �÷����� ��ȯ�Ǿ� ���� ������ ���޵Ǵ� Ŀ��*/
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, SAL
                        FROM EMP
                        WHERE DEPTNO = 30);
                        
SELECT *
FROM EMP
WHERE (DEPTNO,SAL) IN (SELECT DEPTNO, MAX(SAL)
                     FROM EMP
                     GROUP BY DEPTNO);
                     
/*FROM ���� ����ϴ� ��������*/
-- ���� ������ FROM���� ���� ������ �̿��ϴ� ������� �ٸ� ���δ� �ζ��κ��� �մϴ�.
-- ���̺��� �ʹ� Ŀ�� �Ϻκи� ����ϰ��� �ϴ� ���
-- ���Ȼ� �����ְ� ���� ���� ���� �ؾ� �ϴ� ��쿡 ���
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME, D.LOC
  FROM (SELECT *  FROM EMP  WHERE DEPTNO = 10) E,
       (SELECT * FROM DEPT) D
       WHERE E.DEPTNO = D.DEPTNO;
-- ���� �����ϰ� �ش� ������ ��������
-- ROWNUM : ����Ŭ���� �Ϸù�ȣ�� �ο��ϱ� ���ؼ� ���Ǵ� ����� (��, ���ȣ �ű��)
SELECT ROWNUM, ENAME, SAL
FROM (SELECT * FROM EMP ORDER BY SAL DESC)
WHERE ROWNUM <= 3;

/* SELECT ���� ����ϴ� ���� ���� */
-- SELECT�� ����ϴ� ���� �� ���������� ��Į�� ���� ������� ��
SELECT EMPNO, ENAME, JOB, SAL,
(SELECT GRADE FROM SALGRADE
              WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
              DEPTNO,
              (SELECT DNAME FROM DEPT
                            WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
                            FROM EMP E;
                            SELECT ENAME, DEPTNO, SAL, (SELECT TRUNC(AVG(SAL)) FROM EMP
                            WHERE DEPTNO = E.DEPTNO) AS "�μ���ձ޿�"
                            FROM EMP E;
                            
/*�μ� ��ġ�� NEWYORK �� ��쿡 ����, �ƴϸ� �������� ��ȯ�ϱ�*/
SELECT EMPNO, ENAME, 
       CASE WHEN DEPTNO = (SELECT DEPTNO
                               FROM DEPT
                               WHERE LOC = 'NEW YORK')
            THEN '����'
            ELSE '����'
            END AS �Ҽ�
            FROM EMP
            ORDER BY �Ҽ� DESC;
/*�뼱�� �ִ� �������� Ǯ��*/
-- 1. ��ü ��� �� ALLEN�� ���� ��å�� ������� ��� ����, �μ� ���� ��� (��å, �����ȣ, �̸�, �޿�, �μ���ȣ, �μ��̸�)
SELECT JOB, EMPNO, ENAME, SAL, E.DEPTNO,DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO = D. DEPTNO
AND JOB =(SELECT JOB
           FROM EMP
           WHERE ENAME = 'ALLEN');
--2. ��ü ����� ��� �޿� ���� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��� ������ ���
--(�����ȣ, ����̸�, �μ��̸�, �Ի���, �μ���ġ, �޿�, �޿� ���)
SELECT EMPNO, ENAME, HIREDATE, LOC, SAL, GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO;

--3.10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� ��� ����, �μ� ����
--(�����ȣ, ����̸�, ��å, �μ���ȣ, �μ��̸�, �μ���ġ)
SELECT EMPNO, ENAME, JOB, E.DEPTNO, DNAME, LOC
FROM EMP E JOIN DEPT D
ON  E.DEPTNO = D. DEPTNO 
WHERE JOB NOT IN  (SELECT JOB
                     FROM EMP
                      WHERE DEPTNO =30);

--4. ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� ���� ���
--(�����ȣ, ����̸�, �޿�, �޿� ���)
-- ��� ��ȣ �������� �������� ����
SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;



            
        




