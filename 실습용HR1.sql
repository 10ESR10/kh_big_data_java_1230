SELECT * FROM EMPLOYEES;
--1. EMPLOYEES ���̺��� KING�� ������ �ҹ��ڷ� �˻��ϰ� �����ȣ, ���� ������(�ҹ���), �μ���ȣ ���
SELECT EMPLOYEE_ID, FIRST_NAME || ' '|| LAST_NAME  AS ����,LOWER(JOB_ID), DEPARTMENT_ID
FROM EMPLOYEES
WHERE LOWER (LAST_NAME) = 'king';

--2. EMPLOYEES ���̺��� KING�� ������ �빮�ڷ� �˻��ϰ� �����ȣ, ���� ������(�빮��), �μ���ȣ ���
SELECT EMPLOYEE_ID, FIRST_NAME || ' '|| LAST_NAME  AS ����,UPPER(JOB_ID), DEPARTMENT_ID
FROM EMPLOYEES
WHERE UPPER (LAST_NAME) = 'KING';
--3.DEPARTMENTS ���̺��� (�μ���ȣ�� �μ��̸�), �μ��̸��� ��ġ��ȣ�� ���Ͽ� ���
SELECT CONCAT(DEPARTMENT_ID, DEPARTMENT_NAME), CONCAT (DEPARTMENT_NAME,LOCATION_ID )
FROM DEPARTMENTS;
--4.EMPLOYEES ���̺��� �̸��� ù ���ڰ� 'K'���� ũ�� 'Y'���� ���� ����� ������ �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ���
SELECT EMPLOYEE_ID,  CONCAT (FIRST_NAME, LAST_NAME)AS NAME,SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 1, 1) >'K' AND SUBSTR(FIRST_NAME, 1, 1) <'Y'
ORDER BY FIRST_NAME;
--5.EMPLOYEES ���̺��� 20�� �μ� �� �̸��� ���� �� �޿��� �ڸ����� �����ȣ, �̸�, �̸��� �ڸ���, �޿�, �޿��� �ڸ����� ���
SELECT EMPLOYEE_ID,CONCAT (FIRST_NAME, LAST_NAME)AS NAME,LENGTH(FIRST_NAME),SALARY,
LENGTH (SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;
--6.EMPLOYEES ���̺��� �̸� �� 'E'�� ��ġ ���
SELECT FIRST_NAME,INSTR(FIRST_NAME,'e',1)
FROM EMPLOYEES;
--7.EMPLOYEES ���̺��� �μ���ȣ�� 80�� ����� �޿��� 30���� ���� �������� ���Ͽ� ���
SELECT FIRST_NAME, SALARY, MOD(SALARY,30)
FROM EMPLOYEES;

--8.EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ���(�� �ٹ� �ϼ��� ���� ��� ������ ���)
SELECT FIRST_NAME,HIRE_DATE,
TRUNC((SYSDATE-HIRE_DATE)/7) ||'��'||
TRUNC(MOD((SYSDATE - HIRE_DATE),7)) || '��' AS "�ٹ� ��/��"
FROM EMPLOYEES
ORDER BY HIRE_DATE;
--9. EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ���
SELECT FIRST_NAME, SALARY,
TO_CHAR(SALARY, '$999,999'), DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =50;






