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
```
## 🔄 Terraform Workflow

```mermaid
sequenceDiagram
    participant Dev as Developer
    participant TF as Terraform CLI
    participant DDB as DynamoDB Lock Table
    participant S3 as S3 State Bucket
    participant AWS as AWS Resources

    Dev->>TF: terraform init / plan / apply
    TF->>DDB: Acquire state lock
    TF->>S3: Read current state
    TF->>AWS: Create/Update/Delete resources
    TF->>S3: Write updated state
    TF->>DDB: Release lock
```
## 📁 Repository Structure

```mermaid
graph TD
    A[Repository Root] --> B[backend/]
    A --> C[modules/]
    A --> D[environments/]
    A --> E[backend.tf]
    A --> F[backend-setup.sh]
    A --> G[.github/workflows]

    B --> B1[S3 Backend Module]
    B --> B2[DynamoDB Lock Module]

    C --> C1[S3 Bucket Module]
    C --> C2[Future Modules]

    D --> D1[dev/]
    D1 --> D2[main.tf]
```
