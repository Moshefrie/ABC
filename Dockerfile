FROM alpine:latest

RUN apk add --no-cache curl unzip

RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip /tmp/v2ray.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/v2ray

COPY config.json /etc/v2ray/config.json

EXPOSE 8080

CMD ["v2ray", "run", "-config", "/etc/v2ray/config.json"]
