FROM nginx:stable-alpine

RUN apk update && apk add bash
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/redmine /etc/nginx/sites-available/
COPY ./nginx/redmine_ssl /etc/nginx/sites-available/
RUN mkdir /srv/www
COPY ./nginx/502.html /srv/www/
COPY ./nginx/docker-entry.sh /
RUN chmod +x /docker-entry.sh
ENTRYPOINT /docker-entry.sh
