#USER ACTIVITY ANALYSIS USING SQL
#PROBLEM STATEMENT : You are given two tables: “Users” and “ActivityLog”.
/* The “Users” table includes valuable information such as user identities, 
including their unique user IDs, names, and corresponding email addresses. 
On the other hand, the “ActivityLog” table contains a complete log of various user
 activities, including log IDs, associated user IDs,
 the type of activity performed, and precise timestamps of when each activity occurred.


Your task is to extract and analyze the user activity data within the designated
 timeframe of the past 30 days. You are required to write an SQL query to retrieve
 relevant user activity records that occurred in the last 30 days. */
 
#CREATE INPUT TABLES:

CREATE TABLE Users (
  user_id INT,
  name VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE ActivityLog (
    log_id INT,
    user_id INT,
    activity_type VARCHAR(50),
    timestamp DATETIME
);

#INSERT VALUES IN BOTH THE TABLES


INSERT INTO Users (user_id, name, email)
VALUES
  (1, 'Rahul', 'rahul@example.com'),
  (2, 'Priya', 'priya@example.com'),
  (3, 'Amit', 'amit@example.com'),
  (4, 'Sneha', 'sneha@example.com'),
  (5, 'Gaurav', 'gaurav@example.com'),
  (6, 'Anika', 'anika@example.com');

INSERT INTO ActivityLog (log_id, user_id, activity_type, timestamp)
VALUES
  (1, 1, 'login', '2023-06-10 09:00:00'),
  (2, 1, 'search', '2023-06-10 09:15:00'),
  (3, 2, 'login', '2023-06-10 10:00:00'),
  (4, 3, 'login', '2023-06-11 11:00:00'),
  (5, 1, 'purchase', '2023-06-12 14:30:00'),
  (6, 2, 'search', '2023-06-15 16:45:00'),
  (7, 1, 'logout', '2023-06-18 20:00:00'),
  (8, 1, 'login', '2023-01-15 10:30:00'),
  (9, 2, 'search', '2023-02-05 14:45:00'),
  (10, 3, 'purchase', '2023-03-20 09:15:00'),
  (11, 1, 'search', '2023-04-10 16:30:00'),
  (12, 2, 'login', '2023-05-05 11:45:00'),
  (13, 3, 'search', '2023-06-15 08:30:00');
 
 #Now here’s how to solve the User Activity Analysis problem using SQL:
 
 SELECT U.user_id, U.name, U.email, A.activity_type, A.timestamp
FROM Users U
JOIN ActivityLog A ON U.user_id = A.user_id
WHERE A.timestamp >= DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY);
 
  