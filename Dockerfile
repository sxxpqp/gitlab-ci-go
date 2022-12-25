# FROM golang:1.18-alpine AS build

# ARG APPNAME
# ARG GOPROXY
# ENV GO111MODULE=on \
#     GOPROXY=https://proxy.golang.com.cn,direct

# WORKDIR /app

# COPY . /app/
# RUN go mod download && \
#     go build -o gitlab-ci-go

## Deploy
FROM golang:latest

# ARG APPNAME
# ENV APP=gitlab-ci-go

WORKDIR /app
COPY . /app/
# COPY --from=build /app/ /app/

EXPOSE 80

# ENTRYPOINT "/app/${APP}" "-f" "/app/etc/greet-api.yaml"
ENTRYPOINT ["./main"]


