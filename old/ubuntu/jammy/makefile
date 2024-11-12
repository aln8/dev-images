UBUNTU_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

jammy-base:
	cd ${UBUNTU_DIR}base && make buildx

jammy-golang:
	cd ${UBUNTU_DIR}golang && make buildx

jammy-deploy:
	cd ${UBUNTU_DIR}deploy && make buildx

jammy-ros2:
	cd ${UBUNTU_DIR}ros2 && make buildx

jammy-ros2-nodejs:
	cd ${UBUNTU_DIR}ros2-nodejs && make buildx

jammy-ros2-rust:
	cd ${UBUNTU_DIR}ros2-rust && make buildx

jammy-ros-all:
	cd ${UBUNTU_DIR}ros-all && make build

jammy-node:
	cd ${UBUNTU_DIR}node && make buildx

jammy-vnc:
	cd ${UBUNTU_DIR}vnc && make build

jammy-vnc-ros1:
	cd ${UBUNTU_DIR}vnc && make build-ros1

jammy-vnc-ros2:
	cd ${UBUNTU_DIR}vnc && make build-ros2

jammy-net:
	cd ${UBUNTU_DIR}net-tool && make build

jammy-jdk11:
	cd ${UBUNTU_DIR}java && make build

jammy-rust:
	cd ${UBUNTU_DIR}rust && make build

jammy-perc-bionic:
	cd ${UBUNTU_DIR}perc-bionic && make build
