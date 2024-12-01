# Terraform Partial Backend
We can also setup partial backend,so we can set it by passing from cli.

```bash
terraform init -backend-config="key=partial-backend"
```
For example, we can set the key to partial-backend, so it will create a file with the name partial-backend.tfstate.

```bash
terraform init -backend-config="dev.s3.tfbackend"