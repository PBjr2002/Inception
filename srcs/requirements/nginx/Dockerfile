FROM debian:oldstable

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nginx openssl
RUN apt install -y curl

COPY ./conf/default.conf /
COPY ./tools/script.sh /

CMD ["/script.sh"]