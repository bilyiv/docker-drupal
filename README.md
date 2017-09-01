# Docker Drupal

The docker infrastructure for drupal 8 projects.

## Getting started

Create the Drupal project via composer under `src` directory:
```
composer create-project drupal-composer/drupal-project:8.x-dev src --stability dev --no-interaction
```
Read about [Composer template for Drupal projects](https://github.com/drupal-composer/drupal-project)


Run the command `sh run.sh reset` then you will have completely installed drupal website available on [localhost](http://localhost)
with the *admin*/*secret* credentials. Also, you will have the mailhog available on [localhost:8025](http://localhost:8025),
which catches up all emails from the site.

**Be careful**, the `sh run.sh reset` command will remove database data each time.

There are available commands:

* `sh run.sh build` - use for building docker images;
* `sh run.sh up` - use for running docker containers;
* `sh run.sh down` - use for stopping docker containers;
* `sh run.sh remove` - use for removing docker containers;
* `sh run.sh reset` - use for removing, building and running docker containers;
