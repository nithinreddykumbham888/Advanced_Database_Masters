--+ QUESTION 1
CREATE TABLE Timeer(
      Timeer_ID NUMBER(4) NOT NULL primary key ,
      Day NUMBER(4),
      Month NUMBER(4),
      Quater NUMBER(4),
      Year NUMBER(4)
      );

CREATE TABLE Branch (
       Branch_ID NUMBER(4) NOT NULL PRIMARY KEY,
       Branch_Name varchar(20),
       Branch_Type varchar(20)
       );
       
CREATE TABLE Item (
       Item_ID NUMBER(4) NOT NULL PRIMARY KEY,
       Item_Name varchar(30),
       Brand varchar(30),
       Type varchar(30),
       Supplier_Type varchar(30)
       );
       
CREATE TABLE Location (
       Location_ID NUMBER(4) NOT NULL PRIMARY KEY,
       Street varchar(30),
       City varchar(30),
       State varchar(30),
       Country varchar(30)
       );
       
CREATE TABLE Sales (
       Branch_ID NUMBER(4) NOT NULL ,
       Location_ID NUMBER(4) NOT NULL ,
       Item_ID NUMBER(4) NOT NULL ,
       Timeer_ID NUMBER(4) NOT NULL  ,
       Units_Sold NUMBER(4),
       Dollars_Sold NUMBER(4),
         Foreign KEY(Branch_ID) REFERENCES Branch(Branch_ID),
         FOREIGN KEY(Location_ID) REFERENCES Location(Location_ID),
         FOREIGN KEY(Item_ID) REFERENCES Item(Item_ID),
         FOREIGN KEY(Timeer_ID) REFERENCES Timeer(Timeer_ID)
       );
 
 --+ QUESTION 2      
INSERT INTO Timeer( Timeer_ID, Day, Month, Quater, Year ) 
VALUES
(3,6,03,7,2008);
INSERT INTO Timeer( Timeer_ID, Day, Month, Quater, Year ) 
VALUES
(2,4,05,6,2010);
INSERT INTO Timeer( Timeer_ID, Day, Month, Quater, Year ) 
VALUES
(1,2,09,2,2020);

INSERT INTO Branch VALUES (1, 'Information Systems', 'CS');
INSERT INTO Branch VALUES (2, 'Applied Computers', 'CS');
INSERT INTO Branch VALUES (3, 'Machine Learning', 'CS');  

INSERT INTO Item VALUES (1, 'Traditional', 'Raymond', 'Self', 'Single Order');
INSERT INTO Item VALUES (2, 'Ocassion', 'Levis', 'Self', 'Single Order');
INSERT INTO Item VALUES (3, 'Party', 'Buffalo', 'Self', 'Single Order');  

INSERT INTO Location VALUES (1, 'Alam', 'Chicago', 'Chicago', 'USA');
INSERT INTO Location VALUES (2, 'Sease', 'Dallas', 'Texas', 'USA');
INSERT INTO Location VALUES (3, 'United', 'Kansas', 'Missouri', 'USA');

INSERT INTO Sales VALUES (1, 1, 1, 1, 10, 100);
INSERT INTO Sales VALUES (2, 2, 2, 2, 20, 150);
INSERT INTO Sales VALUES (3, 3, 3, 3, 30, 123);

--+ QUESTION 3
ALTER TABLE Sales
MODIFY Units_Sold NUMBER(37);

ALTER TABLE Sales
MODIFY Dollars_Sold NUMBER(37);

--+ QUESTION 4
UPDATE Item
set item_name = 'Hat' , brand = 'Puma', type = 'Ferrari'
WHERE item_id = 3;

--+ QUESTION 5
SELECT Branch_ID, Location_ID, Item_ID, Units_Sold, Dollars_Sold
FROM sales
ORDER BY item_id DESC;

--+ QUESTION 6
SELECT count(Item_ID), SUM(Units_Sold), SUM(Dollars_Sold)
FROM sales
GROUP BY Location_ID;

--+ QUESTION 7
COMMIT

--+ QUESTION 8
SELECT * FROM Timeer;
SELECT * FROM Branch;
SELECT * FROM Item;
SELECT * FROM Location;
Select * from sales;

--+ QUESTION 9
DROP table Timeer;
DROP table Branch; 
DROP table Item;
DROP table Location;
DROP table Sales;

--+ QUESTION 10
ROLLBACK;

--+ QUESTION 11
SELECT * FROM Timeer;
SELECT * FROM Branch;
SELECT * FROM Item;
SELECT * FROM Location;
Select * from sales;
