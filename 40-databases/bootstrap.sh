#!/bin/bash

dnf install ansible -y 
cd /home/ec2-user     
git clone https://github.com/JanakiRaoKona/ansible-roboshop-v3.git
cd ansible-roboshop-v3
git pull # when you running the file 2nd time if any changes happend in the repo it will be pull 
ansible-playbook main.yaml -e component="mongodb"