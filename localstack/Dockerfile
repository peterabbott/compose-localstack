FROM localstack/localstack:0.12.18

RUN apk add jq

COPY init /docker-entrypoint-initaws.d

COPY assets /assets
