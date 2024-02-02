buildx:
	docker buildx build \
		--build-arg DOCKER_REGISTRY=$${DOCKER_REGISTRY} \
		--platform linux/arm64,linux/amd64 \
		-t $${DOCKER_REGISTRY}/ros-humble-rust/base:v1.4 \
		--push .
