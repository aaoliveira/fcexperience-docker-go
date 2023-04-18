FROM golang:1.20-alpine AS passo1
WORKDIR /app
COPY    /app .
RUN apk add --no-cache go
RUN go build main.go

FROM scratch AS passo2
WORKDIR /app
COPY --from=passo1 /app .
CMD ["./main"]