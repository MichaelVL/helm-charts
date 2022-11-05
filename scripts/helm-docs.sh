#! /bin/bash

CHARTS="$(cd "$(dirname "$0")/.." && pwd)"

docker run --rm -u $(id -u) -v "$CHARTS:/helm-docs" jnorwood/helm-docs:v1.11.0
