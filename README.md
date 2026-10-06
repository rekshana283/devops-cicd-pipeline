# DevOps CI/CD Pipeline

## Project Overview

This project demonstrates a practical CI/CD pipeline for a Python-based virtual simulation platform using GitHub Actions and Docker.

The pipeline automates code quality checks, unit testing, container image building, test deployment, and deployment verification. A rollback script is also included to support recovery when a deployment fails.

## Tools Used

- GitHub
- GitHub Actions
- Docker
- Python
- Pytest
- Flake8
- Git Bash

## CI/CD Pipeline Flow

Code Push
→ Static Code Analysis
→ Unit Testing
→ Docker Image Build
→ Test Environment Deployment
→ Deployment Verification

## Pipeline Stages

### 1. Static Code Analysis

Flake8 is used to check the Python source code for syntax issues and common coding problems.

### 2. Unit Testing

Pytest is used to automatically verify that the simulation application returns the expected status and message.

### 3. Docker Image Build

The application is packaged into a lightweight Docker image using the Python 3.14 slim base image.

### 4. Test Environment Deployment

The Docker image is started as a test deployment. The application output is checked to confirm that the container runs successfully.

### 5. Deployment Verification

The pipeline verifies that the deployment completed successfully after the container execution.

## Rollback and Error Recovery

A rollback script is provided in:

`scripts/rollback.sh`

The script restores the previous known-good Docker image by using the `devops-simulation:previous` image tag.

Rollback flow:

Current Deployment
→ Deployment Failure
→ Restore Previous Image
→ Verify Application

The rollback mechanism provides a simple recovery process for the test environment. In a production environment, the previous image would normally be stored in a container registry and restored automatically through the deployment pipeline.

## Testing Methodology

The project uses automated testing at multiple stages:

- Static code analysis using Flake8
- Unit testing using Pytest
- Docker image build validation
- Container execution testing
- Deployment verification

These checks help identify code, build, and deployment problems before the application is considered successfully deployed.

## Error Recovery

If deployment fails, the previous known-good Docker image can be restored using the rollback script.

The rollback script also returns an error when the previous image is unavailable, preventing an invalid rollback from being treated as successful.

## Project Structure

```text
devops-cicd-pipeline/
│
├── app/
│   └── app.py
│
├── tests/
│   └── test_app.py
│
├── scripts/
│   └── rollback.sh
│
├── .github/
│   └── workflows/
│       └── cicd.yml
│
├── Dockerfile
└── README.md

## Result

The completed pipeline successfully performs:

- Static code analysis
- Automated unit testing
- Docker image building
- Test environment deployment
- Deployment verification
- Rollback and error recovery support

This project demonstrates a basic but practical CI/CD workflow that can be extended with container registries, cloud environments, and production deployment strategies.
