FROM nginx:alpine

LABEL maintainer="Abi"
LABEL app="html-nginx"

RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html/

EXPOSE 80
