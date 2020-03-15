FROM node:13-alpine

RUN apk add --update build-base
RUN apk add --no-cache --virtual .build-deps \
    bash \
    gettext \
    openjdk8-jre \
    openssl \
    nginx

RUN npm install -g firebase-tools
ENV GOOGLE_APPLICATION_CREDENTIALS "/app/firebase.json"

RUN mkdir -p /app
RUN mkdir -p /run/nginx
WORKDIR /app
ADD entrypoint.sh /app/
ADD nginx.conf.template /etc/nginx
