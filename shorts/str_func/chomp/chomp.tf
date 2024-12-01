locals {
    val1 = chomp("My Name is Srinivas.\n")
    val2 = chomp("My Last Name is Pradhan.\r\n")
    val3 = chomp("My Name is Srinivas.\n\n")
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
