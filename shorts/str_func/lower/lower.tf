locals {
    val1 = lower("HELLO")
    val2 = lower("АЛЛО!")
}

output "val1" {
  value       = local.val1
}
output "val2" {
  value       = local.val2
}
