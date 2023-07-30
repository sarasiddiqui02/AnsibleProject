# AnsibleProject

This playbook will create an AWS VPC, an internet gateway, a public subnet, a private subnet, and security groups for API and database servers. The database security group will allow incoming traffic from the API security group, and the API security group will allow incoming traffic from the public internet or an application load balancer.

Please note that the above playbook assumes you have set up the AWS credentials and Ansible AWS modules properly. The playbook is designed to run on the localhost, and the tasks will interact with AWS to create the resources.

After creating the playbook, you can execute it using the ansible-playbook command:

ansible-playbook app-infrastructure.yml
