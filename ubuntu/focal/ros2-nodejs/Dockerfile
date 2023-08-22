ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/ros-foxy/base:v1.3

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash
RUN apt install -y nodejs
RUN npm install -g pnpm
RUN pnpm config set registry https://mirrors.cloud.tencent.com/npm/
