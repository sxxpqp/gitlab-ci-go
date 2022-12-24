FROM golang:1.18-alpine AS build

ARG APPNAME
ARG GOPROXY
ENV GO111MODULE=on \
    GOPROXY=${GOPROXY}

WORKDIR /app

COPY . /app/
RUN go mod download && \
    go build -o ${APPNAME}

## Deploy
FROM golang:1.18-alpine

ARG APPNAME
ENV APP=${APPNAME}

WORKDIR /app

COPY --from=build /app/ /app/

EXPOSE 8888

ENTRYPOINT "/app/${APP}" "-f" "/app/etc/greet-api.yaml"
