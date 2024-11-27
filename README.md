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

We can also validate the terraform configuration files using the `validate` command.

```bash
terraform validate
```

And format the configuration files using the `fmt` command.

```bash
terraform fmt
```

### Terraform Init

The `terraform.lock.hcl` file is used to lock the provider versions.
It is like a `package-lock.json` file in node.js.

If any conflict occured during the initalization after upgrading the provider version,
we can use

```bash
terraform init --upgrade
```

It will upgrade to the most recent version.

### Terraform plan

We can use the `terraform plan` command to create an execution plan.
Also it can be save using the `-out` flag.

```bash
terraform plan -out=plan.out
```

After saving the plan, we can apply the plan using the `apply` command.

```bash
terraform apply plan.out
```

We can view the plan detail using

```bash
terraform show "plan_name"
terraform show -json "plan_name"
```

We can use the `jq` tools to parse the json output.

```bash
terraform show -json "plan_name" | jq
terraform show -json "plan_name" | jq .terraform_version
```

We also can create destroy plan using the `destroy` command.

```bash
terraform plan -destroy -out=destroy.plan
terraform apply destroy.plan
```

### Terraform Apply

We can use terraform apply to apply the changes to the infrastructure.

```bash
terraform apply
```

After applying the changes, we can destroy the infrastructure using
the `destroy` command.

```bash
terraform destroy
```

we can list the current state using the `state` command.

```bash
terraform state list
```

If any unhealthy state is found,we can replace command to replace the resource.

```bash
terraform apply -replace="resource_name"
terrafrom apply -replace="local_file.file"
```

## Terraform Variables

We can use the variables in terraform configuration files to make it more
flexible and reusable.

We use the `variable` block to define the variables.

```hcl
variable "region" {
  type = string
  default = "us-east-1"
}
```

We can use that variable in the resource block.

```hcl
resource "aws_instance" "example" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  availability_zone = var.region
}
```

We can use the `-var` flag to pass the variable value.

```bash
terraform apply -var="region=us-west-1"
```
