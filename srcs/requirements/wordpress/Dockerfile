FROM debian:oldstable

RUN apt-get update

RUN apt-get -y install wget

RUN apt-get install -y php-fpm
RUN apt-get install	-y php-mysql
RUN apt-get install -y mariadb-client
RUN apt-get install -y curl
RUN apt-get install -y netcat

RUN mkdir -p /run/php
RUN chmod 777 /run/php

RUN mkdir -p /var/www/html/run/php
RUN chmod 777 /var/www/html/run/php

COPY ./conf/default.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh script.sh

EXPOSE 9000

CMD [ "/script.sh" ]
