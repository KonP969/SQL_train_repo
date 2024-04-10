

select job_title_short, salary_year_avg
FROM
job_postings_fact

-- INNER JOIN
-- skills_job_dim
-- on job_postings_fact.job_id = skills_job_dim.job_id
-- INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short LIKE ('%Analyst%')
AND salary_year_avg is NOT NULL

ORDER BY salary_year_avg desc
limit 5
