select * from Dummy_5000_Employee_Details_Dataset;

select 
	department,
	count(*) as Headcount,
	cast(Sum(case when sex = 'Female' then 1.0 else 0.0 end)/count(*) *  100 as decimal (10, 2)) as FemalePercent,
	round(avg(salary),0) as AvgSalary,
	avg(datediff(year,dob,getdate())) as AvgYearsUpdated
from Dummy_5000_Employee_Details_Dataset
group by Department;


select top 5 
	Position,
	count(*) as Headcount,
	sum(case when Insurance = 'Both' then 1 else 0 end) as FullInsurance,
	round(avg(salary),0) as AvgSalary,
	max(salary) as MaxSalary,
	min(Salary) as MinSalary
from Dummy_5000_Employee_Details_Dataset
group by position
order by AvgSalary desc