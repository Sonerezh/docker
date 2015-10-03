FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# Install what we need
RUN apt-get update && apt-get upgrade -y && apt-get install -y \ 
	git \
	libav-tools \
	nginx \
	php5-fpm \
	php5-gd \
	php5-mysql \
	supervisor

# Install Sonerezh
RUN git clone https://github.com/Sonerezh/sonerezh.git /usr/share/nginx/sonerezh && \
	chown -R www-data: /usr/share/nginx/sonerezh && \
	chmod 775 -R /usr/share/nginx/sonerezh

# Prepare volume
RUN mkdir /music && \
	chown www-data: /music

VOLUME /music
#VOLUME /usr/share/nginx/sonerezh/app/webroot/img/thumbnails

# Copy image configuration
RUN rm -f /etc/nginx/sites-enabled/default
COPY default /etc/nginx/sites-enabled/default
COPY supervisord.conf etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
