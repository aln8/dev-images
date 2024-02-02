buildx:
	docker buildx build --build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} --platform linux/amd64,linux/arm64 -t $${DOCKER_REGISTRY}/jammy-base/node:v1.4 --push .
	