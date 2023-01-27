FROM debian:buster

WORKDIR /etc/nginx

RUN apt-get update && apt-get install -y \
    && apt-get install nginx curl -y \
    && rm -rf /var/lib/apt/lists/*

COPY ./nginx.conf ./sites-available/abastos.42.fr.conf
RUN ln -s /etc/nginx/sites-available/abastos.42.fr.conf /etc/nginx/sites-enabled/abastos.42.fr.conf \
    && rm -rf /etc/nginx/sites-enabled/default

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
