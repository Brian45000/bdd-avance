CREATE VIEW session_per_month AS
SELECT count(*), connected_at_month
FROM session_table
GROUP BY connected_at_month