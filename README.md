# Kubernetes Security Project

This project demonstrates a **secure CI/CD pipeline on Kubernetes**, focusing on **runtime monitoring, vulnerability scanning, and automated deployment** using **Terraform, SonarQube, Trivy, Falco, and AWS EKS**.

---

## 📌 What this project does

1. **Infrastructure Provisioning**:
    - Uses **Terraform** to provision an **EC2 instance** as a **self-hosted GitHub Runner**.
    - Installs:
        - Java
        - Node
        - Docker
        - SonarQube
        - AWS CLI
        - Kubectl
        - Terraform
        - Trivy
    - Configures GitHub Secrets for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

2. **Repository Preparation**:
    - SSH into the runner instance.
    - Clone the [`KubernetesProject-main`](https://github.com/Diler-M/KubernetesProject-main) repository.
    - Use **Terraform** to deploy the **EKS cluster**.
    - Set up the **self-hosted GitHub runner** on EC2.

3. **CI/CD Pipeline Execution**:
    - On push, the deployment pipeline:
        - Builds and pushes the **containerised Spotify application**.
        - Performs **static code analysis with SonarQube**.
        - Installs Node.js dependencies.
        - **Scans the local filesystem with Trivy** for vulnerabilities and misconfigurations.
        - Builds and pushes the Docker image.
        - **Deploys to EKS using Kubectl**.

4. **Runtime Monitoring**:
    - Installs **Falco** for runtime security monitoring.
    - Tests runtime detection using:
      ```bash
      kubectl exec -it $(kubectl get pods --selector=app=spotify -o name) -- cat /etc/shadow
      ```
    - Views Falco alerts:
      ```bash
      kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep Warning
      ```

---

## ⚙️ Tools Used

- **Terraform** – Infrastructure as Code (EC2, EKS)
- **GitHub Actions** – CI/CD orchestration
- **SonarQube** – Static code analysis
- **Trivy** – Filesystem and image vulnerability scanning
- **Falco** – Runtime security monitoring
- **Docker** – Containerisation
- **AWS EKS** – Managed Kubernetes cluster
- **Kubectl** – Cluster management

---

## 🚀 Why Scan with Two Tools?

- **SonarQube** checks code quality, technical debt, and static vulnerabilities prior to build.
- **Trivy** scans:
    - The local filesystem during CI.
    - Docker images post-build.
    - This layered approach provides security for both code and container images.

---

## ✅ Status

✅ EC2 self-hosted runner configured

✅ Terraform infrastructure provisioned (EC2 + EKS)

✅ CI/CD pipeline functional

✅ Static and container scanning integrated

✅ Runtime monitoring with Falco tested

---

## 📸 Runtime Alert Sample

- To confirm runtime monitoring is functioning, the following command was executed:

```bash

kubectl exec -it $(kubectl get pods --selector=app=spotify -o name) -- cat /etc/shadow

```

- Falco detected this suspicious activity, and alerts were retrieved with:

```bash

kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep Warning

```

- Example runtime alert:

```bash

07:14:56.678927532: Warning File below /etc opened for reading by non-trusted program (user=root command=cat /etc/shadow ... )

```

---

## 🛡️ Outcome

This project demonstrates a **complete, secure deployment pipeline on Kubernetes**, with:

- Automated **infrastructure provisioning.**

- **Static code scanning** for vulnerabilities and quality checks.

- **Container image scanning** for vulnerabilities and misconfigurations.

- **Runtime monitoring** for malicious or suspicious activity.

- It serves as a **practical, real-world example of cloud DevSecOps practices** for professional and educational purposes.

---

## 🗂️ Repositories

Runner Setup Repository: [`EC2-Runner-main`](https://github.com/Diler-M/EC2-Runner-main)

Main Kubernetes Project Repository: [`KubernetesProject-main`](https://github.com/Diler-M/KubernetesProject-main)

---

## 🤝 Contributing

Pull requests and suggestions are welcome. If you wish to contribute:

1. Fork the repository.

2. Create a feature branch (git checkout -b feature/my-feature).

3. Commit your changes (git commit -am 'Add new feature').

4. Push to the branch (git push origin feature/my-feature).

5. Create a Pull Request.


## 📈 Project Architecture

```mermaid
flowchart LR
    A[User Pushes to GitHub] --> B[GitHub Actions Trigger]
    B --> C[Self-Hosted EC2 Runner]
    C --> D[Terraform Deploys EKS Cluster]
    C --> E[Run CI Pipeline]
    E --> F[SonarQube Static Analysis]
    E --> G[Install Node Dependencies]
    E --> H[Trivy Filesystem Scan]
    E --> I[Docker Build and Push to Docker Hub]
    I --> J[Trivy Image Scan]
    J --> K[Deploy to EKS via Kubectl]
    K --> L[Container Running on EKS]
    L --> M[Falco Runtime Monitoring]

    click A href "https://github.com/Diler-M/KubernetesProject-main"
    click I href "https://hub.docker.com/"


