# Stage 1: Build the Go binary
FROM golang:1.22-alpine AS builder

WORKDIR /testapp
COPY . .

RUN go build -o testapp .

# Stage 2: Minimal runtime image
FROM alpine:latest

WORKDIR /testapp
COPY --from=builder /testapp/testapp .

CMD ["./testapp"]

