FROM nix-docker.registry.twcstorage.ru/ci/build/common-build:1.2.0000@sha256:8b81fda6079f11574d782000ae8d732a4f88569618d6c0f86c65a986cd568871

LABEL org.opencontainers.image.authors="wizardy.oni@gmail.com"

USER root

# Install dotnet
ARG DOTNET_VERSION=9.0
RUN microdnf -y --refresh \
                --setopt=install_weak_deps=0 \
                --setopt=tsflags=nodocs install dotnet-sdk-${DOTNET_VERSION} \
    && dotnet --version\
    && microdnf clean all \
    && rm -rf /var/cache/dnf /var/cache/yum

USER jenkins
