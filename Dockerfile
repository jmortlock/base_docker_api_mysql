FROM bitwalker/alpine-elixir-phoenix:latest as builder

ENV MIX_ENV prod

ADD . /app
WORKDIR /app

RUN mix do deps.get, deps.compile, phx.digest, release

FROM alpine:3.6

ENV VERSION 0.0.1
ENV APP_NAME base_docker_api_mysql
ENV PORT 4000

RUN apk add --no-cache \
     bash \
     ncurses-libs \
     zlib \
     openssl \
     ca-certificates

WORKDIR /app

COPY --from=builder /app/_build/prod/rel/$APP_NAME/releases/$VERSION/$APP_NAME.tar.gz /app

RUN tar -xzf $APP_NAME.tar.gz; rm $APP_NAME.tar.gz
CMD ./bin/$APP_NAME foreground
