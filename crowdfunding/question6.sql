SELECT title, SUM(pledge.amount) as sum_total
FROM pledge
JOIN project
ON project.id = pledge.project_id
WHERE project.category = "books"
GROUP BY project.title
ORDER BY project.title;