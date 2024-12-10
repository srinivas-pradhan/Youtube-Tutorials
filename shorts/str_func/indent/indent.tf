locals {
    val1 = "My name is Srinivas Pradhan.\n I am an SRE."
}

output "val1" {
  value       = indent(2, local.val1)
}

output "val2" {
  value       = indent(4, local.val1)
}
