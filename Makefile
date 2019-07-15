# Simple Makefile to build docker
#
DOCKER_NAME ?=neofob/port_listen
DOCKER_TAG ?=latest
DOCKERFILE_PATH ?=.
PORT_NUMBER ?=3000

docker:
	docker build -t $(DOCKER_NAME):$(DOCKER_TAG) $(DOCKERFILE_PATH)

# Just for testing
up:
	docker run --rm -p $(PORT_NUMBER):$(PORT_NUMBER) -e PORT_NUMBER=$(PORT_NUMBER) $(DOCKER_NAME):$(DOCKER_TAG)

clean:
	docker rmi $(DOCKER_NAME):$(DOCKER_TAG)
