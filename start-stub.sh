#!/bin/sh
java -jar /codegen/swagger-codegen-cli.jar generate \
         -i /codegen/api.yml \
         -l undertow  \
         -o /stubs

cd stubs
mvn package
java -jar target/swagger-undertow-server-1.0.0.jar