FROM centos
RUN yum install wget net-tools -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install jenkins java-11-openjdk.x86_64 initscripts git iptables -y
RUN echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo  "rm -f /var/run/jenkins.pid" >> /root/.bashrc
RUN echo  "/etc/rc.d/init.d/jenkins start" >> /root/.bashrc

