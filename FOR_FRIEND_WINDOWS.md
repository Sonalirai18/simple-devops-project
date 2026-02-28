# Run this project on Windows (beginner guide)

You do **NOT** need to understand the code. Just follow these steps to run the app locally.

## 1) Install Docker Desktop

1. Install **Docker Desktop for Windows**
2. Restart your laptop if it asks
3. Open Docker Desktop and wait until it shows **“Docker Engine is running”**

## 2) Unzip the project

1. Unzip `simple-devops-project.zip`
2. Open the extracted folder `simple-devops-project`

You should see files like:
- `docker-compose.yml`
- `Dockerfile`
- `app/`

## 3) Start the app (PowerShell)

1. Inside the `simple-devops-project` folder, right-click → **Open in Terminal**
2. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\start.ps1
```

Wait until you see something like “Container … Started”.

## 4) Open the app

Open in browser:
- `http://localhost:5000/`
- `http://localhost:5000/healthz`

## 5) Stop the app

In the same folder run:

```powershell
powershell -ExecutionPolicy Bypass -File .\stop.ps1
```

## Troubleshooting

- If you get “port is already allocated”:
  - Something else is using port 5000.
  - Close other apps using 5000, OR change the port in `docker-compose.yml` from `5000:5000` to `5001:5000` and open `http://localhost:5001/`.

- If Docker is not running:
  - Open Docker Desktop and wait until it is ready, then run `start.ps1` again.

