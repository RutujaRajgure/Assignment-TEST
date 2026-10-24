## High-Level Architecture

In this project, I used AWS services to build and deploy a web application. I used Terraform to create the infrastructure and configured the network, application servers, database, and security.

* **Amazon VPC:** Created a separate network with public and private subnets across two Availability Zones.
* **Application Load Balancer:** Distributes incoming traffic between the application instances.
* **EC2 Auto Scaling Group:** Manages the EC2 instances and helps replace unhealthy instances when needed.
* **Amazon RDS (MySQL):** Provides a managed database in the private subnets.
* **NAT Gateway:** Allows resources in private subnets to access the internet for outbound traffic.
* **AWS Secrets Manager:** Stores the database credentials securely.
* **Amazon S3:** Used for application storage and ALB access logs.
* **AWS Certificate Manager (ACM):** Used to manage the SSL/TLS certificate for HTTPS.
* **IAM and Security Groups:** Help control access to AWS resources and manage network traffic.
* **Terraform:** Used to create and manage the AWS infrastructure through code.
* **GitHub Actions:** Used to automate the Terraform workflow.

### Request Flow

A user accesses the application through the load balancer. The load balancer forwards requests to the EC2 instances, and the application can connect to the MySQL database in RDS when database access is required.

The main goal of this setup is to keep the database and application servers in private subnets, control access through security groups, and make the application easier to manage and scale.


## GitHub Actions Workflow

I used GitHub Actions to automate the Terraform workflow for this project. Whenever I push changes to the repository, the workflow can check the Terraform configuration and verify that it is valid before deployment.

The workflow includes these steps:

1. **Checkout:** Downloads the repository code into the GitHub Actions runner.
2. **Configure AWS credentials:** Connects to AWS using securely stored GitHub repository secrets.
3. **Set up Terraform:** Installs the required Terraform version.
4. **Terraform Format:** Checks the formatting of the Terraform files.
5. **Terraform Init:** Initializes Terraform and downloads the required provider plugins.
6. **Terraform Validate:** Checks the Terraform configuration for errors.
7. **Terraform Plan:** Previews the infrastructure changes before they are applied.
8. **Terraform Apply:** Deploys the approved infrastructure changes to AWS.

The workflow helps reduce manual steps and makes infrastructure deployment more consistent.
