build:
	docker build -t golang-ubuntu-local:focal .

buildx:
	docker buildx build --build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} --platform linux/amd64,linux/arm64 -t $${DOCKER_REGISTRY}/base/focal-golang:v1.2 --push .
