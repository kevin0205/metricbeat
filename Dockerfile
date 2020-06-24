# Base
FROM alpine:latest AS base
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

# Builder
FROM golang:latest AS builder
# Use Docker Buildx
#FROM --platform=$TARGETPLATFORM golang:latest AS builder
#ARG TARGETPLATFORM
#ARG BUILDPLATFORM
ARG VERSION
ARG GO_ARCH

ENV CGO_ENABLED=0 GOOS=linux GOARCH=${GO_ARCH:-arm64}

# GO
#RUN go get -x github.com/elastic/beats; exit 0
RUN go get github.com/elastic/beats; exit 0

WORKDIR $GOPATH/src/github.com/elastic/beats

#ENV CGO_ENABLED=0 GOOS=linux GOARCH=${GO_ARCH:-arm64}
RUN git fetch && \
    git checkout tags/v${VERSION:-7.6.2} && \
    cd metricbeat && \
    make
    #CGO_ENABLED=0 GOOS=linux GOARCH=${GO_ARCH:-arm64} make

# GIT
#RUN set -ex; \
#    mkdir -p $GOPATH/src/github.com/elastic \
#    git -C $GOPATH/src/github.com/elastic clone --depth 1 --single-branch --branch v${VERSION:-7.6.2} https://github.com/elastic/beats

#WORKDIR $GOPATH/src/github.com/elastic/beats

#ENV CGO_ENABLED=0 GOOS=linux GOARCH=${GO_ARCH:-arm64}
#RUN cd metricbeat && \
#    make
    #CGO_ENABLED=0 GOOS=linux GOARCH=${GO_ARCH:-arm64} make
