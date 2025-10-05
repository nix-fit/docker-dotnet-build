FROM nix-docker.registry.twcstorage.ru/ci/build/common-build:1.0.0000@sha256:d16f74f1c0c7d968960285a069a6b3aa326d44a73ebe6c23f0be6ce891bd5939

LABEL org.opencontainers.image.authors="wizardy.oni@gmail.com"

USER root

# Install dotnet
ARG DOTNET_MAJOR_VERSION=9.0
ARG DOTNET_VERSION=9.0.110
RUN microdnf -y --refresh \
                --setopt=install_weak_deps=0 \
                --setopt=tsflags=nodocs install dotnet-sdk-${DOTNET_MAJOR_VERSION}-${DOTNET_VERSION} \
    && dotnet --version\
    && microdnf clean all \
    && rm -rf /var/cache/dnf /var/cache/yum

USER jenkins
