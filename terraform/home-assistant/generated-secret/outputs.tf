output "value" {
  description = "Generated secret value"
  value       = random_password.secret.result
  sensitive   = true
}
