SELECT user.name, user.age, pledge.amount
FROM pledge
JOIN user
ON user.id = pledge.user_id
ORDER BY user.name;