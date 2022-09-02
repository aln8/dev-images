buildx:
	docker buildx build --build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} \
		--platform linux/amd64,linux/arm64 \
		-t $${DOCKER_REGISTRY}/ros-humble/base:v1.0 \
		--push .