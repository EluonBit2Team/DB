# Dockerfile
FROM centos:7

# Update repository URLs and install necessary packages
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum update -y && \
    yum install -y openssh-server sudo git make gcc wget && \
    yum clean all

# Create a user and set password
RUN useradd -m -d /home/eluon -s /bin/bash eluon && \
    echo "eluon:1q2w3e4r" | chpasswd && \
    echo 'eluon ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install MariaDB connector dependencies
RUN wget https://r.mariadb.com/downloads/mariadb_repo_setup && \
    chmod +x mariadb_repo_setup && \
    ./mariadb_repo_setup --mariadb-server-version="mariadb-10.5" && \
    yum install -y mariadb-shared mariadb-devel && \
    yum clean all

# Enable SSH
RUN ssh-keygen -A && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config && \
    echo "AllowUsers eluon" >> /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]

