locals {
    val1 = pow(3, 2)
    val2 = pow(4, 0)
    val3 = pow(4, -1)
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
