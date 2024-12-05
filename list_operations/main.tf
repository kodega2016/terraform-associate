locals {
  double_numbers = [for num in var.numbers_list : num * 2]
  even_numbers   = [for num in var.numbers_list : num % 2 == 0]
  first_names=[for name in var.objects_list:name.firstname]
}

output "results" {
  value = {
    double_numbers = local.double_numbers
    even_numbers   = local.even_numbers
    first_names=local.first_names
  }
}
