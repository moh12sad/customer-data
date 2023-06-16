--reading the data
SELECT TOP (1000) [name]
      ,[age]
      ,[gender]
      ,[education]
      ,[income]
      ,[country]
      ,[purchase_frequency]
      ,[spending]
  FROM [customer spending].[dbo].[customer_data]

  --exploiting the data
  select *
  from [customer spending].[dbo].[customer_data]

  select *
  from [customer spending].[dbo].[customer_data]
  where education like 'PhD' and gender like 'female'
  order by spending desc, income desc
 
  select *
  from [customer spending].[dbo].[customer_data]
  where education like 'master' and gender like 'female'
  order by spending desc, income desc
  
   select *
  from [customer spending].[dbo].[customer_data]
  where education like 'Bachelor' and gender like 'female'
  order by spending desc, income desc
  
  select *
  from [customer spending].[dbo].[customer_data]
  where education like 'High School' and gender like 'female'
  order by spending desc, income desc

    select distinct country,*
  from [customer spending].[dbo].[customer_data]

    select *
  from [customer spending].[dbo].[customer_data]
  where spending > 9613
  order by spending desc


    select distinct country,*
  from [customer spending].[dbo].[customer_data]

    select *
  from [customer spending].[dbo].[customer_data]
  where age between '18'and '25'
  order by spending desc

  SELECT TOP 155 *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '26'and '39') t1


    SELECT TOP 155 *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '40'and '60') t1

--dividing the customers by Generations (Z, Y, X)

  --Generation Z 
  select *
  from [customer spending].[dbo].[customer_data]
  where age between '18'and '25'
  order by income desc

   select *
  from [customer spending].[dbo].[customer_data]
  where age between '18'and '25' and purchase_frequency = '1'
  order by income desc

  --Generation Y
  SELECT *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '26'and '39') t1
  order by income desc

    SELECT *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '26'and '39') t1
  where purchase_frequency = '1'
  order by income desc

  --Generation X
    SELECT *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '40'and '60') t1
  order by income desc

      SELECT *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '40'and '60') t1
  where purchase_frequency = '1'
  order by income desc

  --AVG spending and AVG income for Generation Z 
  select avg(spending) AVG_spending,avg(income) AVG_income,AVG(purchase_frequency) AVG_Pur_Fre
  from (  select *
  from [customer spending].[dbo].[customer_data]
  where age between '18'and '25') t2
  --order by spending desc)
  
  --AVG spending and AVG income for Generation Y
  select avg(spending) AVG_spending,avg(income) AVG_income,AVG(purchase_frequency) AVG_Pur_Fre
  from (SELECT *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '26'and '39') t1) t2

  --AVG spending and AVG income for Generation X
   select avg(spending) AVG_spending,avg(income) AVG_income,AVG(purchase_frequency) AVG_Pur_Fre
  from (SELECT *
  from (select *
  from [customer spending].[dbo].[customer_data]
  where age between '40'and '60') t1) t2

  --geting the avarage and the maximum

  select t1.age,avg(spending) AVG_spending,avg(income) AVG_income,AVG(purchase_frequency) AVG_Pur_Fre
  from (  select distinct age,name,gender,education,income,country,purchase_frequency,spending
  from [customer spending].[dbo].[customer_data] ) t1
  group by age 

  select t1.age,MAx(spending) max_spending,max(income) max_income,max(purchase_frequency) max_Pur_Fre
  from (  select distinct age,name,gender,education,income,country,purchase_frequency,spending
  from [customer spending].[dbo].[customer_data] ) t1
  group by age

  select t1.age,avg(spending) AVG_spending,avg(income) AVG_income,AVG(purchase_frequency) AVG_Pur_Fre
  from (  select distinct age,name,gender,education,income,country,purchase_frequency,spending
  from [customer spending].[dbo].[customer_data] ) t1
  group by age 

  select t1.age,MAx(spending) max_spending,max(income) max_income,max(purchase_frequency) max_Pur_Fre
  from (  select distinct age,name,gender,education,income,country,purchase_frequency,spending
  from [customer spending].[dbo].[customer_data] ) t1
  group by age 

   select max(t1.spending) AVG_spending,max(t1.income) AVG_income
  from (  select *
  from [customer spending].[dbo].[customer_data] )t1

  --sorting by income and spending

  --data of top 100 person in income
  select top 100* , (spending/income) spending_per_income
  from [customer spending].[dbo].[customer_data] 
  order by income desc

  select avg(t1.spending_per_income) avg_spending_per_income
  from( select top 100* , (spending/income) spending_per_income
  from [customer spending].[dbo].[customer_data] 
  order by income desc) t1

  --data of low 100 person in income
  select top 100* , (spending/income) spending_per_income
  from [customer spending].[dbo].[customer_data] 
  order by spending_per_income desc

  select avg(t1.spending_per_income) avg_spending_per_income
  from( select top 100* , (spending/income) spending_per_income
  from [customer spending].[dbo].[customer_data] 
  order by spending_per_income desc) t1

  select * ,(avg_spending/avg_income) avg_spending_per_avg_income
  from (select distinct country,avg(income) avg_income ,avg(spending) avg_spending
  from [customer spending].[dbo].[customer_data]
  group by country) t1
  order by avg_income desc
