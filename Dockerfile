FROM ubuntu:22.04

    # Enable colour prompt
RUN sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' /root/.bashrc && \
    # Enable man pages
    sed -i 's|^path-exclude=/usr/share/man|# path-exclude=/usr/share/man|' /etc/dpkg/dpkg.cfg.d/excludes
# Install common software
# DL3008 warning: Pin versions in apt get install. Instead of `apt-get install <package>` use `apt-get install <package>=<version>`
# hadolint ignore=DL3008 
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install --no-install-recommends -y ca-certificates less man manpages-posix vim jq net-tools iproute2 netcat dnsutils curl iputils-ping iptables nmap tcpdump openssl && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash default && \
# Support arbitrary user ids
    chgrp -R 0 /home/default && \
    chmod -R g=u /home/default

USER default
WORKDIR /home/default
