#!/bin/sh -e

DOCKER_INSTALLER_URL="https://get.docker.com"
OUTPUT="get-docker.sh"

if [ ! -f "files/$OUTPUT" ]; then
	rm files/*.* -f
	curl -fsSL "$DOCKER_INSTALLER_URL" -o "files/$OUTPUT"
	chmod 0755 "files/$OUTPUT"
fi

on_chroot << EOF
	sh "files/$OUTPUT"
EOF
