#FROM golang:1.9.0 as builder

#WORKDIR /go/src/github.com/chauhanr/shipcon-vessel-service

#COPY . .

#RUN go get -u github.com/golang/dep/cmd/dep
#RUN dep init && dep ensure
#RUN CGO_ENABLED=0 GOOS=linux go build -o vessel-service -a -installsuffix cgo main.go handler.go datastore.go repository.go

FROM debian:latest

RUN mkdir /app
WORKDIR /app
ADD shipcon-vessel-service /app/vessel-service
#COPY --from=builder /go/src/github.com/chauhanr/shipcon-vessel-service/vessel-service .

CMD ["./vessel-service"]