locals {
    dec_val = ceil(5)
    frac_val = ceil(5.1)
    frac_val2 = ceil(5.9)
}

output "dec_val" {
  value       = local.dec_val
}
output "frac_val" {
  value       = local.frac_val
}
output "frac_val2" {
  value       = local.frac_val2
}
