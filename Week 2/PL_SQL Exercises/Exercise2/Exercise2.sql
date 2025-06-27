-- Exrercise 2 Error Handling

-- 1) Create CUSTOMER table (needed by AddNewCustomer)
CREATE TABLE customer (
  customer_id NUMBER        PRIMARY KEY,
  name        VARCHAR2(100),
  age         NUMBER,
  balance     NUMBER(12,2),
  isvip       VARCHAR2(5)   DEFAULT 'FALSE'
);

-- 2) Create ACCOUNT table (for SafeTransferFunds)
CREATE TABLE account (
  account_id NUMBER        PRIMARY KEY,
  balance    NUMBER(12,2)
);

-- 3) Create EMPLOYEE table (for UpdateSalary)
CREATE TABLE employee (
  employee_id NUMBER       PRIMARY KEY,
  name        VARCHAR2(100),
  salary      NUMBER(12,2)
);

-- 4) Insert sample data
-- Customers
INSERT INTO customer VALUES (1, 'Alice', 65,  8000, 'FALSE');
INSERT INTO customer VALUES (2, 'Bob',   59, 12000, 'FALSE');

INSERT INTO account VALUES (1001, 1000);
INSERT INTO account VALUES (1002,  200); 

INSERT INTO employee VALUES (201, 'Jane Doe', 40000);
INSERT INTO employee VALUES (202, 'John Roe', 35000);

COMMIT;
------------------------------------------------------------------------------------------------------------
-- Scenario 1: SafeTransferFunds

CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    from_acc_id IN NUMBER,
    to_acc_id   IN NUMBER,
    amount      IN NUMBER
)
IS
    curr_balance NUMBER;
BEGIN
    SELECT balance INTO curr_balance
    FROM account
    WHERE account_id = from_acc_id
    FOR UPDATE;

    IF curr_balance < amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds');
    END IF;

    UPDATE account
    SET balance = balance - amount
    WHERE account_id = from_acc_id;

    UPDATE account
    SET balance = balance + amount
    WHERE account_id = to_acc_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.put_line('Error in fund transfer: ' || SQLERRM);
END;
/

-- Scenario 2: UpdateSalary

CREATE OR REPLACE PROCEDURE UpdateSalary (
    emp_id  IN NUMBER,
    percent IN NUMBER
)
IS
BEGIN
    UPDATE employee
    SET salary = salary + (salary * percent/100)
    WHERE employee_id = emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee not found');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line('Error updating salary: ' || SQLERRM);
END;
/

-- Scenario 3: AddNewCustomer

CREATE OR REPLACE PROCEDURE AddNewCustomer (
    cust_id   IN NUMBER,
    cust_name IN VARCHAR2,
    cust_age  IN NUMBER
)
IS
BEGIN
    INSERT INTO customer (customer_id, name, age)
    VALUES (cust_id, cust_name, cust_age);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.put_line('Customer ID already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line('Error adding new customer: ' || SQLERRM);
END;
/

-- Test Cases
-- A) Safe transfer that succeeds
BEGIN
  SafeTransferFunds(1001, 1002, 500);
END;
/

-- A1) Safe transfer that fails (insufficient)
BEGIN
  SafeTransferFunds(1002, 1001, 500);
END;
/

-- B) Update existing employee salary
BEGIN
  UpdateSalary(201, 10);
END;
/

-- B1) Update non-existent employee
BEGIN
  UpdateSalary(999, 10);
END;
/

-- C) Add a new customer (ID 3 doesn't exist yet)
BEGIN
  AddNewCustomer(3, 'Carol', 30);
END;
/

-- C1) Attempt duplicate customer
BEGIN
  AddNewCustomer(1, 'Alice Duplicate', 65);
END;
/