#! /bin/bash

set -ex

CHARTS="$(cd "$(dirname "$0")/.." && pwd)"

docker run --rm -it -u $(id -u) --workdir=/data -v $CHARTS:/data:ro quay.io/helmpack/chart-testing:v3.7.1 ct lint --config scripts/configs/ct-lint.yaml
