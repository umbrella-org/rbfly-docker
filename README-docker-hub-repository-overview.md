<!--

The content of this file are submitted as repository overview in Docker Hub:
https://hub.docker.com/repository/docker/codcod66/rbfly

-->

Note: the description for this image can be found at https://github.com/umbrella-org/rbfly-docker/blob/main/README-docker-hub-repository-overview.md.

# Quick reference

-   **Maintained by**:

    https://github.com/umbrella-org/rbfly-docker

# Supported tags and respective `Dockerfile` links

-	[`latest`](link to Dockerfile)

# How to use this image

## start an rbfly instance

```console
$ docker run --rm codcod66/rbfly:0.9.0-python3.12-bookworm-slim bash
```

## ... but most likely you'd like to build on top of it

```yaml
# syntax=docker/dockerfile:1

FROM codcod66/rbfly:0.9.0-python3.12-bookworm-slim
...
```
