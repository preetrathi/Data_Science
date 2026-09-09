-- DDL Commands - Data Defination Language

-- CREATE ALTER DROP

-- ======= CREATE - Define Structure on Data

-- Create a new table called persons with columns:id, person_name, birth_date and phone
use SalesDB;
CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone_number VARCHAR(15) NOT NULL,
	-- for primary key
	CONSTRAINT pk_persons PRIMARY KEY (id)
)


SELECT * FROM PERSONS


-- **************************************************************************************************************************************

-- ALTER COMMAND

-- ADD A NEW COLUMN CALLED EMAIL TO THE PERSONS TABLE

ALTER TABLE [persons]
ADD [email] VARCHAR(150)

SELECT *
FROM [persons]

ALTER TABLE [persons]
ALTER COLUMN [email] VARCHAR(150) NOT NULL

-- REMOVE THE COLUMN phone_number FROM THE persons TABLE

ALTER TABLE [persons]
DROP COLUMN [phone_number]


-- **************************************************************************************************************************************

-- DROP

-- DELETE THE TABLE persons FROM THE DATABASE

DROP TABLE [persons]

