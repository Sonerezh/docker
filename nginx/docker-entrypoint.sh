#!/bin/bash
set -e

if [ -z "$SONEREZH_DB_PORT_3306_TCP_ADDR" ]; then
	echo >&2 'error: missing required SONEREZH_DB_ENV_MYSQL_PASSWORD environment variable'
	echo >&2 '	Did you forget to --link some-mysql-container:mysql?'
	exit 1
fi

if [ -z "$SONEREZH_DB_ENV_MYSQL_DATABASE" ]; then
	echo >&2 'error: missing required SONEREZH_DB_ENV_MYSQL_PASSWORD environment variable'
	echo >&2 '	Did you forget to --link some-mysql-container:mysql?'
	exit 1
fi

if [ -z "$SONEREZH_DB_ENV_MYSQL_USER" ]; then
	echo >&2 'error: missing required MYSQL_USER environment variable'
	echo >&2 '	Did you forget to --link some-mysql-container:mysql?'
	exit 1
fi

if [ -z "$SONEREZH_DB_ENV_MYSQL_PASSWORD" ]; then
	echo >&2 'error: missing required MYSQL_PASSWORD environment variable'
	echo >&2 '	Did you forget to --link some-mysql-container:mysql?'
	exit 1
fi

sed -i "s/SONEREZH_DB_PORT_3306_TCP_ADDR/${SONEREZH_DB_PORT_3306_TCP_ADDR}/" /usr/share/nginx/sonerezh/app/Config/database.php
sed -i "s/SONEREZH_DB_ENV_MYSQL_DATABASE/${SONEREZH_DB_ENV_MYSQL_DATABASE}/" /usr/share/nginx/sonerezh/app/Config/database.php
sed -i "s/SONEREZH_DB_ENV_MYSQL_USER/${SONEREZH_DB_ENV_MYSQL_USER}/" /usr/share/nginx/sonerezh/app/Config/database.php
sed -i "s/SONEREZH_DB_ENV_MYSQL_PASSWORD/${SONEREZH_DB_ENV_MYSQL_PASSWORD}/" /usr/share/nginx/sonerezh/app/Config/database.php
sed -i "s/define('DOCKER', false)/define('DOCKER', true)/" /usr/share/nginx/sonerezh/app/Config/bootstrap.php

exec "$@"
