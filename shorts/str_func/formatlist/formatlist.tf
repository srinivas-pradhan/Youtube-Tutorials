locals {
    val1 = formatlist("Hello, %s!", ["Valentina", "Ander", "Olivia", "Sam"])
    val2 = formatlist("%s, %s!", "Salutations", ["Valentina", "Ander", "Olivia", "Sam"])
}

output "val1" {
  value       = local.val1
}
output "val2" {
  value       = local.val2
}
