FROM nginx:alpine

WORKDIR /etc/nginx

COPY ./config/nginx.conf nginx.conf
ADD ./etc/certs certs
ADD ./etc/conf.d conf.d
ADD ./etc/sites-available sites-available

CMD ["nginx"]

EXPOSE 80 443
