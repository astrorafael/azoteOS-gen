#!/bin/sh -e

TMATE_URL="https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-arm32v7.tar.xz"
OUT_DIR=tmate-2.4.0-static-linux-arm32v7
DOWNLOADED_FILE="tmate-2.4.0.xz"
TMATE="tmate"

if [ ! -f "files/$DOWNLOADED_FILE" ]; then
	rm files/*.* -f
	curl -s -L "$TMATE_URL" -o "files/$DOWNLOADED_FILE"
	tar xvf "files/$DOWNLOADED_FILE" # produces OUT_DIR
fi

install -v -m 755 "$OUT_DIR/$TMATE" "${ROOTFS_DIR}/usr/bin/"
rm -fr "$OUT_DIR"
