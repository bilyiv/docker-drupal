# Docker Drupal

The docker structure for drupal 8 projects.

## Getting started

Put your Drupal site to src directory then just run command `sh run.sh reset` then you will have installed drupal
website available on localhost with the admin/secret credentials. Also you will have the mailhog which catch up all
emails from this site available on localhost:8025.


There are available commands:

* `sh run.sh build` - use for building docker images;
* `sh run.sh up` - use for running docker containers;
* `sh run.sh down` - use for stopping docker containers;
* `sh run.sh remove` - use for removing docker containers;
* `sh run.sh reset` - use for removing, building and running docker containers;
