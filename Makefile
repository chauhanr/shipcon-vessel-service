build:
	protoc -I. --go_out=plugins=micro:$(GOPATH)/src/github.com/chauhanr/shipcon-vessel-service proto/vessel/vessel.proto
	GOOS=linux GOARCH=amd64 go build -o shipcon-vessel-service
	docker build -t shipcon-vessel-service .

run:
	docker run -d --net="host" \
    		-p 50053 \
    		-e MICRO_SERVER_ADDRESS=:50053 \
    		-e MICRO_REGISTRY=mdns \
            shipcon-vessel-service