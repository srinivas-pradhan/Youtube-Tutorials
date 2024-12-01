locals {
    val1 = parseint("100", 10)
    val2 = parseint("FF", 16)
    val3 = parseint("-10", 16)
    val4 = parseint("1011111011101111", 2)
    val5 = parseint("aA", 62)
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
output "val4" {
  value       = local.val4
}
output "val5" {
  value       = local.val5
}


# Fail Case 
# On console pls execute - passing a non-binary string to base 2.
# This fails as the `parseint` function correctly fails to parse the non-binary string. 
# `terraform console`
# parseint("12", 2)

