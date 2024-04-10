with top_10_jobs as (
SELECT
  job_id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
  name as company_name

FROM
  job_postings_fact

INNER JOIN company_dim

ON job_postings_fact.company_id = company_dim.company_id


WHERE job_title_short LIKE ('%Data Analy%') AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg desc
LIMIT 10
)

select top_10_jobs.*, skills FROM
top_10_jobs

INNER JOIN
skills_job_dim
on top_10_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id



