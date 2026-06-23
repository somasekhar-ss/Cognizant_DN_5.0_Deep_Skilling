SELECT * FROM savings_acc;

CREATE OR REPLACE PROCEDURE TransferFunds(
    fromAccId IN NUMBER,
    toAccId IN NUMBER,
    amount IN NUMBER
)
AS

    sourceBalance NUMBER;

BEGIN

    SELECT balance
    INTO sourceBalance
    FROM savings_acc
    WHERE accId = fromAccId;

    IF sourceBalance < amount THEN

        DBMS_OUTPUT.PUT_LINE(
            'Transfer Failed: Insufficient Balance'
        );

    ELSE

        UPDATE savings_acc
        SET balance = balance - amount
        WHERE accId = fromAccId;

        UPDATE savings_acc
        SET balance = balance + amount
        WHERE accId = toAccId;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE(
            'Transfer Successful'
        );

    END IF;

END;
/

BEGIN
   TransferFunds(2,4,5000);
END;
/

SELECT * FROM savings_acc;