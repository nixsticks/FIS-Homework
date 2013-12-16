SELECT user.name, pledge.amount
FROM pledge
JOIN user
ON user.id = pledge.user_id
ORDER BY pledge.amount;