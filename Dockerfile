FROM nix-docker.registry.twcstorage.ru/ci/build/common-build:1.1.0000@sha256:744b3dc2ed14b0f5433746500130c59907d83dddc09d81c3f374b69c79d6c858

LABEL org.opencontainers.image.authors="wizardy.oni@gmail.com"

USER root

# Install dotnet
ARG DOTNET_MAJOR_VERSION=9.0
ARG DOTNET_VERSION=9.0.112
RUN microdnf -y --refresh \
                --setopt=install_weak_deps=0 \
                --setopt=tsflags=nodocs install dotnet-sdk-${DOTNET_MAJOR_VERSION}-${DOTNET_VERSION} \
    && dotnet --version\
    && microdnf clean all \
    && rm -rf /var/cache/dnf /var/cache/yum

USER jenkins
