## Usage ##

####  1. Clone my repo

* git clone https://github.com/nyinyisoepaing/laravel-docker.git

#### 2. Copy your source code to web dir
Add your entire  project files to the "web" folder.
```
 cp -r {PROJECT_FILES} app/
```

#### 3. Edit docker env file 
```
 cp .env-docker  .env 
 vi .env
```

<!-- # Edit laravel env file in app dir

* cp app/.env.example app/.env
* vi app/.env -->

#### 4. Build and Run docker containers

* docker-compose up -d
* docker-compose up --build --force-recreate -d (recreate container)


#### 5. Show running container

* docker-compose ps

#### 6. Containers created and their ports are as follows:

- nginx      - ':80'
- phpmyadmin - ':8080'
- mysql- '3306'
- php -  '9000'


#### 7. For composer
```
docker-compose exec  php composer install
```

#### 7.1 Run php command in php container
```
docker-compose exec  php php /var/www/artisan key:generate

docker-compose exec  php php /var/www/artisan migrate

docker-compose exec  php php /var/www/artisan storage:link

docker-compose exec  php chgrp -R www-data storage bootstrap/cache

docker-compose exec  php chmod -R ug+rwx storage bootstrap/cache
```
#### 7.2 Premission for php files

```

docker-compose exec  php chown www-data:www-data -R ./

docker-compose exec  php find /var/www/ -type f -exec chmod 644 {} \;

docker-compose exec  php find /var/www/ -type d -exec chmod 755 {} \;
```

#### 7.3 For shell login  container
```
docker exec -it container-name bash(or)sh 

```
#### 7.4 Others commmands for docker-compose

```
docker-compose stop/start
docker-compose down (delete all running containers,network & volumes)
```


