# DevOps Assignment – Ticket Booking Web Application

This project implements a complete CI/CD pipeline for a web-based ticket booking app using Git, Docker, Jenkins, and Kubernetes.

## Objective

To design and implement an automated DevOps workflow that includes:
1. Version Control and Branching (Git)
2. Containerization (Docker)
3. Continuous Integration and Delivery (Jenkins)
4. Deployment and Orchestration (Kubernetes using Minikube)

## Tools Used

- Git and GitHub for version control
- Docker for containerization
- Docker Hub for image storage
- Jenkins for CI/CD automation
- Kubernetes (Minikube) for orchestration

## Project Architecture

GitHub → Jenkins → Docker Hub → Kubernetes → Web Application

## Steps Implemented

### 1. Version Control (Git)

git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/pravv25/ticket-booking.git
git push -u origin main

Later updates:
git add .
git commit -m "Updated code and added screenshots"
git push origin main

### 2. Docker Containerization

Dockerfile:
FROM python:3.9-slim
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ["python", "app.py"]

Commands:
docker build -t ticket-app:1.0 .
docker run -d -p 8000:8000 ticket-app:1.0

### 3. Docker Hub Integration

docker login
docker tag ticket-app:1.0 pravalika2503/ticket-booking:1.0
docker push pravalika2503/ticket-booking:1.0

### 4. Jenkins Pipeline Setup

Pipeline stages:
- Checkout from GitHub
- Build Docker image
- Push image to Docker Hub
- Deploy to Kubernetes

Jenkinsfile:
pipeline {
agent any
environment {
DOCKER_HUB = 'pravalika2503/ticket-booking'
DOCKERHUB_CREDENTIALS = credentials('docker-hub-cred')
}
stages {
stage('Clone Repo') {
steps { git 'https://github.com/pravv25/ticket-booking.git' }
}
stage('Build Image') {
steps { sh 'docker build -t $DOCKER_HUB:latest .' }
}
stage('Push Image') {
steps {
withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
sh 'echo $PASS | docker login -u $USER --password-stdin'
sh 'docker push $DOCKER_HUB:latest'
}
}
}
stage('Deploy to Kubernetes') {
steps {
sh 'kubectl apply -f k8s/deployment.yaml'
sh 'kubectl apply -f k8s/service.yaml'
}
}
}
}

### 5. Kubernetes Deployment

minikube start
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get pods
kubectl get services
minikube service ticket-booking-service

### 6. Scaling Pods

kubectl get deployments
kubectl get pods
kubectl get services

## Screenshots Added

- pipeline-overview.png <img width="1870" height="941" alt="pipeline-overview" src="https://github.com/user-attachments/assets/4214db89-4e8f-4cb4-a88c-22e596df648b" />
- docker-image.png <img width="953" height="499" alt="docker-image" src="https://github.com/user-attachments/assets/198b18e3-44ed-4db6-b9ad-aa350f0ef589" />
<img width="943" height="392" alt="docker-img-repo" src="https://github.com/user-attachments/assets/49f6d0ab-1504-4c2a-a897-230cc96e154e" />
- kubernetes.png <img width="729" height="484" alt="kubernetes" src="https://github.com/user-attachments/assets/a167e01b-6b9c-4479-be51-0bec72165f16" />
 <img width="1920" height="1080" alt="docker-kube-cluster" src="https://github.com/user-attachments/assets/18f2b9a0-4e39-4853-91bf-8f965e3649f9" />
- minikube-web-server.png <img width="1413" height="491" alt="minikube-web-server" src="https://github.com/user-attachments/assets/d4ec87d7-1341-4084-917a-ef795fc53698" />
- web-interface.png <img width="960" height="468" alt="frontend-web-interface" src="https://github.com/user-attachments/assets/40e4c3e1-9a90-45c0-ad12-3f93b78c672b" />

## Author

**Pravalika N**  
GitHub: https://github.com/pravv25  
Docker Hub: https://hub.docker.com/u/pravalika2503


