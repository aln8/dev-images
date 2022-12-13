build:
	docker build -t ubuntu-local:base-focal .

buildx:
	docker buildx build --platform linux/amd64,linux/arm64 -t $${DOCKER_REGISTRY}/base/ubuntu-focal:v1.2 --push .
	