# Terraform Associate

In this series of posts,i am exploring the terraform basics.So basically
terraform is a tool for building,changing and versioning infrastructure
safely and efficiently.A tool for infrastructure as code.

## Terraform CLI

In this section, we will explore the terraform CLI commands.We will perform
the following operations:

- init
- plan
- apply

**_init_**:
The `init` command is used to initialize the terraform in the working directory.
It will download the required providers and dependencies for the terraform.

It will also create a hidden directory `.terraform` in the working directory
which will contain the plugins and other files.

The `init` command also create a `terraform.tfstate` file which will contain
the state of the infrastructure.

**_plan_**:
After initializing the terraform,we can write configuration code in the
the `.tf` files.The `plan` command is used to create an execution plan.

It will preview the changes that will be made to the infrastructure.

apply:
The final step is to apply the changes to the infrastructure.The `apply` command.
it will read the `.tf` files and apply the changes to the infrastructure.

We can also validate teh terraform configuration files using the `validate` command.

```bash
terraform validate
```

And format the configuration files using the `fmt` command.

```bash
terraform fmt
```

The `terraform.lock.hcl` file is used to lock the provider versions.
It is like a `package-lock.json` file in node.js.
