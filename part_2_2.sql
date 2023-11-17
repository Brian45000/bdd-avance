CREATE VIEW subscription_per_plan_per_month AS
SELECT subscription_plan, sum(paid) as TotalPayer, EXTRACT(MONTH FROM subscribed_at) as Mois, count(subscription_id) as NbSubscriptions
FROM subscription_table
GROUP BY subscription_plan, EXTRACT(MONTH FROM subscribed_at)
ORDER BY EXTRACT(MONTH FROM subscribed_at) ASC