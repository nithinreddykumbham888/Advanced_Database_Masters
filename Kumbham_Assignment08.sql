ALTER DATABASE OPEN;
SET serveroutput on;

CREATE TABLE MyFoodDestination(
  Place_ID varchar(2) primary key,
  Place_Name varchar(30),
  Special_Dish varchar(30),
  Dish_Price NUMBER(10,2)
  );
  
INSERT INTO MyFoodDestination( Place_ID, Place_Name, Special_Dish, Dish_Price ) 
VALUES
(1,'Paradise','Biriyani',120.247);

INSERT INTO MyFoodDestination( Place_ID, Place_Name, Special_Dish, Dish_Price ) 
VALUES
(2,'Burger_King','Burger',10.0);

INSERT INTO MyFoodDestination( Place_ID, Place_Name, Special_Dish, Dish_Price ) 
VALUES
(3,'Domminos','Pizza',15.0);

INSERT INTO MyFoodDestination( Place_ID, Place_Name, Special_Dish, Dish_Price ) 
VALUES
(4,'Apple_Bees','Icecream',9.0);

select * from MyFoodDestination;


--*QUESTION 1
ACCEPT place_name char PROMPT 'Enter_place_Name';
create or replace procedure getSpecial_dish
As
temp varchar(30);
dish varchar(20);
BEGIN
temp:='&place_name';
SELECT Special_dish into dish from MyFoodDestination where place_name=temp;
if(temp is not null)then
dbms_output.put_line('The special dish of'||temp||'is'|| dish);
else
dbms_output.put_line('I dont have any special dish in'||temp);
END IF;
END;
/
EXECUTE getSpecial_dish;

--*QUESTION 2
create or replace function FindAverage
return number
is
    average number(10,2);
begin
    select avg(dish_price) into average from MyFoodDestination;
    return average;
end;
/
               

--*QUESTION 3
create or replace procedure PrintAverage
is
begin
    dbms_output.put_line('The average value is $' || FindAverage);
end;
/
execute PrintAverage;

--*QUESTION 4
create or replace function FindMax
return number
is
    maximum number(10,2);
begin
    select max(dish_price) into maximum from MyFoodDestination;
    return maximum;
end;
/

--*QUESTION 5
create or replace procedure PrintMax
is
   dish_name varchar2(30);
begin
    select special_dish into dish_name from MyFoodDestination where dish_price=findmax();
    dbms_output.put_line('The name of the dish with maximum price is '||dish_name|| 'and the price is '||FindMax());
end;
/
execute PrintMax;