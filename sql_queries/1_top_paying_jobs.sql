
with jobs as (SELECT
  job_id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date, company_id



FROM
  job_postings_fact

  WHERE job_title_short LIKE ('%Data Analy%') AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg desc
LIMIT 10)

SELECT name, jobs.job_title, jobs.salary_year_avg

FROM company_dim
INNER JOIN jobs ON
company_dim.company_id = jobs.company_id

