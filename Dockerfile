# Base
FROM alpine AS base
# Use Docker Buildx
#FROM --platform=$TARGETPLATFORM alpine AS base
#ARG TARGETPLATFORM
#ARG BUILDPLATFORM
ARG VERSION
RUN set -ex; \
    apk add --no-cache curl wget && \
    cd /tmp && \
    wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-${VERSION:-7.6.2}-linux-x86_64.tar.gz && \
    tar -xzf metricbeat-${VERSION:-7.6.2}-linux-x86_64.tar.gz && \
    rm -rf metricbeat-${VERSION:-7.6.2}-linux-x86_64/metricbeat
