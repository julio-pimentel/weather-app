# Weather-App Application repository

This repository is used to deploy the weather-app in the Contino APAC AWS account. It requires the following aws credentials to be updated in Github Secrets before deploying this repo: `ACCOUNT_ID` `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_SESSION_TOKEN`.
This project should deployed after the infrastructure is setup. 

<br> 

## 3 Musketeers

The provided `makefile`, `dockerfile` , and `docker-compose.yml` files work together to create a docker container which is used to run Terraform deployments and other supported commands. It expects AWS account credentials to be passed as environment variables.

To run a simple aws command, ensure you have set your aws temporary credentials in your local environment and run the following

```
make list_bucket
```

The weather-app requires a Docker Image in the ECR repository, the following command will push the latest weather-app-dockerfile. 

```
make push_docker_image
```

Destroying the Docker Image will be required to destroy the infrastructure. 
```
make destroy_docker_image
```

Deploying Terraform environment locally - creates tfplan file during plan as input to apply. Apply is auto-approved.

```
make run_plan
make run_apply
```

Destroying Terraform environment locally. Destroy plan is speculative. Destroy apply is auto-approved.

```
make run_destroy_plan
make run_destroy_apply
```
Terraform `init`, `validate` and `fmt` are run for each of the `make` commands above.

For more information on 3 Musketeers deployment method, visit the official site here. https://3musketeers.io/

<br> 

## GitHub Actions / Workflows
The following workflows are provided in this repository. These are located under `.github/workflows`.

| Workflow | Description | Environments | Trigger
|----------|-------------|--------------|--------|
| build_cont.yml | One step workflow to push a Docker Image in a ECR Repository. | none | on.opush.branch [master] ||
| main.yml | Two step workflow to run a Terraform Plan and Terraform Apply following manual approvals. | approval | on.push.branch [master] ||
| destroy.yml | Two step workflow to run a speculative Terraform Destroy Plan and Terraform Destroy following manual approvals. | approval | on.push.branch [destroy] ||

Note: Pushing to `master` branch will trigger Terraform (TF) deploy. You will also need to create a branch named `destroy` in your GitHub repository. Not required locally and only used for pull requests `master -> destroy` to trigger TF destroy workflow.

Additionally, changes to the following files and paths will trigger a the main workflow.

```
    paths:
      - 'docker-compose.yml'
      - 'Makefile'
      - '.github/workflows/**'
      - '*dockerfile'
      - 'modules/**'
      - '**.tf'
```

Finally, changes to the following files and paths will trigger a the build_cont workflow.

```
    paths:
      - 'weather-app-dockerfile'
      - 'Makefile'
      - '.github/workflows/build_cont'
```

<br>

## Terraform IaC
The weather-app is based on the following Terraform modules: 
* ECS: 1 ECS Task, 1 ECS Cluster, 1 ECS Service, and 3 Auto Scaling Policies. 
* Load Balancer: 1 Load Balancer, 1 Load Balancer Target Group, and 1 Load Balancer Listener. 

### Inputs
---
<details open>
  <summary>Click to expand</summary>


| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpc_id | VPC ID from Parameter Store | string | weather-app-pimentel/infra/vpc/vpc_id | yes |
| priv_cidr_id_a | Private subnet A ID from Parameter Store | string | weather-app-pimentel/infra/vpc/priv_cidr_id_a | yes |
| priv_cidr_id_b | Private subnet B ID from Parameter Store | string | weather-app-pimentel/infra/vpc/priv_cidr_id_b | yes |
| priv_cidr_id_c | Private subnet C ID from Parameter Store | string | weather-app-pimentel/infra/vpc/priv_cidr_id_c | yes |
| pub_cidr_id_a | Public subnet A ID from Parameter Store | string | weather-app-pimentel/infra/vpc/pub_cidr_id_a | yes |
| pub_cidr_id_b | Public subnet B ID from Parameter Store | string | weather-app-pimentel/infra/vpc/pub_cidr_id_b | yes |
| pub_cidr_id_c | Public subnet C ID from Parameter Store | string | weather-app-pimentel/infra/vpc/pub_cidr_id_c | yes |
| aws_region | Region where the project will be deployed | string | us-east-1 | yes |
| lb_name | Load Balancer name | string | weather-app-pimentel-lb | yes |
| lb_tg_name | Load Balancer Target Group name | string | weather-app-pimentel-lb-tg | yes |
| lb_sg_id | Security group for LB ID from Parameter Store | string | weather-app-pimentel/infra/sg/lb_sg_id | yes |
| ecs_tasks_sg_id | Security group for ECS Task ID from Parameter Store | string | weather-app-pimentel/infra/sg/ecs_tasks_sg_id | yes |
| ecs_task_family | ECS Task Family name | string | weather-app-pimentel-fam | yes |
| ecs_task_execution_role_arn | ECS Task Execution Role ARN from Parameter Store | string | weather-app-pimentel/infra/ecr/ecs_task_execution_role_arn | yes |
| ecs_cluster_name | ECS Cluster name | string | weather-app-cluster-pimentel | yes |
| ecs_service_name | ECS Service name | string | weather-app-service-pimentel | yes |
| ecr_repository_url | ECR Repository URL from Parameter Store | string | weather-app-pimentel/infra/ecr/ecr_repository_url | yes |
| container_port | Container port | number | 3000 | yes |
| container_cpu | Container CPU | string | 256 | yes |
| container_memory | Container memory | string | 512 | yes |
| container_name | Container name | string | weather-app | yes |
| ssm_prefix | Prefix for SSM Parameter Store | string | weather-app-pimentel | yes | 

</details>

<br> 

<!-- OUTPUTS -->
### Outputs
---
<details open>
  <summary>Click to expand</summary>

| Name | Description |
|------|-------------|
| lb_dns_name | Load Balancer DNS name | |
| lb_tg_arn | Load Balancer Target Group ARN | |
| ecs_task_arn | ECS Task ARN | |


</details>

<br>

### TF State Files
AWS S3 is used to host the TF state files. This is hosted by s3://pathways-dojo. You will need to update the name of the state file in the `meta.tf` file replacing `<username>` with your username.

```
terraform {
  required_version = ">= 0.13.0"
  backend "s3" {
    bucket = "pathways-dojo"
    key    = julio-pimentel-tfstate-main
    region = "us-east-1"
  }
}
```

## Node Weather App

The simple weather forecast application using Node.js.
Link: https://github.com/phattp/nodejs-weather-app

### Getting Started

This repository is contain code of my weather forecast application that you can predict the weather from a location.
This project is the part of [The Complete Node.js Developer Course](https://www.udemy.com/the-complete-nodejs-developer-course-2/) by Andrew Mead on Udemy.

Visit [Live Site](https://phatt-weather-app.herokuapp.com/)

### Installing

Install node modules.

```
npm install
```

### Running the App

Run this app in devlopment mode with command below and navigate to http://localhost:3000 to see the app.

```
npm run dev
```