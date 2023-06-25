# Docker-NAT

Docker-NAT is a GitHub project that simulates a Network Address Translation (NAT) environment using Docker containers.

## Architecture

![Docker-NAT Architecture](https://raw.githubusercontent.com/barsaskn/docker-nat/main/docker-nat.png)

This diagram illustrates the architecture of Docker-NAT, showcasing the interaction between the private network, the NAT gateway container, and the external network.

## Overview

Network Address Translation (NAT) is a technique used in computer networking to enable multiple devices to share a single IP address. It allows a local network to use private IP addresses internally while communicating with the external network using a single public IP address.

Docker-NAT provides a simplified way to set up and experiment with a NAT environment using Docker containers. It allows you to create a virtual network with private IP addresses and a NAT gateway container that performs the translation between the private and public IP addresses.

## Features

- Simulates a NAT environment using Docker containers
- Creates a virtual network with private IP addresses
- Sets up a NAT gateway container for IP address translation
- Supports communication between containers on the private network and the external network

## Prerequisites

Before getting started with Docker-NAT, ensure that you have the following prerequisites installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)

## Getting Started

To use Docker-NAT, follow these steps:

1. Clone the Docker-NAT repository:

```shell
git clone https://github.com/barsaskn/docker-nat.git
cd docker-nat
```

2. Create networks:

```shell
cd network
./create-networks.sh
```

3. Build images:

```shell
./router/build.sh
./server/build.sh
./client/build.sh
```

4. Run images:

```shell
./router/run.sh
./server/run.sh
./client/run.sh
```

5. You can connect clients or server terminals with command:

```shell
sudo docker exec -it <container-name> /bin/bash
```

## Hint

* There are run.sh stop.sh commands to start and stop containers, please use them. Otherwise some errors may occur.

* Also, you can start containers one by one using prepared scripts. Start routers first otherwise system will fail.  