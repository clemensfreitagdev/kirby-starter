IMAGE_NAME := docker-starterkit

.PHONY: all
all: run

.PHONY: build
build:
	@echo "Building the project..."
	docker build -t docker-starterkit .

.PHONY: rebuild
rebuild: clean build

.PHONY: run
run: 
	@echo "Running the project..."
	docker run --name kirby -p 80:80 docker-starterkit

.PHONY: clean
clean:
    @echo "Cleaning up..."
    CONTAINER_ID=$$(docker ps --all -q --filter name=/kirby); \
    if [ -n "$$CONTAINER_ID" ]; then \
        docker stop $$CONTAINER_ID; \
        docker rm $$CONTAINER_ID; \
    else \
        echo "No containers to clean."; \
    fi