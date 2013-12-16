SELECT project.title as project_title, pledge.amount as pledge_amount
FROM pledge
JOIN project
ON project.id = pledge.project_id
GROUP BY project.title;