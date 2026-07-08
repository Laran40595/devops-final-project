#!/bin/bash

mkdir -p screenshots

echo "Docker Containers" > screenshots/docker-status.txt
docker ps >> screenshots/docker-status.txt

echo "Terraform Output" > screenshots/terraform-output.txt
cd terraform
terraform output >> ../screenshots/terraform-output.txt
cd ..

echo "AWS EC2 Instance" > screenshots/aws-instance.txt
aws ec2 describe-instances \
--query "Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress]" \
--output table >> screenshots/aws-instance.txt

echo "AWS Security Group" > screenshots/security-group.txt
aws ec2 describe-security-groups \
--group-name portfolio-security-group \
--output table >> screenshots/security-group.txt

echo "Done!"
