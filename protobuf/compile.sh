#!/bin/bash

# This script requires GRPC code generators (for java and javascript).
#   Java: https://search.maven.org/search?q=g:io.grpc%20a:protoc-gen-grpc-java
#   JavaScript:

# These code generators need to be placed into your "pluginDirectory":
javaGrpcPlugin="$HOME/software/bin/protoc-gen-grpc-java-1.19.0-linux-x86_64.exe"

######################################################################

protoFile="Library.proto"
javaOutput="java"
jsOutput="js"

######################################################################

echo "Compiling to Java..."

rm -rf "$javaOutput"
mkdir -p "$javaOutput"

protoc \
  --plugin=protoc-gen-grpc-java="$javaGrpcPlugin" \
  --grpc-java_out="$javaOutput" \
  --java_out="$javaOutput" \
  "$protoFile"

######################################################################

# echo "Compiling to JavaScript..."

# rm -rf "$jsOutput"
# mkdir -p "$jsOutput"

# protoc \
#   --js_out="$jsOutput" \
#   "$protoFile"

######################################################################

echo "done."
