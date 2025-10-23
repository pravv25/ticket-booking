Ticket Booking App

## Features
- Modern, responsive HTML/CSS frontend
- Booking form, secure booking, best deals, 24/7 support
- Dockerized and deployable on Kubernetes
- CI/CD with Jenkins

## Setup Instructions

### 1. Clone Repo
git clone https://github.com/pravv25/ticket-booking.git
cd ticket-booking-app

shell
Copy code

### 2. Build Docker Image
docker build -t ticket-app:1.0 .
docker run -p 8080:80 ticket-app:1.0

shell
Copy code

### 3. Deploy on Minikube
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
minikube service ticket-app-service

markdown
Copy code

### 4. Jenkins CI/CD
- Configure Jenkins with GitHub repo
- Add pipeline with Jenkinsfile
- Build triggers automatically on `develop` branch
- Deploys Docker container to Kubernetes

## GitFlow
git flow init
git flow feature start booking-ui
git add .
git commit -m "Add booking UI"
git flow feature finish booking-ui
git push origin develop


