FROM ubuntu:22.04
EVN NAME ajaycont
EVN PASS 12345
RUN mkdir -p /var/run/sshd
RUN apt-get update && apt-get upgrade
RUN apt-get install -y openssh-server
RUN useradd -d /home/ajaycont -g root -G sudo -m -p $(echo "$PASS" | openssh passwd -l -stdin) $NAME
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
