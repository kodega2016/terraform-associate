locals {
  name = "Khadga Shrestha"
  age  = 27
}

output "results" {
  value = {
    is_starts_with_k = startswith(local.name, "K")
    square_age       = pow(local.age, 2)
    users            = yamldecode(file("${path.module}/users.yaml"))
  }
}
