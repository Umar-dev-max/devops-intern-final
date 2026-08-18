devops-intern-final

Final assessment project for the DevOps Internship program. This repository documents a small but realistic DevOps workflow from Git/GitHub setup and Linux scripting, through Docker containerization, CI/CD automation with GitHub Actions, job deployment with Nomad and log monitoring with Grafana Loki.

Author: Muhammad Umar Khan
Date: 18 August 2026

## Docker

The `hello.py` script is containerized using Docker.

**Dockerfile:**
​```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY hello.py .

CMD ["python", "hello.py"]
​```

**Build the image:**
​```bash
docker build -t hello-devops .
​```

**Run the container:**
​```bash
docker run hello-devops
​```

**Expected output:**
​```
Hello, DevOps!
​```
