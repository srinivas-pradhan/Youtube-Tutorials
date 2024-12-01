locals {
    val1 = join("-", ["foo", "bar", "baz"])
    val2 = join(", ", ["foo", "bar", "baz"])
    val3 = join(", ", ["foo"])
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
