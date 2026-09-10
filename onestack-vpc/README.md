Single working directory: onestack-vpc

This directory contains a root Terraform configuration that calls the onestack/aws_vpc module twice to create two VPCs in a single Terraform Cloud workspace.

Files:
- main.tf       - remote backend configured for organization `onestack`, workspace `onestack-vpc`, and module calls for vpc_a and vpc_b
- variables.tf  - variables for both VPCs (CIDRs, AZs, tags, region)

Repository layout recommendation
- Keep this directory at path /onestack-vpc in the repository and set the Terraform Cloud workspace working directory to /onestack-vpc.

Terraform Cloud workspace settings
- Organization: onestack
- Workspace name: onestack-vpc
- Working directory: onestack-vpc (set in workspace Settings -> General -> Terraform working directory)

Workspace variables to create (Type = Terraform variable).
- region => ap-south-1
- tags => {"Environment"="production","Project"="onestack"}

VPC A variables
- vpc_a_name => onestack-vpc-a
- vpc_a_vpc_cidr => 10.0.0.0/16
- vpc_a_backend_az => ap-south-1a
- vpc_a_backend_subnet_cidr => 10.0.1.0/24
- vpc_a_db_az => ap-south-1b
- vpc_a_db_subnet_cidr => 10.0.2.0/24

VPC B variables
- vpc_b_name => onestack-vpc-b
- vpc_b_vpc_cidr => 10.1.0.0/16
- vpc_b_backend_az => ap-south-1a
- vpc_b_backend_subnet_cidr => 10.1.1.0/24
- vpc_b_db_az => ap-south-1b
- vpc_b_db_subnet_cidr => 10.1.2.0/24

Note: the published module only creates backend and db private subnets; there are no public subnet inputs for this module.

How to proceed in Terraform Cloud
1. In the workspace settings (onestack/onestack-vpc), set Working directory to onestack-vpc.
2. In Variables -> Terraform Variables, add the variables above (Type = Terraform variable).
3. Ensure AWS credentials are set as Environment variables in the workspace (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) and mark them Sensitive.
4. Queue a run. Review plan and apply.

If you want, I can:
- Add outputs to capture created subnet CIDRs/IDs (if module exposes them)
- Generate API (curl) templates to create the workspace variables programmatically
- Commit and push these files into your existing GitHub repo and show exact steps to set the workspace working directory
