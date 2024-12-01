locals {
    val1 = log(5,2)
    val2 = log(10,2)
    val3 = log(100,12)
    ceil = ceil(local.val3)
    floor = floor(local.val3)
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
output "ceil" {
  value       = local.ceil
}
output "floor" {
  value       = local.floor
}
