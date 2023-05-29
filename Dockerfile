FROM ubuntu:22.04

    # Enable colour prompt
RUN sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' /root/.bashrc && \
    # Enable man pages
    sed -i 's|^path-exclude=/usr/share/man|# path-exclude=/usr/share/man|' /etc/dpkg/dpkg.cfg.d/excludes && \
    # Disable the installation of optional dependencies
    echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker && \
    echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

# Install common software 
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -y less man manpages-posix vim jq net-tools iproute2 netcat dnsutils curl iputils-ping iptables nmap tcpdump openssl && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash default && \
# Support arbitrary user ids
    chgrp -R 0 /home/default && \
    chmod -R g=u /home/default

USER default
WORKDIR /home/default
