SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

ubuntu-base:
	cd ${SELF_DIR}base-focal && make build

ubuntu-golang:
	cd ${SELF_DIR}golang && make build

ubuntu-deploy:
	cd ${SELF_DIR}deploy && make build

ubuntu-ros:
	cd ${SELF_DIR}ros && make build

ubuntu-ros2:
	cd ${SELF_DIR}ros2 && make build

ubuntu-ros-all:
	cd ${SELF_DIR}ros-all && make build

ubuntu-node:
	cd ${SELF_DIR}node && make build

ubuntu-vnc:
	cd ${SELF_DIR}vnc && make build

ubuntu-vnc-ros1:
	cd ${SELF_DIR}vnc && make build-ros1

ubuntu-vnc-ros2:
	cd ${SELF_DIR}vnc && make build-ros2

ubuntu-net:
	cd ${SELF_DIR}net-tool && make build

ubuntu-jdk11:
	cd ${SELF_DIR}java && make build

ubuntu-rust:
	cd ${SELF_DIR}rust && make build
