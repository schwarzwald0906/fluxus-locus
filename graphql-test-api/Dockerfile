#build環境
FROM golang:1.17.3-alpine3.14 as build
WORKDIR /usr/src/app
COPY go.mod /code/go.mod
COPY go.sum /code/go.sum
WORKDIR /code
RUN ls
RUN go mod download
COPY . .
RUN go build -ldflags "-s -w" -o /main server.go && chmod +x /main
#release環境
FROM alpine:3.14 as release
WORKDIR /app
COPY --from=build /main ./
# コンテナを立ち上げたとき、勝手にWeb サーバーを立ち上げる
CMD ["./main"]  