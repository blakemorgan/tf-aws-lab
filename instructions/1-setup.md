# Setup

Follow these instructions to prepare your computer with the tools you need for the lab.

## AWS Account

1. Join [AWS Educate](https://aws.amazon.com/education/awseducate/)
2. Once your account is approved and created, log into the [AWS Console](https://console.aws.amazon.com/console/home) with your new account.
3. In the “Find Services” text box, search for “IAM” and press enter. IAM stands for *Identity and Access Management* and is how Amazon keeps track of users, roles, and policies for each account.
4. Click the “Add User” button. In the username box, type “{NetID}-cli” and then check the box next to “Programmatic access”
5. On the next page, click the box that says “Attach existing policies directly”, search for AdministratorAccess, and check the box next to it.
6. You can leave the default options the same for the rest of the user creation pages. Click the next button, then review, then finish. You should see a table with the name of the user you created, the access key ID, and the secret access key. Save these, as you will not be able to see them all again.

## AWS CLI

1. Download and install the [AWS CLI v2](https://aws.amazon.com/cli/). Clicking on that link will take you to the homepage of the CLI and install instructions can be found in the rightmost column.
2. After installing the AWS CLI, run `aws configure` in a command line. Paste your access key ID and secret access key when prompted. For the region, type “us-west-2” and for the default output format, type “json”.
3. Check that you’re logged into AWS via the CLI by running the command `aws sts get-caller-identity`. If you see a response like this, you’re successfully logged in:

```json
{
    "Account": "486277818405",
    "UserId": "AIDAXCODKVASUUNFMWIEC",
    "Arn": "arn:aws:iam::486277818405:user/btm296-cli"
}
```

## Install Terraform

1. Download the [Terraform CLI tool](https://www.terraform.io/downloads.html).
2. Unzip the downloaded file and place it in your path.
3. If you want to use an IDE, make sure to install the respective Terraform plugin and that it supports Terraform v0.12. IntelliJ by JetBrains has been the most helpful for me, which you can get for free [as a student](https://www.jetbrains.com/student/).

## MySQL Client & SSH Client

When it comes time to test you network, you will need to use an SSH and MySQL client. You can find a myriad of those clients online. Pick any that work for you.
