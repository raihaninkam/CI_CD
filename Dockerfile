FROM golang:1.25-alpine AS builder

WORKDIR /build

RUN apk add --no-cache git

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go buid -o server main.go

FROM alpine:3.22

WORKDIR /app

COPY --from=builder /build/server /app/server

RUN chmod +x server

EXPOSE 8080

CMD [ "./server" ]