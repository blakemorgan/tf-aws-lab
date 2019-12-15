# Testing/Cleanup

Now that the resources have been provisioned in AWS we need to test them.

## Test Scenarios

### Database in Private Subnet

First we need to check that our database was correctly deployed to the private subnet. We can do that by trying to connect to our database from our local machine.

1. Log into the AWS console, navigate to RDS, and click "DB Clusters". On that page click the DB cluster you created and make note of the endpoint URL for the writer.
2. Using your MySQL client, try connecting to your RDS cluster with the URL you just copied, and the username and password you specified in your RDS Terraform file. If the connection fails, then you know you're database cluster is in the correct subnet.

### Access your VPC from the internet.

We need to be sure our VPC is accessible over the internet. We can check that simply by SSH'ing into our EC2. In the AWS console, go to the EC2 dashboard and click "Running Instances". Select the EC2 instance created by your Terraform scripts and click the connect button. Make sure the radio button next to "A standalone SSH client" is selected and follow those instructions. We want to connect from a standalone SSH client so that we can test connecting to our VPC via the internet **Note**: the name of your private key file is the name of the file you created when you ran `ssh-keygen`, not "ec2-access-key.pem".

If you can connect to that EC2 instance, then you know your VPC, subnets, internet gateways, and security groups are setup correctly.

### Access your private subnet from your EC2 instance. 

We can test that our subnets are setup correctly by connecting to our RDS cluster from our EC2 instance. 

1. Install MySQL on the EC2 instance with `sudo yum install mysql`
2. Connect to the RDS cluster with `mysql -h {rds-cluster-endpoint} -u {username in *.tf file} -p` and type in the password.

## Cleanup

After you've passed-off the lab, simply run `terraform destroy` then all the resources created by this project will be deleted. That saves you additional costs from having these now redundant resources running. After typing that command you'll be presented with the plan showing that Terraform will destroy all your resources. Simply type "yes" to confirm deletion.