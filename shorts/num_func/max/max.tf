locals {
    max_val = max(5, 12, 9)
}

output "max_val" {
  value       = local.max_val
  description = "Using the max value function"
}
