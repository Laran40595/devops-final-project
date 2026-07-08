# DevOps Final Project - Cloud Portfolio Deployment

## Project Overview

This project demonstrates a complete end-to-end DevOps workflow by containerizing a portfolio website, automating deployment processes, and hosting the application on AWS cloud infrastructure.

The project covers:

- Source Code Management using Git and GitHub
- CI/CD automation using Jenkins
- Containerization using Docker
- Docker image management using Docker Hub
- Infrastructure as Code using Terraform
- AWS EC2 cloud deployment
- Nginx web hosting inside a Docker container

The final application is deployed on AWS EC2 and publicly accessible.

---

# Project Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
Jenkins CI/CD Pipeline
    |
    v
Docker Image Build
    |
    v
Docker Hub Registry
    |
    v
Terraform Infrastructure
    |
    v
AWS EC2 Instance
    |
    v
Docker Container
    |
    v
Nginx Portfolio Website
Technologies Used
Cloud
AWS EC2
AWS VPC
AWS Security Groups
AWS Internet Gateway
DevOps Tools
Git
GitHub
Jenkins
Docker
Docker Hub
Terraform
Ansible
Application
HTML5
CSS3
Nginx
Repository Structure
devops-final-project/

├── portfolio/
│   ├── Dockerfile
│   ├── nginx.conf
│   ├── index.html
│   └── style.css
│
├── terraform/
│   └── main.tf
│
├── ansible/
│
├── java-app/
│
├── screenshots/
│
├── Jenkinsfile
├── docker-compose.yml
└── README.md
Local Docker Deployment

Build Docker image:

docker build -t portfolio-app ./portfolio

Run the application locally:

docker run -d \
-p 3000:80 \
--name portfolio-app-container \
greatmike1/portfolio-app:latest

Access the application:

http://localhost:3000

Check running containers:

docker ps
Docker Hub Deployment

Docker image:

greatmike1/portfolio-app:latest

Pull image:

docker pull greatmike1/portfolio-app:latest

Run container:

docker run -d \
-p 80:80 \
--name portfolio-app \
greatmike1/portfolio-app:latest
Jenkins CI/CD Pipeline

Jenkins automates the application workflow.

Pipeline stages:

Checkout source code from GitHub
Build application
Build Docker image
Push image to Docker Hub
Deploy application

Jenkins runs using Docker:

Jenkins Container
Port: 8080

Access Jenkins:

http://localhost:8080
Terraform AWS Infrastructure

Terraform provisions AWS infrastructure automatically.

Resources created:

VPC
Public Subnet
Internet Gateway
Route Table
Security Group
EC2 Instance

Terraform commands:

Initialize:

terraform init

Validate:

terraform validate

Format:

terraform fmt

Plan:

terraform plan

Deploy:

terraform apply

Check output:

terraform output
AWS EC2 Deployment

Application hosting environment:

Amazon Linux 2023 EC2

Docker container:

greatmike1/portfolio-app:latest

Application port:

HTTP Port 80

Deployment:

docker pull greatmike1/portfolio-app:latest

Run:

docker run -d \
-p 80:80 \
--name portfolio-app \


Cloud Engineer | AWS | DevOps
