
# Get the MySQL root password from the user
read -s -p "Enter MySQL root password: " root_password
read -s -p "Enter Dialogflux database user name: " databaseUser
read -s -p "Enter Dialogflux database user password: " databaseUserPassword

# Update the package list
sudo apt-get update

# Install MySQL Server
sudo apt-get install mysql-server

# Secure the MySQL installation by running the security script
sudo mysql_secure_installation

# Log in to MySQL as the root user
mysql -u root -p"$root_password" <<EOF

# Create a new MySQL user and grant them privileges
CREATE USER '$databaseUser'@'localhost' IDENTIFIED BY '$databaseUserPassword';
GRANT ALL PRIVILEGES ON *.* TO '$databaseUser'@'localhost' WITH GRANT OPTION;

# Exit MySQL
EXIT
EOF

echo "MySQL user '$databaseUser' with password 'password' has been created. PHP and NGINX Installed"

 