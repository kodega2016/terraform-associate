locals {
  even_map = {
    for key, value in var.numbers_map : key => value * 2 if value % 2 == 0
  }
  doubles_map = {
    for key, value in var.numbers_map : key => value * 2
  }
}

output "results" {
  value = {
    even_map    = local.even_map
    doubles_map = local.doubles_map
  }
}
