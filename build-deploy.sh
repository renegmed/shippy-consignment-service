
#!/bin/bash

protoc -I/usr/local/include -I. \
		--go_out=plugins=micro:. \
		proto/consignment/consignment.proto

 
docker build -t shippy-consignment-service .
 
docker run --net="host" \
		-p 50052 \
		-e MICRO_SERVER_ADDRESS=:50052 \
		-e MICRO_REGISTRY=mdns \
		-e DISABLE_AUTH=true \
		shippy-consignment-service

 

