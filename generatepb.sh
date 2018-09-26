#!/bin/bash
 
protoc -I .  proto/consignment/consignment.proto \
   --go_out=plugins=micro:${GOPATH}/src/github.com/renegmed/shippy-consignment-service