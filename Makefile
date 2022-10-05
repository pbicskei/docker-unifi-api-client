# Makefile for docker-unifi-api-client

intro:
	echo "Hello from docker-unifi-api-client"

delete:
	rm -r .build

load:
	chmod +x src/scripts/prepare.sh
	src/scripts/prepare.sh
	chmod +x src/scripts/load-calls.sh
	src/scripts/load-calls.sh
	
build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --no-cache \
	--build-arg APP_NAME=art_of_wifi \
	-t unifi-api-client -f ./src/docker/Dockerfile.client .

run:
	docker run -it --name unifi-api-client \
	-e CONTROLLER_USER=${UBNT_USER} \
	-e CONTROLLER_PASSWORD=${UBNT_PASSWORD} \
	-e CONTROLLER_URL=${UBNT_URL} \
	-e CONTROLLER_VERSION=${UBNT_VERSION} \
	unifi-api-client calls/list_sites.php
	docker container rm unifi-api-client
