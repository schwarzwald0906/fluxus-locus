FROM golang:1.17.3-alpine3.14
WORKDIR /usr/src/app
COPY package*.json ./
RUN go mod init github.com/schwarzwald0906/graphql-test-api
COPY . .
EXPOSE 8080
CMD "go" "run" "server.go"