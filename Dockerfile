FROM alpine:latest

WORKDIR app

COPY ./log-generator.sh .
RUN apk update && apk add jq netcat-openbsd && apk add bash

CMD ["/bin/bash", "/app/log-generator.sh"]
