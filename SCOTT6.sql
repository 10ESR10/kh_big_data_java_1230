CREATE TABLE DEPT_TCL
AS SELECT *
FROM DEPT;

SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET  LOC = 'DALLAS'
WHERE DEPTNO = 40; 
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

COMMIT;

DESC EMP;
/*���̺��� ���� �����ϴ� ���*/
CREATE TABLE EMP_DDL (
EMPNO     NUMBER(4),
ENAME     VARCHAR2(10),
JOB       VARCHAR2(9),
MGR       NUMBER(4),
HIREDATE  DATE,
SAL       NUMBER(7, 2),
COMM      NUMBER(7, 2),
DEPTNO    NUMBER(2)


);

SELECT * FROM EMP_DDL;
/*���� ���̺��� �� ������ �����͸� �����Ͽ� �� ���̺� �����ϱ�*/
CREATE TABLE DEPT_DDL
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_DDL;

/*���� ���̺��� �� ������ �����Ͽ� �� ���̺� �����*/
CREATE TABLE DEPT_DDL_TMP
AS SELECT * FROM DEPT
WHERE 1 != 1;

SELECT * FROM DEPT_DDL_TMP;

CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE 1 !=1;

SELECT * FROM EMPDEPT_DDL;
/*
* DDL(������ ���Ǿ�)
* CREATE : ���̺� ����
* ALTER : ���̺� ���� (ADD, RENAME, MODIFY, DROP)
* RENAME : ���̺� �̸� ����
* TRUNCATE : ���̺� ������ ����
* DROP : ���̺� ����
*/
/*���̺��� �����ϴ� ALTER: ���̺� �� ���� �߰� �Ǵ� ����, ���� �ڷ����� ���� ���� ���� ����*/
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

-- ���̺� ���ο� ���� �߰� : ADD, �߰��� ���� ���� �࿡�� NULL ������ �Է� ��
ALTER TABLE EMP_ALTER 
ADD HP VARCHAR2(20);

-- �� �̸� ���� : RENAME
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

-- ���� �ڷ����� ���� : MODIFY, �ڷ��� ���� �� �̹� �ش� �÷��� ���� ���� �����Ѵٸ� ���� �� �� �� ����
-- ������ �ڷ����� ũ�⺸�� ũ�� �����ϴ� �� ���� �� ��, �۰� ����ô� ���Ե� �����Ϳ� ������ ����
ALTER TABLE EMP_ALTER
 MODIFY EMPNO NUMBER(5);
 
 DESC EMP_ALTER;
 MODIFY EMPNO NUMBER(5);
 
 -- Ư�� ���� ���� �� �� : DROP (���� �־ ����)
 ALTER TABLE EMP_ALTER
 DROP COLUMN MGR;

/* ���̺� �̸��� �����ϴ� RENAME */
RENAME EMP_ALTER TO EMP_RENAME;
SELECT * FROM EMP_RENAME;

/* ���̺��� �����͸� �����ϴ� TRUNCATE*/
-- ���̺��� ��� �����͸� �����ϴ� ���, ���̺� ������ ������ ���� ������, ROLLBACK �Ұ�
TRUNCATE TABLE EMP_RENAME;

/* ���̺��� �����ϴ� DROP*/
DROP TABLE EMP_RENAME;


CREATE TABLE EMP_HW (
EMPNO    NUMBER(4),
ENAME    VARCHAR2(10),
JOB      VARCHAR2(9),
MGR      NUMBER(4),
HIREDATE DATE,
SAL      NUMBER(7,2),
COMM     NUMBER(7,2),
DEPTNO   NUMBER(2)
);
SELECT * FROM EMP_HW;

ALTER TABLE EMP_HW
ADD BIGO   VARCHAR2(20);

ALTER TABLE EMP_HW
MODIFY BIGO  VARCHAR2(30);

INSERT INTO EMP_HW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO,NULL
FROM EMP;

ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;

DROP TABLE EMP_HW;


/*���� ���� : ���̺� ������ �����͸� �����ϴ� Ư���� ��Ģ�� �ǹ��մϴ�. ���ǿ� ���� �ʴ� ������ ���� �Ұ�*/
-- �� ���� ������� �ʴ� NOT NULL : ���� ���� �������� �ߺ� ���δ� ��� ���� NULL ���� ������� ���� (�ݵ�� ���� �Է� �Ǿ�� ��)
CREATE  TABLE TABLE_NOTNULL(
 LOGIN_ID VARCHAR2(20) NOT NULL,
 LOGIN_PWD VARCHAR2(20) NOT NULL,
 TEL       VARCHAR2(20)
);
SELECT * FROM TABLE_NOTNULL;

INSERT INTO TABLE_NOTNULL(LOGIN_ID,LOGIN_PWD,TEL) VALUES('�����̻�����','SSS1111',010-1111-2222);
INSERT INTO TABLE_NOTNULL(LOGIN_ID,LOGIN_PWD,TEL) VALUES('����������','123123',NULL);

/*�ߺ����� �ʴ� �� : UNIQUE*/
-- ���� ������ �������� �ߺ��� ������� ����, 

CREATE TABLE TABLE_UNIQUE(
 LOGIN_ID VARCHAR2(20) UNIQUE,
 LOGIN_PWD VARCHAR(20) NOT NULL,
 TEL VARCHAR(20)
 );
 INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD,TEL) VALUES('�����̻�����','SSS1111',010-1111-2222);
INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD,TEL) VALUES('�����̻�����','123123',NULL);

SELECT * FROM TABLE_UNIQUE;

CREATE TABLE TABLE_PK (
LONGIN_ID VARCHAR2(20) PRIMARY KEY,  -- UNIQUE�� NOT NULL Ư���� ��� ������ ����
LOGIN_PWD VARCHAR(20) NOT NULL,
TEL  VARCHAR2(20)
);
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL) VALUES('�����̻�����','SSS1111',010-1111-2222);
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL) VALUES('����������','123123',NULL);

SELECT * FROM TABLE_PK;

/*FOREIGN(�ܷ�)KEY �����ϱ�*/
-- FOREIGN(�ܷ�) KEY�� ���� �ٸ� ���̺� ���踦 �����ϴµ� ����ϴ� ���� ����
CREATE TABLE DEPT_FK(
DEPTNO    NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_SPK PRIMARY KEY,
DNAME VARCHAR(14),
LOC    VARCHAR(13)
);
SELECT * FROM DEPT_FK;

CREATE TABLE EMP_FK(
EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER (7,2),
COMM NUMBER (7,2),
DEPTNO NUMBER(2) CONSTRAINT EMPMK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)
);

SELECT *FROM EMP_FK;

INSERT INTO DEPT_FK VALUES(10, '���̺�', 'SEOUL');
INSERT INTO EMP_FK VALUES(9999, '������', '���̵�', NULL, SYSDATE, 3000, NULL, 10);

/* ������ ���¿� ������ ���ϴ� CHECK */
CREATE TABLE TABLE_CHECK (
LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK_LOGIN_PK PRIMARY KEY,
LOGIN_PWD VARCHAR(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD)>3),
TEL VARCHAR2(20)
);

INSERT INTO TABLE_CHECK VALUES('����������', '1234', '010-1234-5678');

/* �⺻���� �����ϴ� DEFAULT*/
CREATE TABLE TABLE_DEFAULT (
LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR(20) DEFAULT '1234',
TEL VARCHAR2(20)
);
SELECT * FROM TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES('������',NULL,'010-1111-2222');
INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES('������2','010-1111-3333');

CREATE TABLE TABLE_PRODUCT(
PRODUCT_ID NUMBER PRIMARY KEY,
PRODUCT_NAME VARCHAR2(20) NOT NULL,
REG_DATE DATE
);

INSERT INTO TABLE_PRODUCT  VALUES(1,'Computer','21/01/02');
INSERT INTO TABLE_PRODUCT  VALUES(2,'Smartphone','22/02/03');
INSERT INTO TABLE_PRODUCT  VALUES(3,'Television','22/07/01');

SELECT * FROM TABLE_PRODUCT;
ALTER TABLE TABLE_PRODUCT
ADD WEIGHT NUMBER CHECK (WEIGHT >=0);

ALTER TABLE TABLE_PRODUCT
ADD PRICE NUMBER CHECK (PRICE >=0);

CREATE TABLE CUSTOMER_TABLE(
CUSTOM_ID  NUMBER PRIMARY KEY,
USER_NAME  VARCHAR2(12) NOT NULL,
PHONE      VARCHAR(20),
EMAIL      VARCHAR(20),
REG_DATE    DATE DEFAULT'1900/01/01'
);

ALTER TABLE CUSTOMER_TABLE
ADD AGE  NUMBER CHECK (AGE BETWEEN 1 AND 199);

ALTER TABLE CUSTOMER_TABLE
ADD SEX VARCHAR2(1) CHECK(SEX= 'M' OR SEX = 'F');

ALTER TABLE CUSTOMER_TABLE
ADD BIRTH_DATE DATE;

ALTER TABLE CUSTOMER_TABLE
MODIFY PHONE UNIQUE
MODIFY EMAIL UNIQUE;

ALTER TABLE CUSTOMER_TABLE
RENAME  COLUMN  SEX TO GENDER;


/*������ ����*/
-- ����Ŭ �����ͺ��̽� ���̺��� ����� ���̺�� ������ �������� ������ ���ϴ�.
-- ������ �������� �����ͺ��̽� �޸�, ����, �����, ����, ��ü �� ����Ŭ
-- �����ͺ��̽� ��� �߿��� �����Ͱ� �����Ǿ� �ֽ��ϴ�.
-- ������ ���� ������ �����ϰų� �����ϴ� ���� �۾��� �� �� ���� ������ ���� ������ ����
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

-- ����ڰ� ������ ��ü ������ �����Ǿ� ����
SELECT TABLE_NAME FROM USER_TABLES;

-- ALL_ ���ξ ���� ������ ������ ����Ŭ �����ͺ��̽��� �������ִ� ����ڰ� ������
-- ��ü �� �ٸ� ����ڰ� ������ ��ü �� ����� ����Ǿ� �ִ� ��ü ����
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

-- DBA_ ���ξ ���� ������ ������ �����ͺ��̽� ���� ������ ���� ����ڸ� ��ȸ�� �� �ִ�
- ���̺�ν� SCOTT �������δ� ��ȸ�� �Ұ���
SELECT* FROM DBA_TABLES;

/*�ε��� : ����Ŭ �����ͺ��̽����� ������ �˻� ������ ����� ���� ���̺� ���� ����ϴ� ��ü*/
SELECT ROWID, ENAME, EMPNO FROM EMP;

SELECT * FROM USER_INDEXES;

/* �ε��� ����*/
-- ����Ŭ �����ͺ��̽����� �ڵ����� �������ִ� �ε��� �ܿ� ����ڰ� ���� �ε����� ���� �� ���
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);

-- ������ �ε��� Ȯ���ϱ�
SELECT * FROM USER_IND_COLUMNS;

-- ���� �ε��� �����ϱ� : �� �� �̻��� �÷����� �ε��� ����(�ִ� 32������ ����)
CREATE INDEX IDX_EMP_TUPLE ON EMP(JOB, DEPTNO);

-- ����ũ(UNIQUE) �ε��� ���� : ����ũ(UNIQUE) �ε����� �����ϸ� �ε��� ������ �÷���
--�ش� ���̺��� ������ ���̾�� �մϴ�. (�� �ʿ��� ��찡 �ƴϸ� ������� �� ��)
CREATE UNIQUE INDEX IDX_RMP_UK ON EMP(EMPNO,MGR);

-- �ε��� ���� :DROP 
DROP INDEX IDX_EMP_SAL;

/*VIEW : ���� ���̺��� ���� �θ��ϴ�. ��� �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT���� ������ ��ü*/
-- ��� ������ ������ �ܼ�ȭ �� �� �ս��ϴ�.
-- ����ڿ��� �ʿ��� ������ �����ϵ��� ������ ���� �� �� �ֽ��ϴ�.
CREATE VIEW VW_EMP20 
AS(SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO =20);

SELECT * FROM BW_EMP20;

/* �ܼ� �� �����ϱ�*/
-- �ܼ� ��� ���� ���̺� �ʿ��� �÷��� ���� �� ��(GROUP BY, UNION ������� ����)
-- �ܼ� ��� SELECT, INSERT, UPDATE, DELETE�� �����Ӱ� ��� ����
CREATE VIEW V_EMP
AS (SELECT EMPNO, ENMAE, JOB, HIREDATE
    FROM EMP);
    
    SELECT * FROM V_EMP;

DROP VIEW VW_EMP20;

/*�ζ��κ並 ����� TOP-N SQL ��*/
-- TOP-N ������ �����ͺ��̽����� ���� ū N���� ���� �˻��ϴ� ������ �ǹ��մϴ�.
-- ROWNUM�� �߰��� ��ȸ�ϱ�
SELECT ROWNUM, EMP.*
FROM EMP ;

-- �ζ��κ� (�������� �̿�)
SELECT ROWNUM, E.*
FROM (SELECT *
FROM EMP E
ORDER BY SAL DESC) E;

-- �ζ��κ�� TOP-N �����ϱ�
SELECT ROWNUM, E.*
FROM (SELECT *
FROM EMP E
ORDER BY SAL DESC) E
WHERE ROWNUM <=3;

/*VIEW�� ���� DML�� ����*/
CREATE VIEW EMP_COPY_VIEW
AS SELECT EMPNO,ENAME, DEPTNO
FROM EMP;

SELECT * FROM EMP_COPY_VIEW;

INSERT INTO EMP_COPY_VIEW VALUES(9999, '������', 30);

UPDATE EMP_COPY_VIEW
SET DEPTNO = 20
WHERE EMPNO= 9999;

DELETE FROM EMP_COPY_VIEW WHERE EMPNO=9999;









