# DevOps Final Project

## Project Overview

This project demonstrates a complete DevOps workflow by containerizing a portfolio website using Docker and Docker Compose. The application is version-controlled with Git and hosted on GitHub. It is designed to be extended with Jenkins CI/CD, Docker Hub, and AWS deployment.

## Technologies Used

- HTML5
- CSS3
- Docker
- Docker Compose
- Git
- GitHub
- Nginx
- Jenkins (Coming Next)
- AWS (Coming Next)

## Project Structure

```
devops-final-project/
├── portfolio/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── nginx.conf
│   ├── index.html
│   └── style.css
├── ansible/
├── terraform/
├── java-app/
├── screenshots/
├── Jenkinsfile
└── README.md
```

## How to Run

Clone the repository:

```bash
git clone https://github.com/Laran40595/devops-final-project.git
```

Go to the project:

```bash
cd devops-final-project/portfolio
```

Start the application:

```bash
docker compose up -d
```

Open your browser:

```
http://localhost:3000
```

## Current Status

- ✅ Dockerized application
- ✅ Docker Compose deployment
- ✅ GitHub repository
- 🔄 Jenkins CI/CD (In Progress)
- 🔄 Docker Hub (Planned)
- 🔄 AWS Deployment (Planned)

## Author

Osagie Great Mike
Webhook test - Jenkins automatic deployment enabled
