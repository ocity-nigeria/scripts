#!/bin/bash

# Add ondrej/php PPA
sudo add-apt-repository ppa:ondrej/php

# Update package lists
sudo apt-get update

# Install PHP 8.1 and related modules
sudo apt install -y php8.1-fpm  php8.1-cli php8.1-gd php8.1-mysql php8.1-pgsql php8.1-imap php8.1-memcached php8.1-mbstring php8.1-xml php8.1-curl php8.1-bcmath php8.1-sqlite3 php8.1-xdebug php8.1-ctype php8.1-zip

sudo apt-get install nginx

sudo systemctl start nginx

sudo systemctl enable nginx

# Install MySQL Server
sudo apt-get install mysql-server

# Secure the MySQL installation by running the security script
sudo mysql_secure_installation

