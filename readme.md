# devops-intern-final

[![CI](https://github.com/Umar-dev-max/devops-intern-final/actions/workflows/ci.yml/badge.svg)](https://github.com/Umar-dev-max/devops-intern-final/actions/workflows/ci.yml)

DevOps Intern Final Assessment demonstrating Git, Linux, Docker, GitHub Actions, Nomad, and Grafana Loki.

**Author:** Muhammad Umar Khan  
**Date:** 18 August 2026

## 1. Git & GitHub

The project is maintained in a public GitHub repository.

The Python application prints:

```python
print("Hello, DevOps!")
```

## 2. Linux & Scripting

Script:

```text
scripts/sysinfo.sh
```

The script displays:

- Current user
- Current date
- Disk usage

Run:

```bash
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

## 3. Docker

Build the image:

```bash
docker build -t hello-devops:latest .
```

Run the container:

```bash
docker run --rm hello-devops:latest
```

Expected output:

```text
Hello, DevOps!
```

## 4. CI/CD with GitHub Actions

Workflow:

```text
.github/workflows/ci.yml
```

The workflow automatically runs `hello.py` on every push.

## 5. Job Deployment with Nomad

Nomad job:

```text
nomad/hello.nomad
```

A local Docker Registry is used to provide the image to Nomad.

Start the registry:

```bash
docker run -d --name registry -p 5000:5000 registry:2
```

Tag and push the image:

```bash
docker tag hello-devops:latest localhost:5000/hello-devops:latest
docker push localhost:5000/hello-devops:latest
```

Run the Nomad job:

```bash
nomad job run nomad/hello.nomad
```

Check the job status:

```bash
nomad job status hello-devops
```

The application was successfully deployed as a running Nomad service.

## 6. Monitoring with Grafana Loki

Monitoring files:

```text
monitoring/loki_setup.txt
monitoring/promtail-config.yml
```

Docker container logs are collected by Promtail and forwarded to Grafana Loki.

Logs can be queried using:

```bash
curl -G -s http://localhost:3100/loki/api/v1/query_range \
  --data-urlencode 'query={job="nomad-docker"} |= "Hello"' \
  --data-urlencode 'limit=20'
```

The `Hello, DevOps!` application log was successfully retrieved from Loki.

## Project Structure

```text
devops-intern-final/
├── .github/
│   └── workflows/
│       └── ci.yml
├── monitoring/
│   ├── loki_setup.txt
│   └── promtail-config.yml
├── nomad/
│   └── hello.nomad
├── scripts/
│   └── sysinfo.sh
├── hello.py
├── Dockerfile
└── README.md
```
