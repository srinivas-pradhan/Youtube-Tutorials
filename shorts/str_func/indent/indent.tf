locals {
    val1 = "My name is Srinivas Pradhan."
}

output "first_name" {
  value       = indent(2, local.val1)
}
