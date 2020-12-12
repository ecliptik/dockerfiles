FROM debian:10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 php && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod ssl
RUN rm /etc/apache2/sites-enabled/*
COPY ssl.conf /etc/apache2/sites-enabled/
COPY php.ini /etc/php/7.3/apache2/php.ini
RUN chown -R www-data:www-data /var/www/

EXPOSE 443
CMD ["/usr/sbin/apache2ctl", "-D",  "FOREGROUND"]
