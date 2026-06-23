CREATE TABLE employees (
    empID NUMBER PRIMARY KEY,
    empName VARCHAR2(50),
    department VARCHAR2(30),
    salary NUMBER
);

INSERT INTO employees VALUES (1,'Raj','IT',45000);
INSERT INTO employees VALUES (2,'Hemanth','HR',80000);
INSERT INTO employees VALUES (3,'Siddhu','IT',60000);
INSERT INTO employees VALUES (4,'JayaSai','Finance',45000);

COMMIT;

SELECT * FROM employees;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    deptName IN VARCHAR2,
    bonusPercent IN NUMBER
)
AS
BEGIN

   UPDATE employees
   SET salary =
       salary + (salary * bonusPercent / 100)
   WHERE department = deptName;

   COMMIT;

   DBMS_OUTPUT.PUT_LINE(
      'Bonus Updated Successfully'
   );

END;
/

BEGIN
   UpdateEmployeeBonus('IT',10);
END;
/

SELECT * FROM employees;