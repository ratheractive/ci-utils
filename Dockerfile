FROM debian:stable-slim

WORKDIR /helm

COPY plugins plugins

ENV HELM_DATA_HOME=/helm

RUN apt-get update && apt-get install -y curl openssl jq && \
    curl -s https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash && \
    curl -sL https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64.tar.gz | tar xz && mv yq_linux_amd64 /usr/bin/yq && \
    apt-get clean
