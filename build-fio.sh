#!/bin/bash

# 기본값 설정
IMAGE_REPO=${IMAGE_REPO:-cr.makina.rocks/external-hub}
IMAGE_NAME=${IMAGE_NAME:-ubuntu-fio}
IMAGE_TAG=${IMAGE_TAG:-latest}

FULL_IMAGE="${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"

docker build -t "$FULL_IMAGE" .

echo "✅ Build complete: $FULL_IMAGE"
