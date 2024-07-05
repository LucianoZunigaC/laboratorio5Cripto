FROM ubuntu:20.10

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    openssh-client \
    openssh-server \
    whois
    
RUN mkdir /var/run/sshd

RUN useradd -m test && \
    echo "test:test" | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]