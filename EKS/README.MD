#Installation process for creating an EKS cluster using Jenkins which is installed on an EC2 instance which we created using the Directory jenkins-server.
1. Login to Jenkins using the public ip and port 8080 (eg. 54.78.184.205:8080)
use sudo cat /var/lib/jenkins/secrets/initialAdminPassword to get your admin password for first time login to Jenkins Server.
2. Install all addons that you might need for your Jenkins Application.
3. Go to Manage Jenkins- Credentials and add your AWS user credentials (AWS_ACCESS_KEY_ID and SECRET Key)
4. Create New Task and choose type = pipeline.
5. Add parameterized option and add parameters. (REGION, VPC_ID, CLUSTER_NAME) also add Parameter Choice (ACTION = apply or destroy)
6. Add Script that you want to run from jenkinsfile.
