INSERT INTO project (title, category, funding_goal, start_date, end_date)
VALUES
('new album', 'music', 1000, '2013-12-24', '2014-2-1'),
('first novel', 'books', 10000, '2013-12-24', '2014-5-1'),
('homeless shelter', 'charity', 5000, '2013-12-24', '2014-3-1'),
('soup kitchen', 'charity', 2000, '2013-12-24', '2014-4-1'),
('home for lost cats', 'charity', 100000, '2013-12-24', '2015-1-1'),
('home for lost dogs', 'charity', 100000, '2013-12-24', '2015-1-1'),
('second novel', 'books', 3000, '2013-12-24', '2014-6-1'),
('squaw valley funding', 'books', 4000, '2013-12-24', '2014-1-1'),
('second album', 'music', 6000, '2013-12-24', '2014-4-1'),
('third novel', 'books', 7000, '2013-12-24', '2014-1-1');

INSERT INTO user (name, age)
VALUES
("Nikki", 26),
("Anisha", 22),
("Oliver", 23),
("Sarah", 24),
("Lena", 25),
("Mary", 25),
("Angela", 26),
("Jeffrey", 26),
("Tara", 23),
("Keith", 30),
("Blake", 30),
("Ashley", 27),
("Adam", 26),
("Nathan", 25),
("Tom", 20),
("Anthony", 55),
("Suit", 56),
("Ash", 12),
("Misty", 11),
("Vois", 36);

INSERT INTO pledge (amount, user_id, project_id)
VALUES 
(30, 1, 1),
(30, 2, 2),
(30, 3, 3),
(30, 4, 4),
(30, 5, 5),
(30, 6, 6),
(30, 7, 7),
(30, 8, 8),
(30, 9, 9),
(30, 10, 10),
(30, 11, 11),
(30, 12, 12),
(30, 13, 13),
(30, 14, 14),
(30, 15, 15),
(30, 16, 16),
(30, 17, 17),
(30, 18, 18),
(30, 19, 19),
(30, 1, 20),
(30, 2, 1),
(30, 2, 1),
(30, 2, 1),
(30, 3, 1),
(30, 4, 1),
(30, 5, 1),
(30, 7, 1),
(30, 8, 1),
(30, 10, 1),
(30, 20, 1);