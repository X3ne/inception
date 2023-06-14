FROM debian:buster

WORKDIR /etc/nginx

RUN apt-get update && apt-get install -y \
    && apt-get install nginx curl -y \
    && rm -rf /var/lib/apt/lists/*

COPY ./nginx.conf ./sites-available/abastos.42.fr.conf
RUN ls
RUN mkdir private certs && openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout ./private/nginx-selfsigned.key -out ./certs/nginx-selfsigned.crt -subj "/CN=abastos.42.fr" \
  -addext "subjectAltName=DNS:abastos.42.fr,DNS:www.abastos.42.fr,IP:10.0.0.1"
COPY ./snippets snippets
COPY ./dhparam.pem .
RUN ln -s /etc/nginx/sites-available/abastos.42.fr.conf /etc/nginx/sites-enabled/abastos.42.fr.conf \
    && rm -rf /etc/nginx/sites-enabled/default

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
