# Makefile for docker-uinifi-api-client
prepare:
		echo "Preparing directories: Build dir\n"
		if [ ! -d ".build" ]; then \
		mkdir -m 700 ".build"; \
		fi	
		echo "Preparing directories: Settings dir\n"
		if [ ! -d ".settings" ]; then \
		mkdir -m 700 ".settings"; \
		fi
		echo "Preparing directories: Source dir\n"
		if [ ! -d "src/docker" ]; then \
		mkdir -p "src/docker"; \
		fi
		echo "Preparing files: Environment file\n"
		if [ ! -f ".env" ]; then \
		touch .env; \
		fi
		echo "Preparing files: Funtions file\n"
		if [ ! -d ".functions" ]; then \
		touch .functions; \
		fi

	chmod 700 .functions;
	chmod 600 .env;

		echo "Create files: Dockerfile\n"
		if [ ! -d "Dockerfile" ]; then \
		touch Dockerfile; \
		fi

		echo "Create files: entrypoint.sh\n"
		if [ ! -d "src/docker/entrypoint.sh" ]; then \
		touch src/docker/entrypoint.sh; \
		fi