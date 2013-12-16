SELECT title, pledge.amount
FROM pledge
JOIN project
ON project.id = pledge.project_id
WHERE project.category = "music"
ORDER BY project.title;