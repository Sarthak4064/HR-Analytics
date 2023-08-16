1) KPI-Employee_count
select sum(employee_count) as Employee_Count from hrdata;

2)KPI-Attrition_count
select count(attrition) from hrdata where attrition='Yes';

3)KPI-Attrition_Rate
select 
round (((select count(attrition) from hrdata where attrition='Yes')/ 
sum(employee_count)) * 100,2)
from hrdata;

4)KPI-Active_Employee
  select sum(hr.employee_count) - (select count(attrition) from hrdata  where attrition='Yes') from hrdata;

5)KPI-Average_age
select round(avg(age),0) from hrdata;

6) Attrition_by_Gender
select gender, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by gender
order by count(attrition) desc;

7)Department_wise_Attrition
select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from hrdata where attrition= 'Yes')) * 100, 2) as pct from hrdata
where attrition='Yes'
group by department 
order by count(attrition) desc;

8)No_of_Employee_by age_group
select age_band, gender, sum(employee_count) from hrdata
group by age_band, gender
order by age_band, gender desc

9)Education_field_wise_Attrition
select education_field, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by education_field
order by count(attrition) desc;

10)Attrition_rate_by_gender_for_different_age_group
select age_band, gender, count(attrition) as attrition, 
round((cast(count(attrition) as numeric) / (select count(attrition) from hrdata where attrition = 'Yes')) * 100,2) as pct
from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band desc;

11)Job_satisfaction_rating
SELECT * FROM 
crosstab('SELECT job_role, job_satisfaction, sum(employee_count)
   FROM hrdata
   GROUP BY job_role, job_satisfaction
   ORDER BY job_role, job_satisfaction'
	) AS ct(job_role varchar(50), one numeric, two numeric, three numeric, four numeric)
ORDER BY job_role;



