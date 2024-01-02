#database_groupAssignment
Date created: July 29 2022
Group members: Tiffany Groves
                                  Hammed Sanni  
                                         Christopher Purser        




Normalized Views:
View 1:
Customer -------------------< Invoice
Invoice >-----------------< Book
UNF
[custNo, custName {invoiceNum, invoiceDate, {bookID, bookName, bookEd, quantity, price}}]


1NF
Book (bookID, invoiceNum, bookName, bookEd, quantity, price)
Invoice (invoiceNum, invoiceDate, customerNum)
Customer (custNum, custName,)


2NF, 3NF
New Cumulative Design
ProductInvoice (invoiceNum, bookID, quantity)
Book (productID, bookName, bookEd, price)
Invoice (invoiceNum, invoiceDate, customerNum)
Customer (custNum, custName)


View 2
Book >--------------------------------< Author
UNF
[bookId, bookName, bookEdition , bookCost, {authorID, authorFName, authorLName}]

1NF
book [bookId, bookName, bookEdition, bookCost]
bookAuthor [bookId, authorId, authorLName, authorFName]
	authorID  authorFName, authorLName

2NF, 3NF
bookAuthor [bookId, authorId]
book [bookId, bookName, bookEdition, bookCost]
author [authorFName, authorLName]

Old Cumulative Design
ProductInvoice (invoiceNum, bookID, quantity)
Book (bookID, bookName, bookEd, price)
Invoice (invoiceNum, invoiceDate, customerNum)
Customer (custNum, custName)

New Cumulative Design
bookAuthor [bookId, authorId]
author [authorFName, authorLName]
ProductInvoice (invoiceNum, bookID, quantity)
Book (bookID, bookName, bookEd, price)
Invoice (invoiceNum, invoiceDate, customerNum)
Customer (custNum, custName)


View 3
Relationship
Employee >----------------------- Position

UNF
 [empId, empFName, empLName, empSIN, supervisor, hireDate, empPosition, posID]
 
1NF
Employee [empId, empFName, empLName, empSIN, hireDate, supervisor, position, posID]
	posID  empPosition

2NF,3NF
Employee [empId, empFName, empLName, empSIN, hiredate, supervisor, posID]
Position [posID, empPosition,]

Old Cumulative Design
bookAuthor [bookId, authorId]
author [authorFName, authorLName]
ProductInvoice (invoiceNum, bookID, quantity)
Book (bookID, bookName, bookEd, price)
Invoice (invoiceNum, invoiceDate, customerNum)
Customer (custNum, custName)

New Cumulative Design
Employee [empId, empFName, empLName, empSIN, hiredate, supervisor, posID]
Position [posID, empPosition,]
bookAuthor [bookId, authorId]
author [authorFName, authorLName]
ProductInvoice (invoiceNum, bookID, quantity)
Book (bookID, bookName, bookEd, price)
Invoice (invoiceNum, invoiceDate, customerNum)
Customer (custNum, custName)

View 4:

Sales Rep -------------------< Customer

UNF

       [custNo, custName, location {salesRepNum, salesRepName }]

       1NF, 2NF, 3NF

Customer (custNum, salesRepNum, custName, location)
SalesRep (salesRepNum, salesRepName)


Old Cumulative Design
Employee [empId, empFName, empLName, empSIN, hiredate, supervisor, posID]
Position [posID, empPosition,]
bookAuthor [bookId, authorId]
author [authorFName, authorLName]
ProductInvoice (invoiceNum, bookID, quantity)
Book (bookID, bookName, bookEd, price)
Invoice (invoiceNum, invoiceDate, customerNum)
Customer (custNum, custName)



New Cumulative Design
ProductInvoice (invoiceNum, productID, quantity) 

Book (bookID, bookName, bookEd, price) 

Invoice (invoiceNum, invoiceDate, customerNum) 

bookAuthor [bookId, authorId] 

author [authorID, authorFName, authorLName] 

Employee [empId, empFName, empLName, empSIN, hiredate, supervisor, posID] 

Position [posID, empPosition,] 

Customer (custNum, salesRepNum, custName, location) 

SalesRep (salesRepNum, salesRepName) 






