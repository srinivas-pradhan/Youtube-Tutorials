locals {
    val1 = endswith("hello world", "world")
    val2 = endswith("hello world", "hello")
}

output "val1" {
  value       = local.val1
}
output "val2" {
  value       = local.val2
}
