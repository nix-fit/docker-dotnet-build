FROM nix-docker.registry.twcstorage.ru/ci/build/common-build:1.3.0000

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
