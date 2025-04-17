FROM debian:oldstable

RUN apt-get update -y
RUN apt-get install mariadb-server -y

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chown mysql:mysql /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chown -R mysql:mysql /etc/mysql /var/lib/mysql /run/mysqld

COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

CMD ["/script.sh"]
