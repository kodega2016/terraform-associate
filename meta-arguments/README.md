# Meta Arguments

There are many meta arguments in terraform,which can be used to
configure the terraform resources in different ways.

They are:

- depends_on
  This is used to explicitly define the dependencies between resources.

- count and for_each
  It allows the creation of the multiple resources of the same types.

- provider
  It allows to have multiple provider separated by alias name.

## Life Cycle meta arguments

- create_before_destroy
  It prevents the terraform default behavior(destroy before provision)

- prevent_destroy
  It prevents to destroy the resources.

- replace_triggered_by
  It replace the resoure when some of the referenced items change.

- ignore_change
  It ignore the changes on the resources.

## VPC,EC2 and webserver deployments

Steps for implementation

- Deploy a vpc and subnets
- Deploy an internet gateway and associate it with the vpc.
- Setup route table to the internet gateway.
- Deploy EC2 instance with in the provisioned subnets.
- Associate an public ip and security group that allow public ingress.
