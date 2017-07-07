#!/bin/sh

# INFO
if [ "$1" = "" ]; then
    echo "Available commands:"
    echo "  * build  - building containers"
    echo "  * remove - removing containers"
    echo "  * up     - upping containers"
    echo "  * down   - downing containers"
    echo "  * reset  - resetting containers"
fi

# BUILD
if [ "$1" = "build" ]; then
    echo "Building containers"
    docker-compose -f ./infra/docker/docker-compose.yml build
    echo "Successfully built!"
fi

# UP
if [ "$1" = "up" ]; then
    echo "Upping containers"
    docker-compose -f ./infra/docker/docker-compose.yml up -d

    echo "Installing composer dependencies"
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm composer install --prefer-source --no-interaction

    echo "Installing drupal"
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm vendor/bin/drush --root=web si minimal --account-name=admin --account-pass=secret --db-url=mysql://root:secret@mariadb:3306/example --y
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm vendor/bin/drush --root=web config-set "system.site" uuid "860e0c08-e205-49b7-947f-962b639baf33" --y
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm vendor/bin/drush --root=web config-import --y

    echo "Successfully upped!"
fi

# DOWN
if [ "$1" = "down" ]; then
    echo "Downing containers"
    docker-compose -f ./infra/docker/docker-compose.yml stop
    echo "Successfully downed!"
fi

# REMOVE
if [ "$1" = "remove" ]; then
    echo "Removing containers"
    docker-compose -f ./infra/docker/docker-compose.yml down
    echo "Successfully removed!"
fi

# RESET
if [ "$1" = "reset" ]; then
    echo "Resetting containers"

    echo "Removing containers"
    docker-compose -f ./infra/docker/docker-compose.yml down
    echo "Successfully removed!"

    echo "Building containers"
    docker-compose -f ./infra/docker/docker-compose.yml build
    echo "Successfully built!"

    echo "Upping containers"
    docker-compose -f ./infra/docker/docker-compose.yml up -d

    echo "Installing composer dependencies"
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm composer install --prefer-source --no-interaction

    echo "Installing drupal"
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm vendor/bin/drush --root=web si minimal --account-name=admin --account-pass=secret --db-url=mysql://root:secret@mariadb:3306/example --y
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm vendor/bin/drush --root=web config-set "system.site" uuid "860e0c08-e205-49b7-947f-962b639baf33" --y
    docker-compose -f ./infra/docker/docker-compose.yml exec -d php-fpm vendor/bin/drush --root=web config-import --y

    echo "Successfully upped!"

    echo "Successfully reset!"
fi
