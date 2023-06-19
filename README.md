# Cloudzone assingment

## The code include 5 modules

### VPC

- 1 Private route table
- 2 Private subnets
- 2 Public subnets
- Inputs - `vars.tf`
  - `vpc_cidr_block`
  - `instance_tenancy`
  - `enable_dns_support`
  - `enable_dns_hostnames`
  - `env`
  - `region`
  - `subnets`
- Outputs - `output.tf`
  - `vpc_id`
  - `public_subnets_ids`
  - `private_subnet_ids`

### Security Groups (sg)

- SG for ALB
- SG for ECS
- Inputs - `vars.tf`
  - `vpc_id`
  - `alb_sg_ingress`
  - `alb_sg_egress`
  - `ecs_sg_ingress`
  - `ecs_sg_egress`
- Outputs - `output.tf`
  - `sg_id_alb`
  - `sg_id_ecs`

### ALB

- Load balancer listener
- Target group
- Inputs - `vars.tf`
  - `vpc_id`
  - `alb_sg_ids`
  - `subnet_ids`
  - `tg_ecs_fargate_port`
  - `tg_ecs_fargate_protocol`
  - `tg_ecs_tg_type`
  - `enable_deletion_protection`
- Outputs - `output.tf`
  - `tg_ecs_fargate_arn`
  - `lb_dns_name`

### ECR

- Data source `aws_ecr_repository`
- VPC Endpoint
- Inputs - `vars.tf`
  - `env`
  - `region`
  - `vpc_id`
  - `vpc_endpoint_type`
  - `private_dns_enabled`
  - `private_subnet_ids`
  - `security_group_ids`
  
### ECS

- ECS Cluster
- Task definition
- ECS Service
- Inputs - `vars.tf`
  - `env`
  - `aws_account_id`
  - `image_arn`
  - `image_name`
  - `container_port`
  - `cpu`
  - `memory`
  - `desired_count`
  - `private_subnet_ids`
  - `security_group_ids`
  - `tg_ecs_fargate_arn`
