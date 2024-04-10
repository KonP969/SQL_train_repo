

select skills, count(skills_job_dim.job_id)FROM
job_postings_fact

INNER JOIN
skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short LIKE ('%Analyst%')
and job_work_from_home = TRUE
GROUP BY skills
ORDER BY 2 desc
limit 5
