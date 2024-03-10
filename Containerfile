FROM alpine:latest

RUN apk add ansible zsh

WORKDIR /root
