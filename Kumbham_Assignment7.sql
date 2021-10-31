--*QUESTION 1
SELECT E.first_name,E.last_name, 
   D.department_name, L.city, L.state_province
     FROM employees E 
      JOIN departments D  
        ON E.department_id = D.department_id  
          JOIN locations L
           ON D.location_id = L.location_id;
           
--*QUESTION 2
SELECT E.first_name emp_fname,E.last_name emp_lname,M.first_name man_fname,M.last_name man_lname
from employees E
JOIN employees M
ON M.employee_id = E.manager_id 

--*QUESTION 3
SELECT E.first_name emp_fname,E.last_name emp_lname,M.first_name man_fname,M.last_name man_lname
from employees E
LEFT JOIN employees M
ON M.employee_id = E.manager_id 

--*QUESTION 4
SELECT E.first_name || E.last_name emp_name, J.job_title, J.max_salary - E.salary salary_difference
from employees E
JOIN jobs J
ON E.job_id = J.job_id

--*QUESTION 5
SELECT D.department_id, 
  D.department_name,
  COUNT(*) "No of Employees" 
  FROM employees E
  JOIN departments D  
    ON E.department_id = D.department_id  
GROUP BY D.department_id, D.department_name
ORDER BY D.department_id ASC;

--*QUESTION 6
SELECT D.department_id, 
  D.department_name,
SUM(salary) "Total Salary" 
FROM employees E
  JOIN departments D  
    ON E.department_id = D.department_id  
GROUP BY D.department_id, D.department_name
ORDER BY D.department_id ASC;

--*QUESTION 7
SELECT first_name || ' ' || last_name "emp_name",
  job_title,
	salary 
	FROM employees E
    JOIN jobs J  
      ON E.JOB_ID = J.JOB_ID  
	where salary = 
    (select max(salary)
    from employees);
    
--*QUESTION 8
SELECT first_name || ' ' || last_name "emp_name",
  job_title,
	salary 
	FROM employees E
    JOIN jobs J  
      ON E.JOB_ID = J.JOB_ID  
	where salary = 
    (select min(salary)
    from employees);
    
--*QUESTION 9
-- Correlated subquery depends on the external query and cannot run by itself, whereas non-correlated subquery or subquery doesn't depend on the external query and can be run by itself
-- Non-Correlated Subquery: The internal query "select min(salary) from employees" below is not contingent on the external query it executes on its own, and only once.
--    Ex: select fees from students Stu where fees in (select min(fees) from students);
-- Correlated Subquery: The inner query below depends on the value of the outer query salary "e1.salary" and runs several times within the inner query depending on the value of e2.salary to meet its minimum value and then retrieve the value from the database.
--    Ex : select fees from students S1 where low = (select count(fees) from students S2 where S2.salary < S1.salary);

--*QUESTION 10
-- UNION ALL is the same as UNION operator, except that UNION ALL selects all columns and does not delete duplicate rows
-- Whereas Union, The selected columns need to be of the same data type and only distinct values are selected.

--*QUESTION 11
-- cartesian product also known as cross join generates all possible combinations of all the rows. It has no clause as each and every column will be joined to the source table and the data returned.
-- A full outer join is basically mixing both left outer and right outer join. It returns all rows in both tables that match the where query and in cases where the on condition can't be satisfied for those rows it puts null values in for the unpopulated fields.