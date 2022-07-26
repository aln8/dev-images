UBUNTU_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

ubuntu-base:
	cd ${UBUNTU_DIR}base-focal && make build

ubuntu-golang:
	cd ${UBUNTU_DIR}golang && make buildx

ubuntu-deploy:
	cd ${UBUNTU_DIR}deploy && make build

ubuntu-ros:
	cd ${UBUNTU_DIR}ros && make build

ubuntu-ros2:
	cd ${UBUNTU_DIR}ros2 && make build

ubuntu-ros2-nodejs:
	cd ${UBUNTU_DIR}ros2-nodejs && make buildx

ubuntu-ros2-rust:
	cd ${UBUNTU_DIR}ros2-rust && make buildx

ubuntu-ros-all:
	cd ${UBUNTU_DIR}ros-all && make build

ubuntu-node:
	cd ${UBUNTU_DIR}node && make buildx

ubuntu-vnc:
	cd ${UBUNTU_DIR}vnc && make build

ubuntu-vnc-ros1:
	cd ${UBUNTU_DIR}vnc && make build-ros1

ubuntu-vnc-ros2:
	cd ${UBUNTU_DIR}vnc && make build-ros2

ubuntu-net:
	cd ${UBUNTU_DIR}net-tool && make build

ubuntu-jdk11:
	cd ${UBUNTU_DIR}java && make build

ubuntu-rust:
	cd ${UBUNTU_DIR}rust && make build

ubuntu-perc-bionic:
	cd ${UBUNTU_DIR}perc-bionic && make build
