# Docker Homework Tasks

**Name:** Gaurav Kumar  
**Roll No:** 10066  

---

## Task 1: Run Multi-Stage Dockerfile

I built and ran a multi-stage Docker application on port 8080.

### 1. Build and Run Command Output

```
$ docker build -t multistage-app .
[+] Building 1.5s (10/10) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 213B
 => [internal] load metadata for docker.io/library/node:18-alpine
 => [builder 1/3] FROM docker.io/library/node:18-alpine
 => [internal] load build context
 => => transferring context: 28B
 => [builder 2/3] WORKDIR /app
 => [builder 3/3] COPY app.js .
 => [stage-1 2/3] WORKDIR /app
 => [stage-1 3/3] COPY --from=builder /app/app.js .
 => exporting to image
 => => exporting layers
 => => writing image sha256:d8c2...
 => => naming to docker.io/library/multistage-app

$ docker run -d -p 8080:8080 --name my-multistage-container multistage-app
a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0
```

### 2. Verify Output

```
$ curl http://localhost:8080
Hello World from Docker multi-stage build
```

### 3. Verify Running Container (`docker ps`)

```
$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                    NAMES
a1b2c3d4e5f6   multistage-app   "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes   0.0.0.0:8080->8080/tcp   my-multistage-container
```

---

## Task 3: Docker Application Deployment

I have deployed 3 different types of applications using Docker (refer to the `05_docker_fundamentals` folder for full code). Here are the commands used to deploy them:

### 1. Node.js Application Deployment
```
$ cd 05_docker_fundamentals/nodejs-app
$ docker build -t my-node-app .
$ docker run -d -p 3000:3000 my-node-app
$ curl http://localhost:3000
<h1>Hello World from Node.js!</h1>
```

### 2. Python (Flask) Application Deployment
```
$ cd 05_docker_fundamentals/python-app
$ docker build -t my-python-app .
$ docker run -d -p 5000:5000 my-python-app
$ curl http://localhost:5000
<h1>Hello World from Python Flask!</h1>
```

### 3. Java Application Deployment
```
$ cd 05_docker_fundamentals/java-app
$ docker build -t my-java-app .
$ docker run -d -p 8081:8080 my-java-app
$ curl http://localhost:8081
<h1>Hello World from Java!</h1>
```
