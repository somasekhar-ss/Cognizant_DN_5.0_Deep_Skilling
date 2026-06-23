-->create savings account table
CREATE TABLE savings_acc (
    accId NUMBER PRIMARY KEY,
    customerID NUMBER,
    balance NUMBER
);
-->Insert data into the savings account table
INSERT INTO savings_acc VALUES (1, 101, 16000);
INSERT INTO savings_acc VALUES (2, 102, 22922);
INSERT INTO savings_acc VALUES (3, 103, 29392.29);
INSERT INTO savings_acc VALUES (4, 104, 51000);

COMMIT;

SELECT * FROM savings_acc;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN

   FOR acc IN (
      SELECT accId, balance
      FROM savings_acc
   )
   LOOP

      UPDATE savings_acc
      SET balance = acc.balance + (acc.balance * 0.01)
      WHERE accId = acc.accId;

   END LOOP;

   COMMIT;

   DBMS_OUTPUT.PUT_LINE(
      'Monthly Interest Updated Successfully'
   );

END;
/

BEGIN
   ProcessMonthlyInterest;
END;
/

SELECT * FROM savings_acc;