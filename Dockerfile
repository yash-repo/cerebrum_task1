FROM ubuntu:20.04
RUN apt update
RUN apt-get install wget net-tools gnupg -y
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |  apt-key add - ; exit 0
RUN echo  'deb https://pkg.jenkins.io/debian-stable binary/' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install jenkins openjdk-8-jdk  -y

EXPOSE 8080
RUN echo  "rm -f /var/run/jenkins.pid" >> /root/.bashrc
RUN echo  "/etc/rc.d/init.d/jenkins start" >> /root/.bashrc
