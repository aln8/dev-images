UBUNTU_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

focal-base:
	cd ${UBUNTU_DIR}base && make buildx

focal-golang:
	cd ${UBUNTU_DIR}golang && make buildx

focal-deploy:
	cd ${UBUNTU_DIR}deploy && make build

focal-ros:
	cd ${UBUNTU_DIR}ros && make build

focal-ros2:
	cd ${UBUNTU_DIR}ros2 && make buildx

focal-ros2-humble:
	cd ${UBUNTU_DIR}ros2-humble && make buildx

focal-ros2-nodejs:
	cd ${UBUNTU_DIR}ros2-nodejs && make buildx

focal-ros2-rust:
	cd ${UBUNTU_DIR}ros2-rust && make buildx

focal-ros-all:
	cd ${UBUNTU_DIR}ros-all && make build

focal-node:
	cd ${UBUNTU_DIR}node && make buildx

focal-vnc:
	cd ${UBUNTU_DIR}vnc && make build

focal-vnc-ros1:
	cd ${UBUNTU_DIR}vnc && make build-ros1

focal-vnc-ros2:
	cd ${UBUNTU_DIR}vnc && make build-ros2

focal-net:
	cd ${UBUNTU_DIR}net-tool && make build

focal-jdk11:
	cd ${UBUNTU_DIR}java && make build

focal-rust:
	cd ${UBUNTU_DIR}rust && make build

focal-perc-bionic:
	cd ${UBUNTU_DIR}perc-bionic && make build
