pipeline {
  agent any

  options { timestamps() }

  environment {
    IMAGE = "simple-devops-web"
    TAG = "${env.BUILD_NUMBER}"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Lint + Test') {
      steps {
        sh '''
          set -euo pipefail
          cd simple-devops-project

          python3 -m venv .venv
          . .venv/bin/activate
          python -m pip install --upgrade pip
          python -m pip install -r requirements.txt

          ruff check app
          pytest -q
        '''
      }
    }

    stage('Build image') {
      steps {
        sh '''
          set -euo pipefail
          cd simple-devops-project
          docker build -t ${IMAGE}:${TAG} .
        '''
      }
    }

    stage('Deploy (Docker Compose on Jenkins host)') {
      steps {
        sh '''
          set -euo pipefail
          cd simple-devops-project
          docker compose up -d --build
        '''
      }
    }

    stage('Smoke test') {
      steps {
        sh '''
          set -euo pipefail
          curl -fsS http://127.0.0.1:5000/healthz
          curl -fsS http://127.0.0.1:5000/
        '''
      }
    }
  }
}

