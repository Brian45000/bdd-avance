CREATE VIEW very_active_users_may  AS
SELECT u.username
FROM user_table u
JOIN session_table s ON u.user_id = s.user_id
WHERE s.connected_at_month  = 5  
GROUP BY u.username
HAVING COUNT(s.session_id) > 0.6 * (SELECT AVG(session_count) 
									FROM (SELECT COUNT(session_id) AS session_count 
										  FROM session_table 
										  WHERE connected_at_month  = 5 
										  GROUP BY user_id) 
									AS user_sessions);