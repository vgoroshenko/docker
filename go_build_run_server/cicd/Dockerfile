FROM golang:1.15.3 as builder
#Copy our file in the host contianer to our contianer
COPY . /gol/mln-client-service

# Set working directory
WORKDIR /gol/mln-client-service
RUN go get .
RUN go get -u github.com/swaggo/swag/cmd/swag
RUN swag init -g mln.go
#Build the binary
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

#Pull redis
#CMD pull redis
#CMD run --name redis-mln -p 6379:6379 -d redis

FROM alpine:latest
RUN apk --no-cache add ca-certificates bash
RUN mkdir /app
WORKDIR /app
COPY --from=builder /gol/mln-client-service/config/*.yml ./config/
COPY --from=builder /gol/mln-client-service .

EXPOSE 6379 8000


CMD ["./mln-client-service","-prod"]
