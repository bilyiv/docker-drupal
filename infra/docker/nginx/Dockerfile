FROM nginx:1.13.3-alpine

MAINTAINER Vladyslav Bilyi <beliyvladislav@gmail.com>

WORKDIR /var/www/example/web

# Copy vhost conf
COPY ./infra/docker/nginx/conf.d/vhost.conf /etc/nginx/conf.d/default.conf

# Expose needed ports
EXPOSE 80 4000

CMD ["nginx", "-g", "daemon off;"]
