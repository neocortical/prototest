# Prototest
## A simple illustration of `protoc`/`protoc-gen-go` behavior

This repo shows how to work with multiple protobuf packages that reference each other, and how to use the `protoc` command to build valid `.pb.go` files in the correct locations. 

`a/root.proto` references two sibling packages, `b` and `c`. The latter two packages are independent.

In one case (package `b`), the `go_package` option is present. This both informs `protoc-gen-go` what package name to use and also helps generate import statements in `root.pb.go` when `root.proto` is compiled.

In the other case (package `c`), no `go_package` statements appear. To generate a correct package name, we need to specify `import_path=github.com/neocortical/prototest/c` in our `protoc` command. Then, in order to generate correct import statements in `root.pb.go`, we need to provide the `M` option to `protoc-gen-go` for every source file that `root.proto` imports from `c`.

You can see the correct commands to generate the desired `.pb.go` files in compile.sh.
