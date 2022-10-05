#!/usr/bin/env bash
echo "Preparing directories: Build dir";
    
    if [ ! -d ".build" ]; then \
    mkdir -m 700 ".build"; \
    fi
    
    echo "Preparing files: Source dir";
    
    if [ ! -f ".build/README.md" ]; then \
    echo "# docker-unifi-api-client build environment" > ".build/README.md"; \
    fi
    
    echo "Preparing directories: Source dir";
    
    if [ ! -d "src/docker" ]; then \
    mkdir -p "src/docker"; \
    fi

    echo "Preparing directories: Config dir";
    
    if [ ! -d "config" ]; then \
    mkdir -m 700 "config"; \
    fi

    echo "Preparing file: README.md";
    
    if [ ! -f "config/README.md" ]; then \
    echo "# docker-unifi-api-client config" > "config/README.md"; \
    fi
    
    echo "Preparing files: Source dir";
    
    if [ ! -f "src/docker/README.md" ]; then \
    echo "# docker-unifi-api-client environment src" > "src/docker/README.md"; \
    fi

    echo "Preparing files: Environment file";
    
    if [ ! -f ".env" ]; then \
    echo "# docker-unifi-api-client environment file" > .env; \
    fi
    
    echo "Preparing files: environment functions"
    
    if [ ! -d ".functions" ]; then \
    echo "# docker-unifi-api-client" > .functions; \
    fi
    
chmod 700 .functions;
chmod 600 .env;