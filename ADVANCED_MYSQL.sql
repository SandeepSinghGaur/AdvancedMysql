USE ADVANCEDDATABASE;

# CREATE WORKER TABLE
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
#PERFORM INSERT OPERATION INTO WORKER TABLE

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
# CREATE BONUS TABLE

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);        

#INSERT INTO BONUS TABLE

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
# CREATE TITLE TABLE 

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);        

#INSERT DATA INTO TITLE TABLE

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 # Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 #----------------------------------------------------------------------------------------------------
 Select FIRST_NAME AS WORKER_NAME from Worker;
 
 #Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 #-------------------------------------------------------------------------
 Select upper(FIRST_NAME) from Worker;
 
 #Write an SQL query to fetch unique values of DEPARTMENT from Worker table
 #--------------------------------------------------------------------------
 Select distinct DEPARTMENT from Worker;
 
 #Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
 #-------------------------------------------------------------------------------------------------------
 Select distinct length(DEPARTMENT) from Worker;
 
 # Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
 #----------------------------------------------------------------------------------------------------
 Select * from Worker order by FIRST_NAME asc;
 
 #Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
 #------------------------------------------------------------------------------------------------------------------------------
 Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc;
 
 # Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”
 #-------------------------------------------------------------------------------
 Select * from Worker where DEPARTMENT like 'Admin%';
 
 # Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 #------------------------------------------------------------------------------------------------
 Select * from Worker where SALARY between 100000 and 500000;
 
 #Write an SQL query to print details of the Workers who have joined in Feb’2014.
 #-------------------------------------------------------------------------------
 Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
 
 # Write an SQL query to fetch the count of employees working in the department ‘Admin’.
 #------------------------------------------------------------------------------------
 SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin';
 
 #Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
 #------------------------------------------------------------------------------
 SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

# Write an SQL query to fetch the no. of workers for each department in the descending order.
#--------------------------------------------------------------------------------------------
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

# Write an SQL query to print details of the Workers who are also Managers.
#--------------------------------------------------------------------------
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

#Write an SQL query to fetch duplicate records having matching data in some fields of a table.
#---------------------------------------------------------------------------------------------
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

# Write an SQL query to show the current date and time.
#-------------------------------------------------------
SELECT CURDATE();
SELECT NOW();
SELECT getdate();
SELECT SYSDATE FROM DUAL;

#PERFORM JOIN OPERATION
#CREATE CUSTOMER TABLE
#---------------------
CREATE TABLE CUSTOMER( CID INT, NAME VARCHAR(20),AGE INT, CITY VARCHAR(20), STATE VARCHAR(20),PRIMARY KEY(CID));
#CREATE RESERVE TABLE
#--------------------
CREATE TABLE RESERVE(CID INT,TITLE VARCHAR(20),R_DATE VARCHAR(20),FOREIGN KEY(CID) REFERENCES CUSTOMER(CID));
#INSERT INTO CUSTOER TABLE
#-------------------------
INSERT INTO CUSTOMER VALUES
(1,'JAY',27,'INDORE','MP'),
(2,'BABU',23,'KANPUR','UP'),
(3,'SANDEEP',23,'MAHOBA','UP'),
(4,'AMIT',25,'JHANSI','UP');

DESCRIBE CUSTOMER;

# INSERT INTO RESERVE TABLE
#-------------------------
INSERT INTO RESERVE VALUES
(1,'SLEEPER','18/03/2021'),
(1,'1ST AC','19/03/2021'),
(2,'SLEEPER','19/03/2021'),
(2,'2ND AC','20/03/2021'),
(2,'SLEEPER','20/03/2021'),
(2,'3RD AC','20/03/2021'),
(4,'SLEEPER','21/03/2021'),
(4,'RAC','21/03/2021');

#PERFORM INNER JOIN

SELECT * FROM CUSTOMER C JOIN RESERVE R USING(CID);
#--------------------------------------------------
SELECT DISTINCT TITLE FROM CUSTOMER C, RESERVE R WHERE C.CID=R.CID AND C.CITY='KANPUR';
#---------------------------------------------------------------------------------------
SELECT * FROM CUSTOMER C LEFT OUTER JOIN RESERVE R ON C.CID=R.CID;
#-----------------------------------------------------------------
SELECT * FROM CUSTOMER C right OUTER JOIN RESERVE R ON C.CID=R.CID;
#------------------------------------------------------------------
# WHAT IS STORED PROCEDURE..?
# A STORED PROCEDURE IS A SEGMENT OF DECLARATIVE OF SQL STATEMENT STORED INSIDE THE DATABASE CATALOG
# STORED PROCEDURE INCREASE PERFORMANCE ,REDUCE NETWORK TRAFFIC,PROVIDE CODE REUSABILITY AND SECURITY

#-----------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE FIND_WORKER_TABLE()
BEGIN
SELECT * FROM WORKER;
END //
DELIMITER ;
CALL FIND_WORKER_TABLE();
#-----------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE INCREMENT_VALUE(IN a INTEGER)
BEGIN
SET a=a+10;
END //
DELIMITER ;
SET @a=2;
CALL INCREMENT_VALUE(@a);
SELECT @a;
#------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE INCREMENT_VALUE(OUT B INTEGER)
BEGIN
SET B=B+10;
END //
DELIMITER ;
SET @B=5;
CALL INSERT_VALUE1(@B);
SELECT @B;
#------------------------------------------------------------------------------------------------------------------
# CREATE STORED PROCEDURE TO FIND NUMBER EVEN OR ODD

DELIMITER //
CREATE PROCEDURE ODD_OR_EVEN( IN NUM INTEGER)
BEGIN
     IF NUM%2=0 THEN
        SELECT 'THE NUMBER IS EVEN';
        ELSE
           SELECT 'THE NUMBER IS ODD';
      END IF;
 END //     
 DELIMITER ;
 CALL ODD_OR_EVEN(10);
 CALL ODD_OR_EVEN(13);
#---------------------------------------------------------------------------------------------------------------------------
# CREATE A STORED PROCEDURE TO FIND NUMBER IS PRIME OR COMPOSITE

DELIMITER //
CREATE PROCEDURE IS_PRIME( IN NUM INTEGER)
BEGIN
     DECLARE COUNT INTEGER;
     DECLARE NUM1 INTEGER;
     SET  NUM1=2;
     SET COUNT=0;
     WHILE NUM1<NUM/2 DO
        IF NUM%NUM1=0 THEN
            SET COUNT=COUNT+1;
	   END IF;
         SET NUM1=NUM1+1;
      END WHILE;
      IF COUNT=0 THEN
      SELECT 'THE NUMBER IS PRIME';
      ELSE
         SELECT 'THE NUMBER IS COMPOSITE';
     END IF;
 END //   
 DELIMITER ;
 CALL IS_PRIME(10);
 CALL IS_PRIME(13);
 #-------------------------------------------------------------------------------------------------------------
 # STORED PROCEDURE TO FIND THE COUNT OF WORKER IN PERTICULAR TITLE PASSED AS AN ARGUMENT
 
 DELIMITER //
 CREATE PROCEDURE COUNT_WORKER(IN V_TITLE VARCHAR(100))
 BEGIN 
    DECLARE VAR INTEGER;
    SELECT COUNT(*) INTO VAR FROM WORKER WHERE WORKER_ID=( SELECT WORKER_REF_ID FROM TITLE WHERE WORKER_TITLE=@V_TITLE);
    SELECT V_TITLE;
END // 
DELIMITER ;
CALL COUNT_WORKER('MANAGER');   
CALL COUNT_WORKER('ASST. MANAGER');
#-------------------------------------------------------------------------------------------------------------------------
# BY USING TRY-CATCH BLOCK PERFORM STORED PROCEDURE

Delimiter //
 Create Procedure Insert_WORKER(WORKER_ID INT,FIRST_NAME Varchar(20), LAST_NAME Varchar(20),OUT got_error INT)
   BEGIN
    DECLARE EXIT HANDLER FOR 1062 SET got_error=1;
    INSERT INTO WORKER
    (WORKER_ID, FIRST_NAME, LAST_NAME)
    Values(WORKER_ID, FIRST_NAME, LAST_NAME);
    Select * from WORKER;
END //
DELIMITER ;
 CALL Insert_WORKER(104,'Ram','SINGH',@got_error);
 SELECT @got_error;
#----------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE my_procedure(IN search_var VARCHAR(255))

BEGIN
DECLARE exit handler for SQLEXCEPTION
 BEGIN
  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
  SELECT @full_error;
 END;
SELECT * FROM WORKER WHERE id = search_var;
END //
delimiter ;
call my_procedure('1234');
CALL MY_PROCEDURE('001');
#-------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE Divide(IN numerator INT, IN denominator INT, OUT result double)
BEGIN
	DECLARE division_by_zero CONDITION FOR SQLSTATE '22012';

	DECLARE CONTINUE HANDLER FOR division_by_zero 
	RESIGNAL SET MESSAGE_TEXT = 'Division by zero / Denominator cannot be zero';
	-- 
	IF denominator = 0 THEN
		SIGNAL division_by_zero;
	ELSE
		SET result := numerator / denominator;
	END IF;
END //
DELIMITER ;
CALL Divide(10,0,@result);
#----------------------------------------------------------------------------------------------------------------------
#MySQL handler example in stored procedures
CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);
DELIMITER //
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
 	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;    
END //
DELIMITER ;
CALL InsertSupplierProduct(1,1);
CALL InsertSupplierProduct(1,2);
CALL InsertSupplierProduct(1,3);
CALL InsertSupplierProduct(1,3);
#--------------------------------------------------------------------------------------------------------------------


DELIMITER $$

CREATE PROCEDURE InsertSupplierProduct1(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062 SELECT 'Duplicate keys error encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT 'SQLSTATE 23000' ErrorCode;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts1(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts1
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;
CALL InsertSupplierProduct1(1,3);
#------------------------------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE TestProc()
BEGIN
    DECLARE TableNotFound CONDITION for 1146 ; 

    DECLARE EXIT HANDLER FOR TableNotFound 
	SELECT 'Please create table abc first' Message; 
    SELECT * FROM abc;
END$$

DELIMITER ;
CALL TestProc();
#---------------------------------------------------------------------------------------------------------------
CREATE TABLE t (s1 INT, PRIMARY KEY (s1));
delimiter //
CREATE PROCEDURE handlerdemo ()
       BEGIN
         DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @x2 = 1;
         SET @x = 1;
         INSERT INTO t VALUES (1);
         SET @x = 2;
         INSERT INTO t VALUES (1);
         SET @x = 3;
       END;
       //
       DELIMITER ;
CALL handlerdemo();
#------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE p ()
BEGIN
  DECLARE i INT DEFAULT 3;
  retry:
    REPEAT
      BEGIN
        DECLARE CONTINUE HANDLER FOR SQLWARNING
          BEGIN
            ITERATE retry;    # illegal
          END;
        IF i < 0 THEN
          LEAVE retry;        # legal
        END IF;
        SET i = i - 1;
      END;
    UNTIL FALSE END REPEAT;
END //
DELIMITER ;
CALL p();
#---------------------------------------------------------------------------------------------------
delimiter //
CREATE PROCEDURE do_insert(value INT)
BEGIN
  -- Declare variables to hold diagnostics area information
  DECLARE code CHAR(5) DEFAULT '00000';
  DECLARE msg TEXT;
  DECLARE nrows INT;
  DECLARE result TEXT;
  -- Declare exception handler for failed insert
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
      GET DIAGNOSTICS CONDITION 1
        code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
    END;

  -- Perform the insert
  INSERT INTO t1 (int_col) VALUES(value);
  -- Check whether the insert was successful
  IF code = '00000' THEN
    GET DIAGNOSTICS nrows = ROW_COUNT;
    SET result = CONCAT('insert succeeded, row count = ',nrows);
  ELSE
    SET result = CONCAT('insert failed, error = ',code,', message = ',msg);
  END IF;
  -- Say what happened
  SELECT result;
END //
delimiter ;
CALL do_insert(1);
CALL do_insert(NULL);
#------------------------------------------------------------------------------------------------------------------------
delimiter //
CREATE PROCEDURE pp ()
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    -- Declare variables to hold diagnostics area information
    DECLARE errcount INT;
    DECLARE errno INT;
    DECLARE msg TEXT;
    GET CURRENT DIAGNOSTICS CONDITION 1
      errno = MYSQL_ERRNO, msg = MESSAGE_TEXT;
    SELECT 'current DA before mapped insert' AS op, errno, msg;
    GET STACKED DIAGNOSTICS CONDITION 1
      errno = MYSQL_ERRNO, msg = MESSAGE_TEXT;
    SELECT 'stacked DA before mapped insert' AS op, errno, msg;
    end ;
    end //
    delimiter ;
    call pp();
#---------------------------------------------------------------------------------------------------------------------   
# What is Trigger ?
# A trigger is a set of sql statements stored in database catalog which are executed of fired when some event assosicated
#with table occures
#trigger are special kind of stored procedure that are executed automatically on firing of some event
#------------------------------------------------------------------------------------------------------------------------

create table employee(eid int primary key,ename varchar(20),deptid int,mgrid int);
insert into employee values
(1,'nikhil',10,null),
(2,'nitin',30,1),
(3,'neha',10,2);
select * from employee;
create table trig_logs(logs varchar(200));

delimiter //
create trigger trig_emp after insert
on employee
for each row 
begin
   insert into trig_logs values('a new row in employee table has been inserted');
 end // 
 delimiter ;
 insert into employee values(4,'sandeep',10,2);
 #---------------------------------------------------------------------------------------------------------------------
 delimiter //
 create trigger trig_emp1_update after update
 on employee
 for each row
 begin
    insert into trig_logs values('a new row in employee table has been updated');
end //
delimiter ;
update employee set ename='krishna'where ename='neha';
select * from trig_logs;
select * from employee;
update employee set deptid=30 where deptid=10;
#---------------------------------------------------------------------------------------------------------------------------
delimiter //
create trigger trig_emp_insert after insert
on employee
for each row
begin
    insert into trig_logs values(concat("i have inserted an employeewith name",NEW.ename));
 end //   
delimiter ;
insert into employee values(6,'madhava',10,1);
select * from trig_logs;
insert into employee values(7,'madhusudhan',7,5);
select * from trig_logs;
#-------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE AUDIT_EMPLOYEE(OPERATION VARCHAR(20),TIMEOPS DATETIME,VOLD VARCHAR(200),VNEW VARCHAR(200));
DELIMITER //
CREATE TRIGGER INSERT_EMP1 AFTER INSERT ON employee
for each row
begin
   insert into audit_employee values('insert',curdate(),null,concat(NEW.ename,'-',NEW.deptid));
end //  
delimiter ;
insert into employee values(9,'samyak',10,52);
select * from employee;
select * from audit_employee;
#--------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER update_EMP1 AFTER update ON employee
for each row
begin
   insert into audit_employee values('update',curdate(),null,concat(OLD.ename,'-',OLD.deptid),concat(NEW.ename,'-',NEW.deptid));
end //
delimiter ;
select * from employee;
update employee set ename='vaibhav',deptid=25 where eid=3;
select * from audit_employee;
#-------------------------------------------------------------------------------------------------------------------------------------------
# WHAT IS CURSOR...?
#Cursor alows to interate a set of rows returned by a query and process them accordingly.We create a cursor inside the stored procedure
#To handle the result set returned by a query
# MySql cursors are read-only and non-scrollable
#follow four step in cursor==>1-:declare cursor 2-:open the cursor 3-:fetch the cursor 4-:close the cursor
#-------------------------------------------------------------------------------------------------------------------------------------------
delimiter //
create procedure process_cursor()
begin
    declare v_name varchar(100);
    declare v_salary int;
    declare v_finished integer default 0;
    declare c1 cursor for select FIRST_NAME,SALARY FROM WORKER;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET V_FINISHED=1;
    OPEN c1;
    GET_EMP:LOOP
        FETCH c1 INTO V_NAME,V_SALARY;
        IF V_FINISHED=1 THEN 
           LEAVE GET_EMP;
        END IF;
        SELECT CONCAT(V_NAME,V_SALARY);
    END LOOP GET_EMP;
    CLOSE C1;
END //
DELIMITER ;
CALL PROCESS_CURSOR();

