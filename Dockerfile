FROM ubuntu:20.04
RUN apt update
RUN apt-get install wget net-tools gnupg -y
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |  apt-key add - ; exit 0
RUN echo  'deb https://pkg.jenkins.io/debian-stable binary/' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install jenkins openjdk-8-jdk  -y

EXPOSE 8080

RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo  'rm -f /var/run/jenkins.pid' >> /root/.bashrc
RUN echo  '/etc/init.d/jenkins start' >> /root/.bashrc

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
COPY jenkins-support  /usr/local/bin/jenkins-support
RUN sudo /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
