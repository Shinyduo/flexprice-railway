FROM golang:1.24-alpine AS builder
WORKDIR /app

RUN apk add --no-cache git

RUN git clone --depth 1 https://github.com/flexprice/flexprice.git .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux \
    go build -ldflags="-w -s" -trimpath \
      -o server cmd/server/main.go

FROM ghcr.io/typst/typst:v0.13.1 AS typst

FROM alpine:3.20
WORKDIR /app

RUN apk add --no-cache ca-certificates

COPY --from=builder /app/server /app/server
COPY --from=typst /bin/typst /usr/local/bin/
COPY --from=builder /app/internal/config ./config
COPY --from=builder /app/assets ./assets

RUN chmod +x /app/server

EXPOSE 8080
CMD ["/app/server"]
