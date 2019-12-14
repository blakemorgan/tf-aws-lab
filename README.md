# Terraform and AWS Lab

Lab for the BYU IT&C 347 final project.

## Overview

Terraform allows users to create infrastructure as code before applying it to cloud services such as AWS. Network administrators can code the infrastructure they want to deploy and save it so they can easily replicate deployments. Since the infrastructure is stored as code, you also get other benefits that come with writing code such as being able to use version control and IDE support.

### Concepts

This is a lab to practice the follow techniques:

- Managing network infrastructure with infrastrucutre-as-code tools such as [Terraform](https://terraform.io).
- Accessing subnets not connected to the internet via a public bastion.
- Understanding AWS concepts.

## Objectives

- Create a load balancer accessible form the internet.
- Create two different EC2 instances fronted by the load balancer and only accessible by the load balancer.
- In a separate, private subnet, create and Aurora RDS cluster and instances and only be able to connect to it from your EC2 instances.
- Create the necessary VPC(s), subnet(s), security group(s), etc. to enforce these access controls.
- (?) Create a bastion to access the RDS cluster
- Do this all without hardcoding any IP addresses

## Lab Architecture

The following picture shows the architecture we are going to create with Terraform:

TODO: Draw infrastructure.

## Additional Resources

- [Terraform Introduction](https://www.terraform.io/intro/index.html)
- [Terraform Tutorial](https://learn.hashicorp.com/terraform)

## Improvements

- Restrict SSH access to the EC2 instances from the IT VPN. The reason we didn't do that for this lab is because we didn't know the IP range or have access to the IT VPN.