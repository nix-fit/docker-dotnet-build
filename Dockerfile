FROM nix-docker.registry.twcstorage.ru/ci/build/common-build:0.1.0@sha256:d7c61f3bc8d5fe85a16aa07e773ecbce9b24c1f7be3bb4fb5d08fcacdf2520a4

LABEL org.opencontainers.image.authors="wizardy.oni@gmail.com"

USER root

# Install dotnet
ARG DOTNET_VERSION=9.0
RUN microdnf -y --refresh \
                --setopt=install_weak_deps=0 \
                --setopt=tsflags=nodocs install dotnet-sdk-${DOTNET_VERSION} \
    && dotnet --version\
    && microdnf -y clean all \
    && rm -rf /var/cache/dnf /var/cache/yum

USER jenkins