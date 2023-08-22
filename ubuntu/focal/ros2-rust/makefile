build:
	docker build -t ros2-rust-ubuntu-local:focal .

buildx:
	docker buildx build --build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} --platform linux/arm64,linux/amd64 -t $${DOCKER_REGISTRY}/ros-foxy-rust/base:v1.3 --push .
