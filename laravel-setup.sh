#!/bin/bash

# Add ondrej/php PPA
sudo add-apt-repository ppa:ondrej/php

# Update package lists
sudo apt-get update

# Install PHP 8.1 and related modules
sudo apt-get install php8.1 libapache2-mod-php8.1 php8.1-mysql

sudo apt-get install nginx

sudo systemctl start nginx

sudo systemctl enable nginx

# Install MySQL Server
sudo apt-get install mysql-server

# Secure the MySQL installation by running the security script
sudo mysql_secure_installation


# Get the MySQL root password from the user
read -s -p "Enter MySQL root password: " root_password

# Update the package list
sudo apt-get update

# Install MySQL Server
sudo apt-get install mysql-server

# Secure the MySQL installation by running the security script
sudo mysql_secure_installation

# Log in to MySQL as the root user
mysql -u root -p"$root_password" <<EOF

# Create a new MySQL user and grant them privileges
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'localhost' WITH GRANT OPTION;

# Exit MySQL
EXIT
EOF

echo "MySQL user 'newuser' with password 'password' has been created."