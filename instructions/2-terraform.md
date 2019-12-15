# Terraform

Terraform is written in the HashiCorp Configuration Language. It defines, in code, the resources you want to have in the cloud. It works with Microsoft Azure, Google Cloud Platform, and Amazon Web Services.

## Syntax

- There are three types of objects you'll define with Terraform:
   - `data`: Retrieve information from exisiting cloud resources
   - `resources`: Resoruces you define to be created and managed in the cloud
   - `provider`: The library you include in your Terraform file to you can access the cloud providers API
- An example of a Terraform object:

```terraform
# Resource or Data objects
{resource|data} "resource_type" "reference_name" {
   property = "value"
   ...
}

# Provider Objects
provider "provider_type" {
   property = "value"
}
```

## Define the Resources

The instructions below will guide you in making the resources you need with Terraform. Click the links in the instructions to take you to the Terraform documentation which explain the resource type and properties of that type you've been asked to create.

1. Create a folder to write your Terraform scripts in.
2. Create `main.tf`. In this file you'll define the Terraform provider for AWS which is what give you access to the API Terraform uses to create resources in AWS.
3. *Networks*: Next we need to create the Virutal Private Cloud and additional networking resources for that VPC:
   - Create a Terraform file called `networks.tf`
   - Create a [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html) with a CIDR block of 172.20.0.0/16.
   - Create three [subnets](https://www.terraform.io/docs/providers/aws/r/vpc.html) in the newly created VPC: one accessible by the internet and two with no connection to the internet.
   - Create an [internet gateway](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html) for your new VPC.
   - Create a [route table](https://www.terraform.io/docs/providers/aws/r/route_table.html) with a [route table association](https://www.terraform.io/docs/providers/aws/r/route_table_association.html) connecting your public subnet to the internet gateway.
   - Create a [security group](https://www.terraform.io/docs/providers/aws/r/security_group.html) allowing SSH, HTTP, and MySQL access into your VPC and all outbound connections.
4. *Compute*: Now we will create the EC2 instances and elastic load balancer.
   - Create a Terraform file called `compute.tf`
   - Create an SSH key pair: `ssh-keygen -t rsa -b 4096`
   - Upload that key pair to AWS by creating a [key pair](https://www.terraform.io/docs/providers/aws/r/key_pair.html) resource.
   - Create an [EC2 Instances](https://www.terraform.io/docs/providers/aws/r/instance.html) with the following characteristics:
      - Based of the [Amazon Linux AMI](https://aws.amazon.com/amazon-linux-ami/)
      - `t2.micro` instance type
      - Connected to the key pair you created
      - Monitoring enabled
      - Connected to be VPC security group that was created. You'll want to use the `vpc_security_group_ids` and not the `secuiryt_groups` property.
      - Placed into the public subnet
5. *Database*: Last, we need to create an RDS database custer with two RDS instances (one master and one slave).
   - Create a [KMS key](https://www.terraform.io/docs/providers/aws/r/kms_key.html) to encrypt the database 
   - Create a database subnet group from the private subnet.
   - Create an RDS cluster with encrypted storage, in the security group you created in step three, and with the database subnet group you just created. It should be the `aurora-mysql` engine type.
   - Create two database instance in the cluster with the type `db.m5.large`.
   
## Create the Resources

Now that the resources have been defined in code, we need to deploy them to AWS. All we need to do is run the Terraform commands in a command line. Terraform is smart enough to combine all the Terraform files and prioritize what resources need to be made when.

1. In a terminal, navigate to the directory where the Terraform files are.
2. Run `aws2 configure` again if you need to reconnect your command line to AWS.
3. Run `terraform init` to initialize that terraform directory.
4. Run `terraform apply` to create the resources in AWS. When you run that command, you'll be prompted with a plan which is a blueprint of the resources that will be made in AWS with their associated properties. Type `yes` when prompted to confirm the creation of those resources. When you run those commands, a folder (`.terraform`) will be created along with a `terraform.tfstate` file. Those files contain key, access ID's, and other confidential information that should not be shared. For example, if using version control, be sure to ignore that folder and those files.

Using infrastructure-as-code does sacrifice the convenience of a graphic console, but does given you the added bonus of being able to document your infrastructure. That being said, you may run into a few errors applying this infrastructure. These errors are not a problem with Terraform itself, but are comprable to the same errors that would appear if you tried to make resources with that configuration in the console GUI.

## Additional Resources

- [Creating a VPC with an Internet Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)
- [Amazon Linux AMI ID's](https://aws.amazon.com/amazon-linux-ami/)
- [AWS EC2 Instances](https://aws.amazon.com/ec2/instance-types/)
- [AWS Key Management Service](https://aws.amazon.com/kms/)
- [AWS Relational Database Service](https://aws.amazon.com/rds/)