# Sonerezh with Docker

This is the Git repository of the official Docker image for [Sonerezh](https://www.sonerezh.bzh). See the Hub page for more informations.

**WARNING**: the Docker image for Sonerezh is absolutely not stable. Your Sonerezh data (preferences, users, thumbnails) will be lost if you delete your container. Sonerezh is not *Docker compliant* for the moment. Some functionnality are broken too: email notifications for example.

# How to build this image

Simply clone this repository and use `docker build`:

```sh
$ git clone --master https://github.com/Sonerezh/docker.git
$ cd docker/nginx
$ docker build --tag sonerezh .
```
# How to use this image

## Manually

You can configure your Sonerezh instance manually. First you will need to run `mysql` or `mariadb` container:

```sh
$ docker run --name sonerezh-mariadb --env MYSQL_ROOT_PASSWORD=changeme \
									 --env MYSQL_USER=sonerezh \
									 --env MYSQL_PASSWORD=changemetoo \
									 --env MYSQL_DATABASE=sonerezh \
									 --volume /path/to/mysql/data:/var/lib/mysql \
									 --detach mariadb
```

And then run Sonerezh container:

```sh
$ docker run --name sonerezh-app --link sonerezh-mariadb:mariadb \
								 --volume /path/to/music:/music \
								 --detach --publish 8080:80 \
								 sonerezh/sonerezh:latest
```

Your Sonerezh instance is available at http://127.0.0.1:8080 :)

## Via docker-compose

Coming soon

# Contributing
You are invited to contribute new features, fixes, or update, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.
Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/Sonerezh/sonerezh/issues), especially for more ambitious contributions.
