SSNC PROJECT

Step01: Create Jenkins server using “terraform_code_for_jenkins” from this GitHub link 

https://github.com/moinulhuq/ssnc.git
 
EC2 - Aws
 
Jenkins Server
 
Step02: Create one pipeline job under Jenkins and locate “Jenkinsfile”. Pipeline will checkout this “terraform_code_for_eks” to create EKS cluster along with application deployment. GitHub link

https://github.com/moinulhuq/ssnc.git
 
Jenkins pipeline job
 
EKS Cluster
 
Load balancer
 
Hello world application up and running
 
CloudWatch for monitoring
 
The design of your app and other AWS services to be consumed (or would like to consume if not available on the free tier)

I intend to employ virtual machines with a robust configuration, such as the T2.LARGE instance type, which possesses significant capabilities to expedite the processing.

If this was to be implemented in a production environment, which other services would you have preferred to include

In a production environment, I would optimize the virtual machine configuration to maximize processing speed and deploy efficient monitoring tools like Prometheus or Grafana to enhance observability. As an illustration, for a Jenkins server, I would utilize a Jenkins Master and Jenkins Slave with the T2.LARGE instance type to ensure faster processing.

Your decisions on securing your service

In a DevOps context, secure services by integrating security into CI/CD pipelines, practicing secure coding in infrastructure as code, implementing access controls, scanning containers for vulnerabilities, managing secrets securely, enabling robust logging, patching systems regularly, planning for incident response, enforcing network security, and fostering a security-aware culture through education and collaboration.

Testing your microservice

Test microservices in Kubernetes by implementing unit tests for individual services, integration tests for service interactions, and end-to-end tests for overall functionality.

What types of observabilities would be useful for a productions service like this one.

For a productionized service, essential observabilities include logging for detailed records, metrics for performance monitoring, tracing for request tracking, and alerting for proactive issue detection. Continuous monitoring of infrastructure, deployment pipelines, and security is crucial for maintaining reliability and ensuring rapid incident response in a DevOps environment.

A list of nice haves that you didn’t implement because of time or cost constraints. 

A list of nice haves that can’t implement because of time or cost constraints

1) Serverless adoption for scalability.
2) Comprehensive automated testing expansion.
3) Full disaster recovery setup.
4) Advanced monitoring and analytics tools.
5) Infrastructure cost optimization.
6) Fine-grained IAM policies.

What are the limitations and opportunities to consider when scaling your solution as the usage of your web-application grows.

Limitations: Scaling introduces complexity, potential higher costs, skill set challenges, tooling limitations, and security concerns.

Opportunities: Improved availability, performance optimization, resource efficiency, automated scalability, enhanced collaboration, innovation, flexibility, global reach, continuous improvement, and support for business growth.
![image](https://github.com/moinulhuq/ssnc/assets/7439904/8e893ba8-32ef-45c5-a130-5e73301de119)
