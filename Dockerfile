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
    sudo dnf install --assumeyes gcc kernel-devel kernel-headers dkms make bzip2 perl kernel-devel-$(uname -r) && \ 
    sudo dnf install --assumeyes VirtualBox-5.2 && \
    sudo /sbin/vboxconfig
RUN dnf install --assumeyes recordmydesktop
ENTRYPOINT bash