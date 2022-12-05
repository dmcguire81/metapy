FROM ghcr.io/illinois/meta:3.0.2 as base

ARG TARGETARCH
COPY . /metapy

RUN apt-get update && apt-get install -y \
    python-is-python3 \
    python3-dev \
    python3-pip

WORKDIR /metapy
RUN git submodule update --init --recursive -- deps/pybind11
RUN mkdir build
RUN sed -i 's:add_subdirectory(deps/meta EXCLUDE_FROM_ALL):find_package(MeTA 3.0.2 REQUIRED):g' CMakeLists.txt
RUN pip install .

FROM base AS branch-arm64
ENV LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libjemalloc.so.2

FROM base AS branch-amd64
ENV LD_PRELOAD=/lib/x86_64-linux-gnu/libjemalloc.so.2

FROM branch-${TARGETARCH} AS final

WORKDIR /app