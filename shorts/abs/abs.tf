locals {
    dec_abs = abs(23)
    zero_abs = abs(0)
    fl_abs = abs(12.2)
    neg_abs = abs(-1211.2)
}

output "dec_abs" {
  value       = local.dec_abs
}
output "zero_abs" {
  value       = local.zero_abs
}
output "fl_abs" {
  value       = local.fl_abs
}
output "neg_abs" {
  value       = local.neg_abs
}
