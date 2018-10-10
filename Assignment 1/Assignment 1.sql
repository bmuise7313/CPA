CREATE TABLE Manager (
    managerID int UNIQUE,
    managerName varchar(25) NOT NULL,
    managerSalary float,
    managerOffice varchar(50)
);
CREATE TABLE Department (
    deptID int UNIQUE,
    deptName varchar(10)
);

CREATE TABLE Employee (
    employeeID int UNIQUE,
    employeeName varchar(25) NOT NULL,
    deptNumber int references Department(deptID),
	hourlyRate float,
	employeeOffice varchar(25)
);
CREATE TABLE Project (
    projectNum int UNIQUE,
    projectName varchar(25) NOT NULL,
    projectManager int References Manager(managerId),
    projectBudget float
);

CREATE TABLE employeeProject (
    employeeName varchar(25) ,
    projectName varchar(25) 
    );

INSERT INTO Employee VALUES (1, 'Alice', 1, 20.00, 'A Building, Room 201');
INSERT INTO Employee VALUES (2, 'Bob', 2, 25.00, 'A Building, Room 301');
INSERT INTO Employee VALUES (3, 'Carl', 1, 30.00, 'A Building, Room 302');
INSERT INTO Employee VALUES (4, 'Donna', 3, 15.00, 'C Building, Room 101');
INSERT INTO Employee VALUES (5, 'Earl', 1, 25.00, 'A Building, Room 202');
INSERT INTO Employee VALUES (6, 'Felicia', 3, 25.00, 'C Building, Room 102');
INSERT INTO Employee VALUES (7, 'Gary', 1, 30.00, 'A Building, Room 203');
INSERT INTO Employee VALUES (8, 'Hellen', 2, 20.00, 'A Building, Room 303');
INSERT INTO Employee VALUES (9, 'Ivan', 3, 20.00, 'C Building, Room 103');
INSERT INTO Employee VALUES (10, 'Jill', 2, 20.00, 'A Building, Room 304');
INSERT INTO Employee VALUES (11, 'Kevin', 2, 25.00, 'A Building, Room 305');
INSERT INTO Employee VALUES (12, 'Lenny', 1, 23.00, 'A Building, Room 204');

INSERT INTO Department VALUES (1, 'IT');
INSERT INTO Department VALUES (2, 'ENG');
INSERT INTO Department VALUES (3, 'FINANCE');

INSERT INTO Manager VALUES(1, 'Alan', 150000.00, 'A Building, Room 101');
INSERT INTO Manager VALUES(2, 'Betty', 120000.00, 'B Building, Room 110');
INSERT INTO Manager VALUES(3, 'Christine', 200000.00, 'B Building, Room 110');
INSERT INTO Manager VALUES(4, 'Dan', 200000.00, 'A Building, Room 102');
INSERT INTO Manager VALUES(5, 'Edward', 175000.00, 'B Building, Room 130');

INSERT INTO Project VALUES (1, 'Inventory System', 1, 5000000, NULL);
INSERT INTO Project VALUES (2, 'Client System', 2, 500000, NULL);
INSERT INTO Project VALUES (3, 'Financial System', 3, 1000000, NULL);
INSERT INTO Project VALUES (4, 'Delivery System', 1, 2000000, NULL);
INSERT INTO Project VALUES (5, 'Human Rescources System', 4, 750000, NULL);
INSERT INTO Project VALUES (6, 'R&D DB System', 5, 1000000, NULL);

INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=1), (SELECT projectName from Project WHERE projectNum=1),1);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=2), (SELECT projectName from Project WHERE projectNum=4),4);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=2), (SELECT projectName from Project WHERE projectNum=1),1);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=2), (SELECT projectName from Project WHERE projectNum=3),3);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=2), (SELECT projectName from Project WHERE projectNum=4),4);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=3), (SELECT projectName from Project WHERE projectNum=1),1);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=3), (SELECT projectName from Project WHERE projectNum=2),2);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=3), (SELECT projectName from Project WHERE projectNum=4),4);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=4), (SELECT projectName from Project WHERE projectNum=2),2);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=4), (SELECT projectName from Project WHERE projectNum=3),3);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=4), (SELECT projectName from Project WHERE projectNum=5),5);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=5), (SELECT projectName from Project WHERE projectNum=3),3);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=5), (SELECT projectName from Project WHERE projectNum=6),6);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=6), (SELECT projectName from Project WHERE projectNum=4),4);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=6), (SELECT projectName from Project WHERE projectNum=6),6);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=7), (SELECT projectName from Project WHERE projectNum=5),5);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=8), (SELECT projectName from Project WHERE projectNum=5),5);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=9), (SELECT projectName from Project WHERE projectNum=5),5);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=10), (SELECT projectName from Project WHERE projectNum=6),6);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=11), (SELECT projectName from Project WHERE projectNum=6),6);
INSERT INTO EmployeeProject VALUES ((SELECT employeeName from Employee WHERE EmployeeID=12), (SELECT projectName from Project WHERE projectNum=6),6);

DESCRIBE Department;

Name     Null Type         
-------- ---- ------------ 
DEPTID        NUMBER(38)   
DEPTNAME      VARCHAR2(10) 

DESCRIBE Employee;

Name           Null     Type         
-------------- -------- ------------ 
EMPLOYEEID              NUMBER(38)   
EMPLOYEENAME   NOT NULL VARCHAR2(25) 
DEPTNUMBER              NUMBER(38)   
HOURLYRATE              FLOAT(126)   
EMPLOYEEOFFICE          VARCHAR2(25) 

DESCRIBE employeeProject;

Name         Null Type         
------------ ---- ------------ 
EMPLOYEENAME      VARCHAR2(25) 
PROJECTNAME       VARCHAR2(25)

DESCRIBE Manager;

Name          Null     Type         
------------- -------- ------------ 
MANAGERID              NUMBER(38)   
MANAGERNAME   NOT NULL VARCHAR2(25) 
MANAGERSALARY          FLOAT(126)   
MANAGEROFFICE          VARCHAR2(50) 

DESCRIBE Project;

Name           Null     Type         
-------------- -------- ------------ 
PROJECTNUM              NUMBER(38)   
PROJECTNAME    NOT NULL VARCHAR2(25) 
PROJECTMANAGER          NUMBER(38)   
PROJECTBUDGET           FLOAT(126) 



Select * From Manager;

 MANAGERID MANAGERNAME                                         MANAGERSALARY
---------- ------------------------- ---------------------------------------
MANAGEROFFICE                                    
--------------------------------------------------
         1 Alan                                                       150000 
A Building, Room 101                              

         2 Betty                                                      120000 
B Building, Room 110                              

         3 Christine                                                  200000 
B Building, Room 110                              


 MANAGERID MANAGERNAME                                         MANAGERSALARY
---------- ------------------------- ---------------------------------------
MANAGEROFFICE                                    
--------------------------------------------------
         4 Dan                                                        200000 
A Building, Room 102                              

         5 Edward                                                     175000 
B Building, Room 130                              

Select * From Project;

PROJECTNUM PROJECTNAME                                        PROJECTMANAGER
---------- ------------------------- ---------------------------------------
                          PROJECTBUDGET
---------------------------------------
         1 Inventory System                                                1 
                                5000000

         2 Client System                                                   2 
                                 500000

         3 Financial System                                                3 
                                1000000


PROJECTNUM PROJECTNAME                                        PROJECTMANAGER
---------- ------------------------- ---------------------------------------
                          PROJECTBUDGET
---------------------------------------
         4 Delivery System                                                 1 
                                2000000

         5 Human Rescources System                                         4 
                                 750000

         6 R DB System                                                     5 
                                1000000
								
						
SELECT * FROM Employee;

EMPLOYEEID EMPLOYEENAME              DEPTNUMBER HOURLYRATE
---------- ------------------------- ---------- ----------
EMPLOYEEOFFICE          
-------------------------
         1 Alice                              1         20 
A Building, Room 201     

         2 Bob                                2         25 
A Building, Room 301     

         3 Carl                               1         30 
A Building, Room 302     


EMPLOYEEID EMPLOYEENAME              DEPTNUMBER HOURLYRATE
---------- ------------------------- ---------- ----------
EMPLOYEEOFFICE          
-------------------------
         4 Donna                              3         15 
C Building, Room 101     

         5 Earl                               1         25 
A Building, Room 202     

         6 Felicia                            3         25 
C Building, Room 102     


EMPLOYEEID EMPLOYEENAME              DEPTNUMBER HOURLYRATE
---------- ------------------------- ---------- ----------
EMPLOYEEOFFICE          
-------------------------
         7 Gary                               1         30 
A Building, Room 203     

         8 Hellen                             2         20 
A Building, Room 303     

         9 Ivan                               3         20 
C Building, Room 103     


EMPLOYEEID EMPLOYEENAME              DEPTNUMBER HOURLYRATE
---------- ------------------------- ---------- ----------
EMPLOYEEOFFICE          
-------------------------
        10 Jill                               2         20 
A Building, Room 304     

        11 Kevin                              2         25 
A Building, Room 305     

        12 Lenny                              1         23 
A Building, Room 204  

SELECT * FROM EmployeeProject;

EMPLOYEENAME              PROJECTNAME             
------------------------- -------------------------
Alice                     Inventory System         
Bob                       Delivery System          
Bob                       Inventory System         
Bob                       Financial System         
Bob                       Delivery System          
Carl                      Inventory System         
Carl                      Client System            
Carl                      Delivery System          
Donna                     Client System            
Donna                     Financial System         
Donna                     Human Rescources System  

EMPLOYEENAME              PROJECTNAME             
------------------------- -------------------------
Earl                      Financial System         
Earl                      R DB System              
Felicia                   Delivery System          
Felicia                   R DB System              
Gary                      Human Rescources System  
Hellen                    Human Rescources System  
Ivan                      Human Rescources System  
Jill                      R DB System              
Kevin                     R DB System              
Lenny                     R DB System 

SELECT * FROM Department;

    DEPTID DEPTNAME 
---------- ----------
         1 IT        
         2 ENG       
         3 FINANCE   
		 
		 
CREATE VIEW projectSize AS
SELECT projectName,projectManager , projectBudget,
(SELECT COUNT(employeeName) FROM EmployeeProject WHERE projectNum = projectID) AS totalCount
FROM Project
WHERE projectNum=1;

SELECT * FROM projectSize;

PROJECTNAME                                        PROJECTMANAGER
------------------------- ---------------------------------------
                          PROJECTBUDGET TOTALCOUNT
--------------------------------------- ----------
Inventory System                                                1 
                                5000000          3


SELECT EmployeeName as Employees_On_Financial FROM EmployeeProject WHERE ProjectName = 'Financial System';

EMPLOYEES_ON_FINANCIAL  
-------------------------
Bob                      
Donna                    
Earl    



