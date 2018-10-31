# Jenkins Docker Heroku

## Description
Dockerfile for installing Jenkins (Blueocean) to Heroku dyno using Docker container.

## Prerequisites
1. If you do not have Heroku account:
   - Sign up to [Heroku](https://signup.heroku.com/)
2. Software requirements:
   - [Docker](https://www.docker.com/get-started)
   - [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

## Usage
**_This guide is written in assumption that you do not have Heroku application set up yet._**
You need to meet [prerequisites](#prerequisites) before starting this section.
It is recomended to read [Installing Jenkins](https://jenkins.io/doc/book/installing/) and [Container Registry & Runtime (Docker Deploys)](https://devcenter.heroku.com/articles/container-registry-and-runtime) guides before starting this section.

1. Create a Heroku app
   - Open console in your app's directory
   - Create a Heroku app. `salty-fortress-4191` is name of application in this example (you will have different one):
     ```bash
     > heroku create
     Creating salty-fortress-4191... done, stack is cedar-14
     https://salty-fortress-4191.herokuapp.com/ | https://git.heroku.com/salty-fortress-4191.git
     ```
2. Log into Container Registry
   - Log into Heroku Container Registry:
     ```bash
     heroku container:login
     ```
   - Generate Heroku Auth Token. `9b4519c4-0f1b-4def-8a34-6e7287a6d04d` is auth tocken in this example (you will have different one):
     ```bash
     > heroku auth:token
     9b4519c4-0f1b-4def-8a34-6e7287a6d04d
     ```
   - Log into Heroku Container Registry using Docker:
     ```bash
     docker login --username=_ --password=9b4519c4-0f1b-4def-8a34-6e7287a6d04d registry.heroku.com
     ```
3. Build Docker image:
   ```bash
   docker build -t registry.heroku.com/salty-fortress-4191/web .
   ```
4. Push Docker image to Heroku:
   ```bash
   docker push registry.heroku.com/salty-fortress-4191/web
   ```
5. Release dyno in Heroku:
   ```bash
   heroku container:release web -a salty-fortress-4191
   ```
6. Now you can access your app from your browser in Heroku dashboard (you can access log files from created instance there too).
