FROM debian:stable-slim

WORKDIR /helm

COPY plugins plugins

ENV HELM_DATA_HOME=/helm

RUN apt-get update && apt-get install -y curl ca-certificates openssl jq && \
    curl -s https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 --version v3.7.0 | bash && \
    curl -sL https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64.tar.gz | tar xz && mv yq_linux_amd64 /usr/bin/yq && \
    apt-get clean

RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && apt-get install kubectl=1.21.5-00 && apt-get clean
