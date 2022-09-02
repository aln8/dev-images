build:
	docker build -t ros2-ubuntu-local:focal .

buildx:
	docker buildx build --build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} --platform linux/amd64,linux/arm64 -t $${DOCKER_REGISTRY}/ros-foxy/base:v1.1 --push .