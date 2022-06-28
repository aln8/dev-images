ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/ros-foxy/base:v1

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# install libclang-dev for ros2-rust lib
RUN apt update && apt install -y git libclang-dev python3-vcstool
