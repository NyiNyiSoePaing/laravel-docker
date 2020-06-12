## Usage ##

# Clone my repo

* git clone https://gitlab.com/nyinyisoepaing1997/laravel-docker.git

# Copy your source code to web dir
Add your entire  project files to the "web" folder,
* cp {PROJECT_FILES} web/
* #mkdir web data-db (run if necessary)

# Edit docker env file 

* cp .env-docker  .env 
* vi .env


# Edit laravel env file in web dir

* cp web/.env.example web/.env
* vi web/.env

# Build and Run docker containers

* docker-compose up -d
* docker-compose up --build --force-recreate -d (recreate container)


# Show running container

* docker-compose ps

# Containers created and their ports are as follows:

- nginx      - ':80'
- phpmyadmin - ':8080'
- mysql- '127.0.0.1:3306'
- php -  '127.0.0.1:9000'


# For composer

* docker-compose exec  php composer install

# Run php command in php container
* docker-compose exec  php php /var/www/artisan key:generate
* docker-compose exec  php php /var/www/artisan migrate
* docker-compose exec  php php /var/www/artisan storage:link
* docker-compose exec  php chgrp -R www-data storage bootstrap/cache
* docker-compose exec  php chmod -R ug+rwx storage bootstrap/cache


# Premission for php files
* docker-compose exec  php chown www-data:www-data -R ./
* docker-compose exec  php find /var/www/ -type f -exec chmod 644 {} \;
* docker-compose exec  php find /var/www/ -type d -exec chmod 755 {} \;


# For shell login  container

* docker exec -it container-name bash(or)sh 

# Others commmands for docker-compose

* docker-compose stop/start
* docker-compose down (delete all running containers,network & volumes)

# https on production

* docker-compose exec nginx certbot --nginx -d www.example.com

