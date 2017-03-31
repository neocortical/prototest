#!/bin/bash

# package b protobufs all have 'go_package' declarations
protoc -I ./ b/*.proto --go_out=$GOPATH/src

# package c protobufs do not have 'go_package' declared and so are manually assigned a package name
protoc -I ./ c/*.proto --go_out=import_path=github.com/neocortical/prototest/c:.

# since c lack 'go_package', we manually declare associations...
protoc -I ./ a/*.proto --go_out=Mc/baz.proto=github.com/neocortical/prototest/c,Mc/qux.proto=github.com/neocortical/prototest/c:$GOPATH/src
