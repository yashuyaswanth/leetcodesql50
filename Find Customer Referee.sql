/* Write your T-SQL query statement below */
select name from Customer WHERE IsNULL(referee_id, 0) <> 2
