# Makefile for docker-unifi-api-client

run:
	echo "Hello from docker-unifi-api-client"

delete:
	rm -r .build
	rm -r .settings
	rm -r src

load:
		echo "Preparing directories: Build dir\n";
		
		if [ ! -d ".build" ]; then \
		mkdir -m 700 ".build"; \
		fi
		
		echo "Preparing files: Source dir\n";
		
		if [ ! -f ".build/README.md" ]; then \
		echo "# docker-unifi-api-client build environment" > ".build/README.md"; \
		fi

		echo "Preparing directories: Settings dir\n";
		
		if [ ! -d ".settings" ]; then \
		mkdir -m 700 ".settings"; \
		fi

		echo "Preparing file: README.md\n";
		
		if [ ! -f ".settings/README.md" ]; then \
		echo "# docker-unifi-api-client settings" > ".settings/README.md"; \
		fi
		
		echo "Preparing directories: Source dir\n";
		
		if [ ! -d "src/docker" ]; then \
		mkdir -p "src/docker"; \
		fi
		
		echo "Preparing files: Source dir\n";
		
		if [ ! -f "src/docker/README.md" ]; then \
		echo "# docker-unifi-api-client environment src" > "src/docker/README.md"; \
		fi

		echo "Preparing files: Environment file\n";
		
		if [ ! -f ".env" ]; then \
		echo "# docker-unifi-api-client environment file" > .env; \
		fi
		
		echo "Preparing files: environment functions\n"
		
		if [ ! -d ".functions" ]; then \
		echo "# docker-unifi-api-client" > .functions; \
		fi

		echo "Create files: Dockerfile\n";
		
		if [ ! -d "Dockerfile" ]; then \
		echo  Dockerfile; \
		echo "# docker-unifi-api-client environment file" > Dockerfile; \
		fi

		echo "Create files: entrypoint.sh\n";

		if [ ! -d "src/docker/entrypoint.sh" ]; then \
		touch src/docker/entrypoint.sh; \
		fi

		echo "Create files: entrypoint.sh\n"
		if [ ! -d "src/docker/entrypoint.sh" ]; then \
		touch src/docker/entrypoint.sh; \
		fi

	chmod 700 .functions;
	chmod 600 .env;

build:
	docker build -t unifi-api-client .;