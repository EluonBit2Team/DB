#!/bin/bash

# Wait for MariaDB to be fully set up
echo "Waiting for MariaDB to initialize..."
sleep 5  # Adjust this value as needed to ensure MariaDB is ready

# Start SSH service
echo "Starting SSH service..."
/usr/sbin/sshd -D &

# Pull the latest code and build the project
echo "Updating and building the server application..."
su - eluon -c "cd /home/eluon/git && git clone https://github.com/EluonBit2Team/Server.git && cd Server && git pull && make"

# Start your server application
echo "Starting server application..."
su - eluon -c "cd /home/eluon/git/Server && ./epoll_server.out"

# Keep the container running
tail -f /dev/null