#!/usr/bin/env bash
echo "Preparing directories: Build dir";
    if [ ! -d ".build" ]; then \
    mkdir -m 700 ".build"; \
    fi
    echo "Preparing files: Source dir";
    if [ ! -f ".build/README.md" ]; then \
    echo "# docker-unifi-api-client build environment" > ".build/README.md"; \
    fi