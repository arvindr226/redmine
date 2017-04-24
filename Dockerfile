FROM nginx:stable-alpine

RUN apk update && apk add bash
RUN rm /etc/nginx/conf.d/default.conf
COPY ./redmine /etc/nginx/sites-available/
COPY ./redmine_ssl /etc/nginx/sites-available/
RUN mkdir /srv/www
COPY 502.html /srv/www/
COPY docker-entry.sh /
RUN chmod +x /docker-entry.sh
ENTRYPOINT /docker-entry.sh
