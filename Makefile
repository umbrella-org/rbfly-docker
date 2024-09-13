include .env

USERNAME := codcod66
RELEASE := latest

.EXPORT_ALL_VARIABLES: build
build:
	docker build -t $(USERNAME)/rbfly:$(RBFLY_VER)-python$(PYTHON_VER)-bookworm-slim \
		--build-arg PYTHON_VER="$(PYTHON_VER)" \
		--build-arg RBFLY_VER="$(RBFLY_VER)" \
		.

push:
	docker push $(USERNAME)/rbfly:$(RBFLY_VER)-python$(PYTHON_VER)-bookworm-slim
