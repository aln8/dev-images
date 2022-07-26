build:
	docker build -t node-ubuntu-local:focal .

buildx:
	docker buildx build --build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} --platform linux/amd64,linux/arm64 -t $${DOCKER_REGISTRY}/base/node:v1.1 --push .
	