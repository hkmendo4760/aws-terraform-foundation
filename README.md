# 🌐 AWS Terraform Foundation

A production‑ready Terraform foundation demonstrating:

- Remote backend with **S3 state storage**
- **DynamoDB state locking**
- Modular Terraform architecture
- Environment separation
- AWS SSO authentication
- CI/CD readiness with GitHub Actions

This project is designed as showcase of real‑world Terraform practices.

---

## 🏗️ Architecture Overview

```mermaid
flowchart TD
    Dev[Developer / Codespaces] --> TF[Terraform CLI]
    TF --> S3[(S3 Backend Bucket)]
    TF --> DDB[(DynamoDB Lock Table)]

    subgraph AWS[AWS Account]
        S3
        DDB
    end

    TF --> MODS[Terraform Modules]
    MODS --> ENVS[Environments]
    ENVS --> DEVENV[Dev Environment Resources]
