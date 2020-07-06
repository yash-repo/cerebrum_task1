FROM ubuntu:20.04
RUN yum install wget -y
RUN yum install net-tools -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install jenkins -y
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install -y initscripts
RUN yum install git -y
RUN yum install iptables -y
RUN echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo  "rm -f /var/run/jenkins.pid" >> /root/.bashrc
RUN echo  "/etc/rc.d/init.d/jenkins start" >> /root/.bashrc
