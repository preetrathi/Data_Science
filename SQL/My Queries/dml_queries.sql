

-- ================== DML -- DATA MANIPULATION LANGUAGE --> HOW TO CHANGE DATA INSIDE YOUR TABLE


-- INSERT

/*
	TWO WAYS OF INSERTING DATA INTO SQL TABLE 
		1. INSERT COMMAND (MANNUALLY INSERTION)
			INSERT INTO table_name(column1, column2, column3,...) 
			VALUES(value1, value2, value3,...)
				  ,(value1, value2, value3,...)  multiple insertion	

			* Specifiy these columns is totally optional
			* if no column specified, SQL expect values for all the columns

			* Match the number of values and columns


		2. INSERTING USING SELECT
			Inserting data from anothor table. 
			source table -> target table

*/


SELECT * FROM SalesDB.Sales.CUSTOMERS

INSERT INTO SALES.CUSTOMERS (CustomerID, FirstName, LastName, Country, Score)
VALUES(6, 'Preet', 'Kumar', 'Pakistan', '999'),
	  (7, 'Anna', 'Bell', 'USA', NULL);


-- MATCHING DATA TYPES, COLUMN COUNTS AND CONSTRAINTS
-- YOU CAN NOT SKIP THE SKIP THE COLUMNS IF YOU ARE INSERTING THE VALUES FOR EVERY COLUMN

-- ***************************************************************************************************************************************

-- INSERTING USING SELECT

-- COPY DATA FROM CUSTOMER TABLE TO PERSONA


-- ***************************************************************************************************************************************

-- UPDATE
-- SYNTAX
/*
	UPDATE TABLE_NAME
	SET COLUMN1  = VALUE1,
		COLUMN2 = VALUE2
	WHERE <CONDITION>
*/

--  ALWAYS USE WHERE CLUASE WHERE UPDATING TABLE TO AVOID UPDATING ALL ROWS INTENTIONALLY

-- CHANGE THE SCORE OF CUSTOMER 6 TO 0

SELECT *
FROM Sales.Customers

UPDATE SALES.Customers
SET SCORE = 0
WHERE CustomerID = 6

-- CHANGE THE SOCRE OF ID 5 TO 0 AND UPDATE THE COUNTRY TO 'UK'

UPDATE Sales.Customers
SET Score = 0,
	Country = 'UK'
WHERE CustomerID = 5

-- ***************************************************************************************************************************************

-- DELETE

-- DELETE ALL CUSTOMER WHERE ID IS GREATER THEN 5

DELETE FROM Sales.Customers
WHERE CustomerID > 5


-- TRUNCATE IS FASTER THEN DELETE WHILE DELETING WHOLE DATA FROM TABLE
