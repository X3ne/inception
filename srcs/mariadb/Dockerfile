FROM debian:buster

WORKDIR /var/lib/mysql

COPY mariadb-setup.sh mariadb-setup.sh

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x ./mariadb-setup.sh

EXPOSE 3306

ENTRYPOINT [ "./mariadb-setup.sh" ]
