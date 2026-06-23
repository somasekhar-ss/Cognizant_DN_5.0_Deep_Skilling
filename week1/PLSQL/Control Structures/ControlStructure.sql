--1: Storing Customer Information
CREATE TABLE customers (
    customerid NUMBER PRIMARY KEY,
    name       VARCHAR2(50),
    age        NUMBER,
    balance    NUMBER,
    isvip      VARCHAR2(5)
);

-- Box 2: Storing Loan Information
CREATE TABLE loans (
    loanid       NUMBER PRIMARY KEY,
    customerid   NUMBER,
    interestrate NUMBER,
    duedate      DATE
);

-- Adding Customers
INSERT INTO customers VALUES (1, 'Soma Sekhar', 21, 15000, 'FALSE');
INSERT INTO customers VALUES (2, 'Manobhi', 20, 111000,  'FALSE');
INSERT INTO customers VALUES (3, 'harsha', 70, 225000, 'FALSE');

-- Adding Loans for each customer (sysdate means "today")
INSERT INTO loans VALUES (101, 1, 4, SYSDATE + 20); -- Due in 20 days
INSERT INTO loans VALUES (102, 2, 12, SYSDATE + 40); -- Due in 40 days
INSERT INTO loans VALUES (103, 3, 9,  SYSDATE + 15); -- Due in 15 days

-- Save our work permanently
COMMIT;

select * from customers;
select * from loans;

-- Scenario 1: Loop through every customer older than 60 and update their loan interest rate by -1

SET SERVEROUTPUT ON;

BEGIN
   -- 1. Loop through every customer older than 60
   FOR cust IN (
      SELECT customerid 
        FROM customers 
       WHERE age > 60
   ) LOOP
      
      -- 2. Update their loan interest rate
      UPDATE loans
         SET interestrate = interestrate - 1
       WHERE customerid = cust.customerid;

   END LOOP;

   -- 3. Print a success message
   DBMS_OUTPUT.PUT_LINE('Discount Applied Successfully');
END;
/

-- Check the result
SELECT * FROM loans;

-- Scenario 2: Loop through every customer with a balance greater than 10,000 and change their VIPstatus to TRUE

BEGIN
   -- 1. Loop through customers with a balance greater than 10,000
   FOR cust IN (
      SELECT customerid 
        FROM customers 
       WHERE balance > 10000
   ) LOOP
      
      -- 2. Change their status to TRUE
      UPDATE customers
         SET isvip = 'TRUE'
       WHERE customerid = cust.customerid;

   END LOOP;

   -- 3. Print a success message
   DBMS_OUTPUT.PUT_LINE('VIP Status Updated');
END;
/

-- Check the result
SELECT * FROM customers;

-- Scenario 3: Loop through all customers and print reminders for loans due within 30 days

BEGIN
   -- 1. Combine both tables and look for loans due within 30 days
   FOR loan_rec IN (
      SELECT c.name, 
             l.duedate
        FROM customers c
        JOIN loans l ON c.customerid = l.customerid
       WHERE l.duedate BETWEEN SYSDATE AND SYSDATE + 30
   ) LOOP
      
      -- 2. Print a nice reminder message for them
      DBMS_OUTPUT.PUT_LINE('Reminder: ' || loan_rec.name || ' Loan Due on ' || loan_rec.duedate);
      
   END LOOP;
END;
/


