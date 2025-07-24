# 🧠 EKS-TF-AI-Inference-App

This project provisions a containerized AI inference application using **Terraform**, **Amazon EKS**, **Kubernetes**, and **Docker**. The Python Flask app is containerized with Docker, pushed to **Amazon ECR**, and deployed to **Amazon EKS** using Kubernetes manifests. Infrastructure is provisioned entirely using Terraform.

> A real-world lab showcasing full-stack DevOps: Docker + Terraform + Kubernetes on AWS EKS.

---

## 🌐 Overview

This hands-on lab demonstrates an end-to-end DevOps workflow for deploying a microservice on AWS using:

- ✅ A Flask-based AI inference app containerized with Docker  
- ✅ Amazon ECR to store and manage container images  
- ✅ Amazon EKS for managed Kubernetes orchestration  
- ✅ Terraform for Infrastructure as Code (IaC) provisioning  
- ✅ Kubernetes manifests (`Deployment`, `Service`) to run and expose the app  

---

## 📁 Directory Structure

```text
eks-tf-ai-inference-app/
│
├── app/                     # Flask app (app.py, requirements.txt)
├── k8s/                     # Kubernetes manifests (deployment.yaml, service.yaml)
├── terraform/               # Terraform configs for EKS, IAM, networking
├── Dockerfile               # Container definition for Flask app
├── iam-auth.yaml            # Optional RBAC mapping for EKS access
├── README.md
```

---

## 🛠️ Technologies Used

- **Terraform (v1.6+)**
- **AWS EKS**
- **Amazon ECR**
- **Kubernetes**
- **Docker**
- **Flask (Python)**

---

## 🧪 Steps to Reproduce

1. **Build and Push Docker Image to ECR**

   ```powershell
   docker build -t ai-flask-app .
   aws ecr get-login-password | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<region>.amazonaws.com
   docker tag ai-flask-app <your-ecr-repo-uri>
   docker push <your-ecr-repo-uri>
   ```

2. **Provision Infrastructure with Terraform**

   ```powershell
   cd terraform
   terraform init
   terraform apply
   ```

3. **Configure AWS Auth for kubectl Access**

   ```powershell
   kubectl apply -f aws-auth.yaml
   ```

4. **Deploy Kubernetes Resources**

   ```powershell
   kubectl apply -f ../k8s/deployment.yaml
   kubectl apply -f ../k8s/service.yaml
   ```

5. **Verify Application Access**

   ```powershell
   kubectl get svc
   ```

   Visit the LoadBalancer DNS in your browser or test with `curl`.

---

## 🔒 Security Considerations

- IAM roles were scoped minimally for EKS administration  
- No public access to ECR  
- Secrets were not hardcoded — `.env` and `.tfvars` are ignored via `.gitignore`  
- Infrastructure teardown is enforced to avoid zombie resources  

---

## 📉 Teardown / Cost Control

To avoid charges, destroy infrastructure after testing:

```powershell
terraform destroy
```

Confirm:

- 🧹 Load Balancer and ECR are deleted  
- 🧹 No NAT Gateways or Elastic IPs remain  

---

## ✅ Expected Result

```
AI Inference App Running
```

You should see the message above when accessing the LoadBalancer. This confirms the container was deployed successfully on EKS and exposed publicly.

---

## 💡 Highlights and Troubleshooting

- Fixed `kubectl` access by attaching `AmazonEKSClusterAdminPolicy` to IAM user  
- Cleanly structured repo with `.gitignore` to protect sensitive data  
- Demonstrated full CI/CD lifecycle from image build to production-grade deployment  

---

## 🗣️ Interview Talking Points

- Provisioned scalable infrastructure with Terraform  
- Built and pushed Docker images to ECR  
- Deployed Kubernetes workloads to EKS  
- Configured IAM, RBAC, and LoadBalancer for public access  
- Enforced secure practices (least privilege, no hardcoded secrets)  
- Resolved real-world IAM and cluster access issues  

---

## 🔗 Author

**Dillon Marcelin**  
📍 GitHub: [@DM-Marcelin](https://github.com/DM-Marcelin)  
📝 Project: [EKS-TF-AI-Inference-App](https://github.com/DM-Marcelin/eks-tf-ai-inference-app)