select x.name, x.population, x.area from (

select * from world where area >= 3000000 or population >= 25000000
)x
