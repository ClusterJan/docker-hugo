#!/bin/sh

# This file is triggered inside the _base/Dockerfile-base file.

set -e
set -u

# Variables
PANDOC_ARCH="amd64"
PANDOC_VERSION="2.11.4"

# Download
wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-${PANDOC_ARCH}.tar.gz \
  -O /pandoc.tar.gz

# Unpack
tar -zxvf pandoc.tar.gz

# Prepare for image
mkdir -p /files/bin
mv /pandoc-${PANDOC_VERSION}/bin/pandoc /files/bin/pandoc-default

/files/bin/pandoc-default -v