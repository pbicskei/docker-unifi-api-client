# Makefile for docker-uinifi-api-client
prepare:
	echo "Preparing build environment: unifi-api-clien\n"
		if [ ! -d ".build" ]; then \
		mkdir -m 700 ".build"; \
		fi	
	echo "Preparing environment settings: unifi-api-clien\n"
		if [ ! -d ".settings" ]; then \
		mkdir -m 700 ".settings"; \
		fi
	echo "Preparing environment variables: unifi-api-client\n"
		if [ ! -f ".env" ]; then \
		touch .env; \
		fi
	echo "Preparing environment functions: unifi-api-client\n"
		if [ ! -d ".functions" ]; then \
		touch .functions; \
		fi
	chmod 700 .functions;
	chmod 600 .env;

dockerfile:
	echo "Preparing Directories: docker-unifi-api-client\n"
		if [ ! -d "src" ]; then \
		mkdir -p "src/docker"; \
		fi