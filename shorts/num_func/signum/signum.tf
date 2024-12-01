locals {
    val1 = signum(-13)
    val2 = signum(0)
    val3 = signum(344)
}

output "val1" {
  value       = local.val1
}
output "val2" {
  value       = local.val2
}
output "val3" {
  value       = local.val3
}
