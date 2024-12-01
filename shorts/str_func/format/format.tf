locals {
    val1 = format("Hello, %s!", "Ander")
    val2 = format("There are %d lights", 4)

    name = "Srinivas"
    val3 = format("Hello, %s!", local.name)

    # Verb Example from Documentation
    # https://developer.hashicorp.com/terraform/language/functions/format#verbs
    verb1 = format("%#v", "hello")
    verb2 = format("%#v", true)
    verb3 = format("%#v", 1)
    verb4 = format("%#v", {a = 1})
    verb5 = format("%#v", [true])
    verb6 = format("%#v", null)
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

output "verb1" {
  value       = local.verb1
}
output "verb2" {
  value       = local.verb2
}
output "verb3" {
  value       = local.verb3
}
output "verb4" {
  value       = local.verb4
}
output "verb5" {
  value       = local.verb5
}
output "verb6" {
  value       = local.verb6
}
