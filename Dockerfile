FROM alpine:nginx AS builder

COPY nginx.conf /etc/nginx/nginx.conf