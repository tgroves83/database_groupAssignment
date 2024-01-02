DROP TABLE BOOKAUTHOR;
DROP TABLE AUTHOR;
DROP TABLE PRODUCTINVOICE;
DROP TABLE INVOICE;
DROP TABLE BOOK;
DROP TABLE EMPLOYEE;
DROP TABLE POSITION;
DROP TABLE CUSTOMER;
DROP TABLE SALESREP;


CREATE TABLE SALESREP(
salesRepNum int not NULL,
salesRepFName varchar(50) not NULL,
salesRepLName varchar(50) not NULL,
constraint pk_SALESREP_salesRepNum primary key (salesRepNum)
);

CREATE TABLE CUSTOMER(
custNum int not NULL,
salesRepNum int,
custName varchar(50)not NULL,
address varchar(50),
constraint pk_CUSTOMER_custNum primary key(custNum),
constraint fk_CUSTOMER_salesRepNum foreign key(salesRepNum) references SALESREP(salesRepNum),
constraint CUSTOMER_unique UNIQUE (custName)
);
    
CREATE TABLE INVOICE(
    invoiceNum NUMBER not NULL PRIMARY KEY,
    invoiceDate DATE,
    customerNum NUMBER(5)not NULL,
    CONSTRAINT fk_custNum FOREIGN KEY (customerNum) REFERENCES CUSTOMER(custNum)
);

CREATE TABLE BOOK(
bookId NUMBER,
bookName VARCHAR(50),
bookEdition VARCHAR(30),
bookCost NUMBER(5,2),
bookRetailPrice NUMBER(5,2) NOT NULL,
CONSTRAINT pk_book PRIMARY KEY(bookId) 
);

CREATE TABLE PRODUCTINVOICE(
    invoiceNum NUMBER not NULL,
    bookID NUMBER not NULL,
    quantity NUMBER,
    CONSTRAINT PK_productinvoice PRIMARY KEY (invoiceNum, bookID),
    CONSTRAINT fk_invoiceNum FOREIGN KEY (invoiceNum) REFERENCES invoice(invoiceNum),
    CONSTRAINT fk_productID FOREIGN KEY (bookID) REFERENCES book(bookID)
);

CREATE TABLE POSITION(
pos_ID int not NULL,
emp_Position varchar(50),
constraint pk_POSITION_pos_ID primary key (pos_ID)
);

CREATE TABLE EMPLOYEE(
emp_ID int not NULL,
emp_FName varchar(50) not NULL,
emp_LName varchar(50) not NULL,
emp_SIN varchar(11) not NULL UNIQUE,
hire_date DATE not NULL,
supervisor varchar(50),
pos_ID int,
constraint pk_EMPLOYEE_emp_ID primary key (emp_ID),
CONSTRAINT fk_posID FOREIGN KEY (pos_ID) REFERENCES position(pos_ID)
); 

CREATE TABLE AUTHOR(
authorId NUMBER,
authorFName VARCHAR(20),
authorLName VARCHAR(20),
CONSTRAINT pk_author PRIMARY KEY(authorId)
);

CREATE TABLE BOOKAUTHOR(
bookId NUMBER,
authorId NUMBER,
CONSTRAINT pk_bookAuthor PRIMARY KEY (bookId, authorId),
CONSTRAINT fk_book FOREIGN KEY (bookId) REFERENCES Book(bookId),
CONSTRAINT fk_author FOREIGN KEY (authorId) REFERENCES Author(authorId)
);

INSERT INTO SALESREP (salesRepNum, salesRepFName, salesRepLName) 
    VALUES (1, 'ANDRE', 'MARTIN');
INSERT INTO SALESREP (salesRepNum, salesRepFName, salesRepLName)
    VALUES (2, 'PARVEZ', 'RAI');
INSERT INTO SALESREP (salesRepNum, salesRepFName, salesRepLName)
    VALUES (3, 'TIFFANY', 'GROVES');
INSERT INTO SALESREP (salesRepNum, salesRepFName, salesRepLName)
    VALUES (4, 'HAMMED', 'SANNI');
INSERT INTO SALESREP (salesRepNum, salesRepFName, salesRepLName)
    VALUES (5, 'CHRISTOPHER', 'PURSER');
    
    INSERT INTO CUSTOMER (custNum, salesRepNum, custName, address) 
    VALUES (54, 2, 'SENECA COLLEGE', 'NORTH YORK');
INSERT INTO CUSTOMER (custNum, salesRepNum, custName, address)
    VALUES (74, 2, 'RYERSON', 'TORONTO');
INSERT INTO CUSTOMER (custNum, salesRepNum, custName, address)
    VALUES (43, 1, 'INDIGO BOOKS', 'TORONTO');
INSERT INTO CUSTOMER (custNum, salesRepNum, custName, address)
    VALUES (78, 1, 'YORK UNIVERSITY', 'NORTH YORK');
INSERT INTO CUSTOMER (custNum, salesRepNum, custName, address)
    VALUES (99, 5, 'GRETZKY WINE', 'NIAGARA');
INSERT INTO CUSTOMER (custNum, salesRepNum, custName, address)
    VALUES (3, NULL, 'Chateau deCharmes', 'NIAGARA ESCARPTMENT');
    
    INSERT INTO INVOICE (invoiceNum, invoiceDate, customerNum)
    VALUES (1, '2002-05-07', 78);
INSERT INTO INVOICE (invoiceNum, invoiceDate, customerNum)
    VALUES (2, '2002-05-07', 54);
INSERT INTO INVOICE (invoiceNum, invoiceDate, customerNum)
    VALUES (3, '2002-05-07', 54);
INSERT INTO INVOICE (invoiceNum, invoiceDate, customerNum)
    VALUES (4, '2002-05-08', 78);
INSERT INTO INVOICE (invoiceNum, invoiceDate, customerNum)
    VALUES (5, '2002-05-08', 54);
INSERT INTO INVOICE (invoiceNum, invoiceDate, customerNum)
    VALUES (6, '2002-05-09', 3);
    
INSERT INTO BOOK(bookId, bookName, bookEdition, bookCost, bookRetailPrice)
    VALUES(100860,'DATABASE SYSTEMS: DESIGN AND IMPLEMENTATION', 'THIRD EDITION', 84.98, 99.98);
INSERT INTO BOOK(bookId, bookName, bookEdition, bookCost, bookRetailPrice)
    VALUES(100861,'DATABASE SYSTEMS: DESIGN AND IMPLEMENTATION', 'FOURTH EDITION', 92.82, 109.20);
INSERT INTO BOOK(bookId, bookName, bookEdition, bookCost, bookRetailPrice)
    VALUES(100871,'MODERN RETAILING', 'FOURTH EDITION', 88.36, 110.45);
INSERT INTO BOOK(bookId, bookName, bookEdition, bookCost, bookRetailPrice)
    VALUES(100890,'UNDERSTANDING MICROSOFT ACCESS', 'NINTH EDITION', 65.52, 72.80);
INSERT INTO BOOK(bookId, bookName, bookEdition, bookCost, bookRetailPrice)
    VALUES(102130,'ORACLE: INTRODUCTION TO PL/SQL', NULL, 53.24, 59.15);
INSERT INTO BOOK(bookId, bookName, bookEdition, bookCost, bookRetailPrice)
    VALUES(123456,'WINE IS COOL', NULL, 16.58, 95.62);
    
    INSERT INTO PRODUCTINVOICE (invoiceNum, bookID, quantity)
    VALUES (1, 100861, 2);
INSERT INTO PRODUCTINVOICE (invoiceNum, bookID, quantity)
    VALUES (1, 100890, 3);
INSERT INTO PRODUCTINVOICE (invoiceNum, bookID, quantity)
    VALUES (1, 102130, 5);
INSERT INTO PRODUCTINVOICE (invoiceNum, bookID, quantity)
    VALUES (2, 102130, 2);
INSERT INTO PRODUCTINVOICE (invoiceNum, bookID, quantity)
    VALUES (2, 100860, 2);
    
    INSERT INTO POSITION (pos_ID, emp_Position) 
    VALUES (1, 'MANAGER');
INSERT INTO POSITION (pos_ID, emp_Position)
    VALUES (2, 'SALES');
INSERT INTO POSITION (pos_ID, emp_Position)
    VALUES (3, 'CLERK');
INSERT INTO POSITION (pos_ID, emp_Position)
    VALUES (4, 'IT');
INSERT INTO POSITION (pos_ID, emp_Position)
    VALUES (5, 'JANITOR');
    
    INSERT INTO EMPLOYEE (emp_ID, emp_FName, emp_LName, emp_SIN, hire_date, supervisor, pos_ID) 
    VALUES (7839, 'JOHN', 'CHIU', '123-234-345', '1999-11-13', NULL, 1);
INSERT INTO EMPLOYEE (emp_ID, emp_FName, emp_LName, emp_SIN, hire_date, supervisor, pos_ID)
    VALUES (7654, 'ANDRE', 'MARTIN', '678-345-123', '1999-09-24', 'JOHN CHIU', 2);
INSERT INTO EMPLOYEE (emp_ID, emp_FName, emp_LName, emp_SIN, hire_date, supervisor, pos_ID)
    VALUES (7434, 'PARVEZ', 'RAI', '234-123-432', '1980-06-24', 'JOHN CHIU', 2);
INSERT INTO EMPLOYEE (emp_ID, emp_FName, emp_LName, emp_SIN, hire_date, supervisor, pos_ID)
    VALUES (7435, 'DANIEL', 'CHOY', '345-312-234', '1998-08-04', NULL, 3);
INSERT INTO EMPLOYEE (emp_ID, emp_FName, emp_LName, emp_SIN, hire_date, supervisor, pos_ID)
    VALUES (7436, 'TOM', 'ATOES', '465-885-946', '2011-03-17', NULL, 4);

INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(001, 'Carlos', 'Coronel');
INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(002, 'Peter', 'Rob');
INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(003, 'Daniel', 'Caston');
INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(004, 'Jenny', 'Tapscott');
INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(005, 'Pierre', 'Lebland');
INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(006, 'Robert', 'Cobb');
INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(007, 'Philip', 'Robb');
INSERT INTO AUTHOR(authorId, authorFName, authorLName)
    VALUES(008, 'Dan', 'Chen');

INSERT INTO BOOKAUTHOR(bookId, authorId)
    VALUES(100860, 001);
INSERT INTO BOOKAUTHOR(bookId, authorId)
    VALUES(100860, 002);
INSERT INTO BOOKAUTHOR(bookId, authorId)
    VALUES(100861, 001);
INSERT INTO BOOKAUTHOR(bookId, authorId)
    VALUES(100861, 002);
INSERT INTO BOOKAUTHOR(bookId, authorId)
    VALUES(100871, 003);
INSERT INTO BOOKAUTHOR(bookId, authorId)
    VALUES(100871, 004);
INSERT INTO BOOKAUTHOR(bookId, authorId)
    VALUES(102130, 007);

UPDATE BOOK
SET bookCost = 85.69
WHERE bookid = 100860;

UPDATE AUTHOR
SET authorLName = 'Coronnel'
WHERE authorId = 001;

DELETE FROM BOOKAUTHOR
WHERE bookId = 102130;

UPDATE BOOKAUTHOR
SET bookID = 100890
WHERE AuthorID = 4;

DELETE FROM BOOK
WHERE bookId = 123456;

DELETE FROM AUTHOR
WHERE authorId = 007;

UPDATE PRODUCTINVOICE
SET quantity = 3
WHERE bookID = 100861;

DELETE FROM PRODUCTINVOICE
WHERE bookId = 100861;

UPDATE INVOICE
SET customerNum = 54
WHERE invoiceNum = 1;

DELETE FROM INVOICE
WHERE invoiceNum = 6;

UPDATE EMPLOYEE
SET pos_ID = 4
WHERE emp_ID = 7436;

DELETE FROM EMPLOYEE
WHERE emp_Id = 7434;

UPDATE POSITION
SET pos_ID = 6
WHERE emp_Position = 'JANITOR';

DELETE FROM POSITION
WHERE pos_Id = 6;

UPDATE CUSTOMER
SET salesRepNum = 2
WHERE custNum = 99;

DELETE FROM CUSTOMER
WHERE address = 'NIAGARA';

UPDATE SALESREP
SET salesRepNum = 6
WHERE salesRepLName = 'PURSER';

DELETE FROM SALESREP
WHERE salesRepFName = 'CHRISTOPHER';

select * from EMPLOYEE;
select * from POSITION;
select emp_FName, emp_LName from EMPLOYEE where pos_ID = 2; -- retrieve all employees with sales position
select * from CUSTOMER;
select * from SALESREP;

select s.salesRepFName, s.salesRepLName, c.custName from SALESREP s inner join CUSTOMER c on s.salesRepNum = c.salesRepNum order by SALESREPLNAME ASC; -- retrieve all employees in sales and the customers they represent
select s.salesRepFName, s.salesRepLName, c.custName from SALESREP s left join CUSTOMER c on s.salesRepNum = c.salesRepNum order by SALESREPLNAME ASC; -- retrieve all employees in sales and their customers, show null if applicable
select c.custName, s.salesRepFName, s.salesRepLName, s.salesRepNum from CUSTOMER c left join SALESREP s on s.salesRepNum = c.salesRepNum order by SALESREPLNAME ASC; -- retrieve all customers with rep's info, show null if applicable
select s.salesRepFName, s.salesRepLName, c.custName from SALESREP s full outer join CUSTOMER c on s.salesRepNum = c.salesRepNum; -- display all reps and all customers 
select s.salesRepFName, s.salesRepLName, c.custName from SALESREP s left join CUSTOMER c on s.salesRepNum = c.salesRepNum where c.salesRepNum IS NULL order by SALESREPLNAME ASC; -- display reps that don't have customers
select s.salesRepFName, s.salesRepLName, c.custName from SALESREP s right join CUSTOMER c on s.salesRepNum = c.salesRepNum where c.salesRepNum IS NULL order by SALESREPLNAME ASC; -- display customers that don't have reps


