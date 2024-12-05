locals {
  even_map = {
    for key, value in var.numbers_map : key => value * 2 if value % 2 == 0
  }
  doubles_map = {
    for key, value in var.numbers_map : key => value * 2
  }

  users_map = {
    for user_info in var.users : user_info.role => user_info.username...
  }

  users_map_with_roles = {
    for role, username in local.users_map : role => {
      users = username
    }
  }

  roles = var.users[*].role
}

output "results" {
  value = {
    even_map    = local.even_map
    doubles_map = local.doubles_map
    users_map   = local.users_map
    users_map_with_roles : local.users_map_with_roles
    roles = local.roles
  }
}
