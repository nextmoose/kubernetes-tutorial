FROM fedora:27
RUN dnf update --assumeyes
RUN dnf install --assumeyes kubernetes-client
RUN \
    curl \
    --location \
    --output /usr/local/sbin/minikube \
    https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
    chmod +x /usr/local/sbin/minikube
RUN \
    curl \
    --location \
    --output /etc/yum.repos.d/virtualbox.repo \
    https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo && \
    dnf install --assumeyes gcc kernel-devel kernel-headers dkms make bzip2 perl kernel-devel-$(uname -r) && \ 
    dnf install --assumeyes VirtualBox-5.2 && \
    /sbin/vboxconfig
RUN dnf install --assumeyes libvirt-daemon-kvm qemu-kvm
RUN \
    dnf --assumeyes install dnf-plugins-core && \
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo && \
    dnf install --assumeyes docker-ce docker-ce-18.03.1.ce
RUN dnf install --assumeyes recordmydesktop
RUN dnf install --assumeyes firefox
RUN dnf install --assumeyes emacs*
RUN dnf install --assumeyes chromium
RUN \
    curl --location https://nodejs.org/dist/v8.11.2/node-v8.11.2-linux-x64.tar.xz | tar --directory /opt --extract -J --file - && \
    ln --symbolic --force /opt/node-v8.11.2-linux-x64 /usr/local/sbin
COPY server.js README.md /usr/local/src/
WORKDIR /usr/local/src
ENTRYPOINT bash