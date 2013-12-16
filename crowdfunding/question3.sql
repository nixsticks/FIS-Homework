SELECT project.title, project.funding_goal, SUM(pledge.amount) as sum_total
FROM pledge
JOIN project
ON project.id = pledge.project_id
GROUP BY project.title
HAVING SUM(pledge.amount) >= project.funding_goal;