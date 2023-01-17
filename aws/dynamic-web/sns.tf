resource "aws_sns_topic" "user_notifications" {
  name = "user_notifications"
}

resource "aws_sns_topic_subscription" "user_notifications_subscription" {
  topic_arn = aws_sns_topic.user_notifications.arn
  protocol  = "email"
  endpoint  = var.var_operator_email
}