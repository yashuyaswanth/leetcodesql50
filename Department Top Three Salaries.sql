/* Write your T-SQL query statement below */


select Department,Employee, Sal as Salary from (

SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.Salary AS Sal,
dense_rank()
OVER(
    partition by e.departmentId order by salary desc
) as dnsrnk

FROM 
    Employee e
INNER JOIN 
    Department d ON e.departmentId = d.id

)x

where x.dnsrnk<=3

/*

WITH RankedSalaries AS (
    SELECT E.name AS Employee, E.salary AS Salary, D.name AS Department,
           DENSE_RANK() OVER (PARTITION BY E.departmentId ORDER BY E.salary DESC) AS salary_rank
    FROM Employee E
    JOIN Department D
    ON E.departmentId = D.id
)
SELECT Employee, Salary, Department
FROM RankedSalaries
WHERE salary_rank <= 3;
*/
