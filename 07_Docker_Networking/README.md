# Docker Networking & Volume Homework

**Name:** Gaurav Kumar  
**Roll No:** 10066  

---

## Task 1: Docker Container Networking

I created 3 different networks, ran Frontend, Backend, and Database containers, and attached the Backend to 2 networks to test connectivity.

**Commands Used:**
```bash
# 1. Create 3 different Docker networks
docker network create frontend-net
docker network create backend-net
docker network create db-net

# 2. Run the Database container (MySQL) on db-net
docker run -d --name database --network db-net -e MYSQL_ROOT_PASSWORD=root mysql:latest

# 3. Run the Backend container (Alpine) on backend-net
docker run -d --name backend --network backend-net alpine sleep 3600

# 4. Run the Frontend container (Nginx) on frontend-net
docker run -d --name frontend --network frontend-net -p 8081:80 nginx:alpine

# 5. Add the backend container to db-net (so it's on 2 networks)
docker network connect db-net backend

# 6. Check connectivity (ping DB from Backend)
docker exec backend ping -c 3 database
```

**Screenshot of Task 1 Execution:**
![Task 1 Execution](images/task1.png)

---

## Task 2: Host Network

I created an Apache2 container using the host network and accessed it directly on port 80.

**Commands Used:**
```bash
# Pull Apache2 image and run it on the host network
docker pull httpd:latest
docker run -d --name apache-host --network host httpd:latest

# Access the website
curl http://localhost:80
```

**Screenshot of Task 2 Execution:**
![Task 2 Execution](images/task2.png)

---

## Task 3: Bind Mount

I created a local folder, added an `index.html` file, and bind-mounted it to an Nginx container. I verified that changes to the file on my local machine instantly reflect in the container without restarting it.

**Commands Used:**
```bash
# Run Nginx with a bind mount to the local folder
docker run -d --name nginx-bind -p 8082:80 -v $(pwd)/bind-mount-demo:/usr/share/nginx/html nginx:alpine

# Access the website (Outputs: Hello students)
curl http://localhost:8082

# Modify the file on the host machine
echo "Hello students - Modified!" > bind-mount-demo/index.html

# Access the website again (Outputs: Hello students - Modified!)
curl http://localhost:8082
```

**Screenshot of Task 3 Execution:**
![Task 3 Execution](images/task3.png)

---

## Task 4: Overlay Network

**What is a Docker Overlay Network?**  
An overlay network creates a distributed network among multiple Docker daemon hosts. It sits on top of the host-specific networks, allowing containers connected to it to communicate securely and directly, even when they are running on completely different physical or virtual machines. 

**Use Cases:**
1. **Docker Swarm & Kubernetes:** Connecting services across a cluster of nodes.
2. **Microservices Architecture:** When backend, database, and frontend containers are distributed across multiple servers for high availability, an overlay network allows them to communicate seamlessly.
3. **Multi-host Networking:** Establishing encrypted communication between containers deployed on different cloud providers or data centers without exposing ports to the public internet.

**How it Works:**
Docker uses a technology called VXLAN (Virtual Extensible LAN) to encapsulate container network traffic into normal host-to-host traffic. When a container sends a packet to another container on a different host, the Docker daemon encapsulates the packet, sends it over the physical network to the target host, and the receiving Docker daemon unpacks it and delivers it to the correct destination container.
