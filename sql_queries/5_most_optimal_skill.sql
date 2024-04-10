
with skills_demand as (
select skills_dim.skill_id, skills_dim.skills, count(skills_job_dim.job_id) as demand FROM
job_postings_fact

INNER JOIN
skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short LIKE ('%Analyst%')
and job_work_from_home = TRUE
AND salary_year_avg is NOT NULL

GROUP BY skills_dim.skill_id
)
,
 aver_salary  as
(select skills_job_dim.skill_id,  round(avg(salary_year_avg), 0) as avg_salary
FROM
job_postings_fact

INNER JOIN
skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short LIKE ('%Analyst%')
AND salary_year_avg is NOT NULL
GROUP by skills_job_dim.skill_id
)

-- Combaining CTEs

select 

skills_demand.skills,
demand,
avg_salary


from skills_demand
inner JOIN
aver_salary
on skills_demand.skill_id = aver_salary.skill_id
WHERE demand >= 10
ORDER BY avg_salary desc, demand DESC