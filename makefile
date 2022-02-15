ubuntu-base:
	cd ubuntu/base-focal && make build

ubuntu-golang:
	cd ubuntu/golang && make build

ubuntu-deploy:
	cd ubuntu/deploy && make build

ubuntu-ros:
	cd ubuntu/ros && make build

ubuntu-ros2:
	cd ubuntu/ros2 && make build

ubuntu-ros-all:
	cd ubuntu/ros-all && make build

ubuntu-node:
	cd ubuntu/node && make build

ubuntu-vnc:
	cd ubuntu/vnc && make build

ubuntu-vnc-ros1:
	cd ubuntu/vnc && make build-ros1

ubuntu-vnc-ros2:
	cd ubuntu/vnc && make build-ros2

ubuntu-net:
	cd ubuntu/net-tool && make build

ubuntu-jdk11:
	cd ubuntu/java && make build

ubuntu-rust:
	cd ubuntu/rust && make build
