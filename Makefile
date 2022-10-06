# Makefile for docker-unifi-api-client

intro:
	echo "Hello from docker-unifi-api-client"

load:
	chmod +x src/scripts/prepare.sh
	src/scripts/prepare.sh
	chmod +x src/scripts/load-calls.sh
	src/scripts/load-calls.sh
	
build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --no-cache \
	--build-arg APP_NAME=art_of_wifi \
	-t unifi-api-client -f ./src/docker/Dockerfile.client .

flush_build:
	rm -r .build
