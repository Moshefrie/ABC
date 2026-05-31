FROM golang:alpine AS builder
RUN go install github.com/jpillora/chisel@latest

FROM alpine:latest
COPY --from=builder /go/bin/chisel /usr/local/bin/chisel
EXPOSE 8080
CMD ["chisel", "server", "--port", "8080", "--auth", "user:pass123", "--socks5", "--keepalive", "25s"]
