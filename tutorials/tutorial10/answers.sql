-- Exercise 1 (done for you): Selecting all columns
SELECT * FROM users;



-- Exercise 2 (done for you): Selecting some columns
SELECT id, first_name, last_name 
FROM users;



-- Exercise 3: Sorting
SELECT id, first_name, last_name
FROM users
ORDER BY last_name



-- Exercise 4: Filtering
SELECT id, image_url, user_id
FROM posts
WHERE user_id = '26'




-- Exercise 5: Filtering with logical operators
SELECT id, image_url, user_id
FROM posts
WHERE user_id = '26' or user_id='12'



-- Exercise 6: Using functions in a select statement
SELECT count(id)
FROM posts




-- Exercise 7: Aggregating data
SELECT user_id, count(id)
FROM comments
GROUP BY user_id
ORDER BY count desc;



-- Exercise 8: Joining: two tables
SELECT posts.id post_id, posts.image_url, posts.user_id, 
users.username, users.first_name, users.last_name
FROM posts
JOIN users ON posts.user_id = users.id
WHERE users.id IN (26, 12);


-- Exercise 9: More joining practice: two tables
SELECT posts.id, posts.pub_date, following.id
FROM following
JOIN posts ON following.following_id = posts.user_id
WHERE following.user_id = 26;



-- Exercise 10: More joining practice: three tables (Optional)
SELECT posts.id,posts.pub_date,
following.id following_id, users.username
FROM following
JOIN posts ON following.following_id = posts.user_id
JOIN users ON posts.user_id = users.id
WHERE following.user_id = 26
ORDER BY posts.pub_date DESC;



-- Exercise 11: Inserting records
INSERT INTO bookmarks (user_id, post_id, timestamp)
VALUES 
	('26','219', NOW()),
	('26','220', NOW()),
	('26','221', NOW());




-- Exercise 12: Deleting records
DELETE FROM bookmarks WHERE post_id = '219';
DELETE FROM bookmarks WHERE post_id = '220';
DELETE FROM bookmarks WHERE post_id = '221';



-- Exercise 13: Updating records
UPDATE users
SET email = 'knick2022@gmail.com'
WHERE first_name = 'Nicholas';



-- Exercise 14: More Querying Practice (Optional)
SELECT posts.id, posts.caption, count(comments.id)
FROM posts
LEFT JOIN comments ON posts.id = comments.post_id
WHERE posts.user_id = '26'
GROUP BY posts.id, posts.caption