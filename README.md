# 🏦 Secure Banking CI/CD Pipeline

> Enterprise-grade DevSecOps pipeline built for real-world secure delivery using GitHub Actions, SonarCloud, OWASP ZAP, Terraform, and AWS Fargate.

---

## 🔐 Project Overview
![Architecture Diagram](docs/secure-banking-architecture.png)


This project automates the secure delivery of containerized applications across dev, staging, and production environments with built-in security gates and observability.

### 🔧 Tools & Stack

- **CI/CD**: GitHub Actions (3 pipelines: dev, stage, prod)
- **Security Scanning**:
  - SonarCloud (Static Analysis - SAST)
  - OWASP ZAP (Dynamic Analysis - DAST)
- **Infrastructure as Code**: Terraform (modular, multi-env)
- **Cloud Provider**: AWS (VPC, ECS Fargate, IAM, S3 backend)
- **Notifications**: Slack Alerts (via Webhook)
- **Reporting**: HTML security scan artifacts

---

## 🚀 Environments

| Environment | Branch | Actions Performed |
|-------------|--------|------------------|
| **Dev**     | `dev`  | Sonar + ZAP + Terraform Plan |
| **Stage**   | `stage`| Full scan + Terraform Apply |
| **Prod**    | `main` | Full scan + Terraform Apply + Slack Alert |

---

## 📂 Folder Structure

```
secure-banking-cicd/
├── .github/workflows/       # GitHub Actions pipelines
│   ├── dev-pipeline.yml
│   ├── stage-pipeline.yml
│   └── prod-pipeline.yml
├── terraform/
│   ├── modules/             # Reusable infra modules (vpc, ecs, iam, security)
│   └── envs/
│       ├── dev/
│       ├── stage/
│       └── prod/
├── app/                     # Sample application source + Dockerfile
│   └── sonar-project.properties
├── zap-scan/                # ZAP scan config & output
├── sonar-setup/             # (Optional) SonarQube docker setup
└── README.md
```

---

## 🔔 Secrets Required

| Secret Name             | Purpose                        |
|-------------------------|--------------------------------|
| `SONAR_TOKEN`           | SonarCloud auth                |
| `SONAR_HOST_URL`        | SonarCloud endpoint URL        |
| `AWS_ACCESS_KEY_ID`     | AWS Terraform access           |
| `AWS_SECRET_ACCESS_KEY` | AWS Terraform access           |
| `SLACK_WEBHOOK_URL`     | Slack channel notification     |

---

## ✅ Features

- Modular **Terraform Infra** (VPC, ECS, IAM, SG)
- Secure **private networking** by default
- **DevSecOps best practices** with SAST + DAST scans
- Scan reports uploaded as **artifacts**
- **Slack integration** for deployment visibility
- Infrastructure state managed via **S3 + DynamoDB**

---

## 🧠 Future Improvements

- Add GitHub PR comment feedback from Sonar
- Add multi-container support via ECS task definition
- Deploy real banking microservice mock app
- Add manual approval gates on prod

---

> Built as a professional DevOps portfolio project 💼


[![Production Environment CI/CD](https://github.com/doyindevops/secure-banking-cicd/actions/workflows/prod-pipeline.yml/badge.svg)](https://github.com/doyindevops/secure-banking-cicd/actions/workflows/prod-pipeline.yml)