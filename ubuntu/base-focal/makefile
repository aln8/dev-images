build:
	docker build -t ubuntu-local:base-focal .

# multi arch buildx
buildx:
	docker buildx build --platform linux/amd64,linux/arm64 -t $${DOCKER_REGISTRY}/base/ubuntu-local:base-focal --push .
	