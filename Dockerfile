# syntax=docker/dockerfile:1

# Docker image with RbFly preinstalled.
#
# - The same image with uv preinstalled is used as base.
# - GCC (build-essential) is required to build RbFly.
#
# ARG directives apply to a layer, that is why they need to be repeated.
# - PYTHON_VER (default: 3.12)
# - RBFLY_VER

# build stage

ARG PYTHON_VER
FROM ghcr.io/astral-sh/uv:python${PYTHON_VER:-3.12}-bookworm-slim AS builder
RUN apt-get update && apt-get install -y --no-install-recommends build-essential

ARG RBFLY_VER
WORKDIR /app
RUN uv pip install --system rbfly==${RBFLY_VER}
# RUN uv venv && uv pip install rbfly

# compile final image

ARG PYTHON_VER
FROM ghcr.io/astral-sh/uv:python${PYTHON_VER:-3.12}-bookworm-slim

ARG RBFLY_VER
ARG PYTHON_VER
ARG DIR="/usr/local/lib/python${PYTHON_VER:-3.12}/site-packages/rbfly"
COPY --from=builder ${DIR} ${DIR}
COPY --from=builder ${DIR}-${RBFLY_VER}.dist-info ${DIR}-${RBFLY_VER}.dist-info
COPY --from=builder /app /app

# reset entrypoint from parent
ENTRYPOINT []

CMD ["bash"]
