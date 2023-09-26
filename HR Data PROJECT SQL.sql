SELECT*
FROM[dbo].['HR DATA$']

1--Find the top 5 departments with the highest average monthly income:

SELECT [Department],ROUND( AVG ([Monthly Income]), 2) AS 'AVG MONTHLY INCOME'
FROM [dbo].['HR DATA$']
GROUP BY [Department]

2-- Calculate the percentage of employees who have left the organization for each 
job level

      --THIS SHOWED THE TOTAL NUMBER OF EMPLOYES 
   select [Job Level], count ( distinct [emp no]) as 'number of employees'
   from[dbo].['HR DATA$']
   where [Attrition]= 'Yes'
   group by [Job Level]
   
   --WHILE THIS SHOWED THE PERCENTAGE OF EMPLOYEES
   select [Job Level], (count(*)*100.0/(SELECT COUNT( DISTINCT[emp no])
   FROM [dbo].['HR DATA$'])) as 'percentage'
   from [dbo].['HR DATA$']
   WHERE [Attrition]= 'Yes'
   group by [Job Level]

   select count (distinct [emp no])
   from[dbo].['HR DATA$']

 

3--Retrieve employees who have the highest performance rating within each 
department

SELECT [emp no], [Department],[Job Role], max([Performance Rating]) AS 'MAX PERFORMANCE RATING'
FROM [dbo].['HR DATA$']
GROUP BY  [Department], [emp no],[Job Role] 
ORDER BY [MAX PERFORMANCE RATING] DESC

4 --Find the average distance from home for employees with different levels of job
involvement

SELECT AVG ( [Distance From Home] ) AS 'AVG DISTANCE FROM HOME', [Job Level]
FROM [dbo].['HR DATA$']
GROUP BY [Job Level]
order by 'AVG DISTANCE FROM HOME' desc



5--Calculate the average hourly rate for employees who work overtime and those who don't

SELECT[Over Time] ,avg ([Hourly Rate]) as 'avg hourly rate'
FROM [dbo].['HR DATA$']
group by [Over Time]
order by 'avg hourly rate'

6--Retrieve employees who have worked for the maximum number of companies

 SELECT [emp no],[Num Companies Worked]
 FROM[dbo].['HR DATA$']
 WHERE [Num Companies Worked]= 9

 7-- Find the most common education field among employees

 SELECT [Education Field], COUNT ([Education Field]) AS  'MOST COMMON'
 FROM[dbo].['HR DATA$']
 GROUP BY [Education Field]
 ORDER BY [Education Field] DESC

 8-- Calculate the average performance rating for employees in each business travel category

SELECT[emp no], [Business Travel],ROUND( AVG( [Performance Rating]), 2) AS 'AVEG PERFORMANCE RATING'
FROM [dbo].['HR DATA$']
GROUP BY [Business Travel], [emp no]
order by 'AVEG PERFORMANCE RATING' DESC

9--Retrieve employees who have the highest stock option level within each departmenT

SELECT[emp no], [Department], MAX( [Stock Option Level]) AS 'HIGHEST STOCK OPTION'
FROM[dbo].['HR DATA$']
WHERE [Stock Option Level] = 3
GROUP BY [emp no], [Department]
ORDER BY 'HIGHEST STOCK OPTION' DESC


10-- Find the total working years and average monthly income for employees with different levels of environment satisfaction

SELECT  [Environment Satisfaction], SUM([Total Working Years]) AS 'TOTAL WORKING YEARS', AVG([Monthly Rate]) AS 'AVG MONTHLY INCOME'
FROM [dbo].['HR DATA$']
GROUP BY [Environment Satisfaction]
ORDER BY [Environment Satisfaction]


11.-- The number of active employees
SELECT COUNT ([Attrition]) AS 'ACTIVE EMPLOYEES'
FROM [dbo].['HR DATA$']
WHERE [Attrition]= 'NO'

12--Find the number of employees by age group 

SELECT COUNT(DISTINCT [emp no])AS 'COUNT OF EMPLOYEES', [CF_age band]
FROM [dbo].['HR DATA$']
GROUP BY [CF_age band]
ORDER BY 'COUNT OF EMPLOYEES'

13--Display the attrition by education field

SELECT[Attrition],[Education Field],COUNT([Education Field])AS 'COUNT OF EDU FIELD'
FROM [dbo].['HR DATA$']
GROUP BY [Education Field],[Attrition]
ORDER BY [Attrition]


14--Attrition rate by gender for different age group

SELECT [Attrition],[Gender], [CF_age band],
    COUNT([Gender]) AS 'Total Employees',
    SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) AS 'Attrition Count',
    SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) / COUNT([Gender]) AS 'Attrition Rate'
FROM [dbo].['HR DATA$']
GROUP BY [Attrition], [CF_age band], [Gender]



