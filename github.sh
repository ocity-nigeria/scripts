 # Ask the user for the github repo link
echo "Enter the link of the github repository:"
read repo_link

# Greet the user using their name
echo "Hello, $name! Nice to meet you."
ssh-keygen -t rsa -b 4096 -C "sunday.m@ocity.ng"

pbcopy < ~/.ssh/id_rsa.pub

echo "Copy ssh key to sshkeys in the github repository"

cat ~/.ssh/id_rsa.pub

cd /var/www/

git clone $repo_link dialogflux

cd dialogflux

composer install --no-dev

php artisan key:generate

php artisan migrate



 