FROM fedora:27
RUN dnf update --assumeyes
RUN \
    curl \
    --location \
    --output /usr/local/sbin/minikube \
    https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && \
    chmod +x /usr/local/sbin/minikube