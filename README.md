# CI/CD Kubernetes Pipeline

This project demonstrates a robust CI/CD pipeline designed for Kubernetes-based applications. It incorporates security, code quality, runtime monitoring, infrastructure automation, and containerisation best practices using modern DevOps tools.

## Overview

The pipeline includes:

- **Terraform**: Automates the provisioning of an Amazon EKS cluster for Kubernetes workloads.
- **Trivy**: Ensures security by scanning file systems and container images for vulnerabilities.
- **SonarQube**: Performs static code analysis to detect bugs, vulnerabilities, and code smells.
- **Docker**: Builds and hosts containerised applications for deployment.
- **Kubernetes**: Manages and deploys containerised workloads efficiently.
- **Falco**: Monitors runtime behaviour to detect anomalies and potential security threats in Kubernetes clusters.

## Highlights

- **Infrastructure as Code**:  
  - Uses Terraform to provision an Amazon EKS cluster, ensuring consistent and repeatable infrastructure deployment.

- **Security-First Approach**:  
  - Vulnerability scanning with Trivy integrated at multiple stages of the pipeline.  
  - Runtime security monitoring with Falco to detect unauthorised or suspicious activity in the cluster.

- **Code Quality Assurance**:  
  - Ensures clean, maintainable, and reliable code using SonarQube.

- **Seamless Containerisation**:  
  - Leverages Docker for consistent and reproducible application builds.

- **Kubernetes Integration**:  
  - Deploys scalable, containerised applications using Kubernetes manifests.

## Tools and Technologies

- **Infrastructure**: Terraform, Amazon EKS, AWS  
- **CI/CD**: GitHub Actions, Jenkins, or similar tools (configurable)  
- **Security**: Trivy, Falco  
- **Code Quality**: SonarQube  
- **Containerisation**: Docker  
- **Orchestration**: Kubernetes

## Use Cases

This pipeline is ideal for:

- Automating infrastructure provisioning and application deployment in cloud-native environments.
- Enhancing security and code quality in the software development lifecycle.
- Monitoring runtime behaviour for threats and anomalies in Kubernetes clusters.
- Demonstrating DevOps expertise in CI/CD pipeline design, infrastructure automation, and runtime security.
