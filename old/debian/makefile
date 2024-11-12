DEBIAN_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

debian-base:
	cd ${DEBIAN_DIR}base-bulleyes && make build
