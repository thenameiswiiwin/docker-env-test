#!/usr/bin/env bash
set -euo pipefail

echo "Detecting OS..."

if [[ "$(uname)" == "Darwin" ]]; then
    echo "Running Docker for macOS (Linux containers only)..."
    docker-compose up --build ubuntu arch alpine
elif [[ "$(uname -s)" == "Linux" ]]; then
    echo "Running Docker for Linux..."
    docker-compose up --build
elif [[ "$(uname -s)" =~ "NT" ]]; then
    echo "Running Docker for Windows..."
    docker-compose up --build windows
else
    echo "Unsupported OS"
    exit 1
fi
