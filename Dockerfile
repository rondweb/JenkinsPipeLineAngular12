FROM alpine:3.4

RUN apk add --update nginx && rm -rf /var/cache/apk/*

ADD nginx.conf /etc/nginx/nginx.conf

RUN mkdir /www-data

# COPY ./dist/cities/*.html /www-data/
# COPY ./dist/cities/*.js /www-data/
# COPY ./dist/cities/*.css /www-data/
# COPY ./dist/cities/*.txt /www-data/
# COPY ./dist/cities/*.ico /www-data/

COPY ./dist/cities/ /www-data/

RUN chmod 777 /www-data

EXPOSE 80

CMD ["nginx"]