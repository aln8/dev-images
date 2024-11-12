build:
	docker build -t ros2-humble-ubuntu-local:focal .

buildx:
	docker buildx build --build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} --platform linux/amd64,linux/arm64 -t $${DOCKER_REGISTRY}/ros-humble-focal/base:v1.0 --push .