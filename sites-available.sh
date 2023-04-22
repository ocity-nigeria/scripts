server {
    server_name dialogflux.ocity.ng;
    root /var/www/dialogflux/public/;

    index index.html index.htm index.php;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";

    location / {
         try_files $uri $uri/ /index.php?$query_string;
     }

    location ~ \.php$ {
#        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
     }

    location ~ /\.ht {
        deny all;
    }


}