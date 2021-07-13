FROM golang:1.16-alpine

WORKDIR /go-service

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY *.go .

RUN go build -o /docker-go-service

EXPOSE 8080

CMD [ "/docker-go-service" ]