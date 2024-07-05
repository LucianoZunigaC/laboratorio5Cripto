FROM ubuntu:14.10

COPY sources.list /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
RUN openssh-client \
RUN openssh-server

RUN mkdir /var/run/sshd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]