locals {
    min_val = min(5, 12, 9)
}

output "min_val" {
  value       = local.min_val
  description = "Using the min value function"
}
