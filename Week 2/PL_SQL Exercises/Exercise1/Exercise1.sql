-- Exercise 1 Control Structures

-- For the creation of the database schema:

-- 1) Create CUSTOMER table
CREATE TABLE customer (
  customer_id   NUMBER        PRIMARY KEY,
  name          VARCHAR2(100),
  age           NUMBER,
  balance       NUMBER(12,2),
  isvip         VARCHAR2(5)   DEFAULT 'FALSE'
);

-- 2) Create LOAN table
CREATE TABLE loan (
  loan_id       NUMBER        PRIMARY KEY,
  customer_id   NUMBER        NOT NULL,
  interest_rate NUMBER(5,2),
  due_date      DATE,
  CONSTRAINT fk_loan_cust FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);

-- 3) Insert sample customers
INSERT INTO customer (customer_id, name, age, balance) VALUES (1, 'Alice', 65,  8000);
INSERT INTO customer (customer_id, name, age, balance) VALUES (2, 'Bob',   59, 12000);
INSERT INTO customer (customer_id, name, age, balance) VALUES (3, 'Carol', 72, 15000);
COMMIT;

-- 4) Insert sample loans
INSERT INTO loan (loan_id, customer_id, interest_rate, due_date)
  VALUES (101, 1,  8.50, SYSDATE + 10);
INSERT INTO loan (loan_id, customer_id, interest_rate, due_date)
  VALUES (102, 2,  9.00, SYSDATE + 40);
INSERT INTO loan (loan_id, customer_id, interest_rate, due_date)
  VALUES (103, 3, 10.00, SYSDATE + 20);
COMMIT;


-- Scenario 1: Discount on loan interest rates for senior citizens
BEGIN
    FOR rec IN (
        SELECT loan_id, interest_rate
        FROM loan l
        JOIN customer c ON l.customer_id = c.customer_id
        WHERE c.age > 60
    )
    LOOP
        UPDATE loan
        SET interest_rate = rec.interest_rate - 1
        WHERE loan_id = rec.loan_id;
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.put_line('Discount applied to senior citizens loans.');
END;
/

-- Output:
Discount applied to senior citizens loans.


-- Scenario 2: Promote VIP status for high-balance customers
BEGIN
    FOR rec IN (
        SELECT customer_id
        FROM customer
        WHERE balance > 10000
    )
    LOOP
        UPDATE customer
        SET IsVIP = 'TRUE'
        WHERE customer_id = rec.customer_id;
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.put_line('VIP status updated for eligible customers.');
END;
/

-- output:
VIP status updated for eligible customers.


-- Scenario 3: Loan due reminders for next 30 days
BEGIN
    FOR rec IN (
        SELECT loan_id, customer_id, due_date
        FROM loan
        WHERE due_date BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.put_line('Reminder: Loan ID ' || rec.loan_id ||
                             ' for Customer ID ' || rec.customer_id ||
                             ' is due on ' || TO_CHAR(rec.due_date, 'DD-MON-YYYY'));
    END LOOP;
END;
/

-- Output:
Reminder: Loan ID 101 for Customer ID 1 is due on 15-JUL-2025
Reminder: Loan ID 103 for Customer ID 3 is due on 20-JUL-2025