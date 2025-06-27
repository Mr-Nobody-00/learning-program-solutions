--Exercise 3 Stored Procedures

-- This script creates the necessary tables and stored procedures for the scenarios described in Exercise 3.
-- 1) Create ACCOUNT table (used by Scenario 1 & 3)
CREATE TABLE account (
  account_id NUMBER        PRIMARY KEY,
  balance    NUMBER(12,2)
);

-- 2) Create EMPLOYEE table (used by Scenario 2)
CREATE TABLE employee (
  employee_id NUMBER        PRIMARY KEY,
  name        VARCHAR2(100),
  department  VARCHAR2(30),
  salary      NUMBER(12,2)
);

INSERT INTO account (account_id, balance) VALUES (1001, 1000.00);
INSERT INTO account (account_id, balance) VALUES (1002,  500.00);
INSERT INTO account (account_id, balance) VALUES (1003, 2000.00);

INSERT INTO employee (employee_id, name, department, salary)
  VALUES (201, 'Alice Smith', 'Sales',    40000);
INSERT INTO employee (employee_id, name, department, salary)
  VALUES (202, 'Bob Jones',   'Engineering', 55000);
INSERT INTO employee (employee_id, name, department, salary)
  VALUES (203, 'Carol Lee',   'Sales',    45000);

COMMIT;

-------------------------------------------------------------------------------------------------------------

-- Scenario 1: ProcessMonthlyInterest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
  UPDATE account
     SET balance = balance + (balance * 1/100);
  COMMIT;
END;
/

-- Scenario 2: UpdateEmployeeBonus

-- assumes EMPLOYEE table has DEPARTMENT column of type VARCHAR2
ALTER TABLE employee ADD (department VARCHAR2(30));

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    dept_code     IN VARCHAR2,
    bonus_percent IN NUMBER
)
IS
BEGIN
  UPDATE employee
     SET salary = salary + (salary * bonus_percent/100)
   WHERE department = dept_code;
  COMMIT;
END;
/

-- Scenario 3: TransferFunds

CREATE OR REPLACE PROCEDURE TransferFunds (
    from_acc IN NUMBER,
    to_acc   IN NUMBER,
    amt      IN NUMBER
)
IS
    curr_balance NUMBER;
BEGIN
    SELECT balance
      INTO curr_balance
      FROM account
     WHERE account_id = from_acc
     FOR UPDATE;

    IF curr_balance < amt THEN
        RAISE_APPLICATION_ERROR(-20003, 'Insufficient funds');
    END IF;

    UPDATE account
       SET balance = balance - amt
     WHERE account_id = from_acc;

    UPDATE account
       SET balance = balance + amt
     WHERE account_id = to_acc;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.put_line('Error in transfer: ' || SQLERRM);
END;
/

--TestCases

-- A) Apply 1% monthly interest to all accounts
BEGIN
  ProcessMonthlyInterest;
END;
/
SELECT * FROM account;

-- B) Give Sales department a 10% bonus
BEGIN
  UpdateEmployeeBonus('Sales', 10);
END;
/
SELECT * FROM employee WHERE department = 'Sales';

-- C) Transfer 300 from account 1001 to 1002
BEGIN
  TransferFunds(1001, 1002, 300);
END;
/
SELECT * FROM account WHERE account_id IN (1001,1002);