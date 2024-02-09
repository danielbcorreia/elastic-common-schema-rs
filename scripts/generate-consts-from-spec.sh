#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CRATE_DIR="${SCRIPT_DIR}/../"

# freeze the spec version and generator version to make generation reproducible
SPEC_VERSION=8.11.0

cd "$CRATE_DIR"

rm -rf ecs || true
mkdir ecs
cd ecs

git init
git remote add origin https://github.com/elastic/ecs.git
git fetch origin "v$SPEC_VERSION"
git reset --hard FETCH_HEAD
cd "$CRATE_DIR"

yq '{"root": .}' ./ecs/generated/ecs/ecs_nested.yml | jinja2 --format yaml scripts/templates/ecs-consts.rs.j2 - > ./src/ecs.rs

cargo fmt
cargo clippy
cargo test