# Simple DevOps Project (Linux + GitHub + Jenkins)

This is a **simple, submission-ready DevOps project**:

- One small web app (`Flask`)
- Dockerfile + Docker Compose
- Jenkins CI/CD pipeline (`Jenkinsfile`) to test → build → deploy → smoke test
- GitHub Actions CI for PRs

## App

- Endpoint: `GET /` → returns `{"message":"hello devops"}`
- Health: `GET /healthz`

## Run locally (Docker)

### Windows (beginner-friendly)

Read `FOR_FRIEND_WINDOWS.md` and run:

```powershell
powershell -ExecutionPolicy Bypass -File .\start.ps1
```

Stop:

```powershell
powershell -ExecutionPolicy Bypass -File .\stop.ps1
```

### Linux/macOS

```bash
docker compose up --build
curl http://localhost:5000/healthz
```

## Jenkins (Linux agent)

Requirements on Jenkins agent:
- git, docker, docker compose plugin
- python3 + python3-venv
- curl

Create a Jenkins Pipeline job pointing to this repo and set:
- Script path: `simple-devops-project/Jenkinsfile`

## GitHub Actions

- Workflow: `simple-devops-project/.github/workflows/ci.yml`

