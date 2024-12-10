locals {
    val1 = "My name is Srinivas Pradhan.\n I am an SRE."
}

output "first_name" {
  value       = indent(2, local.val1)
}
