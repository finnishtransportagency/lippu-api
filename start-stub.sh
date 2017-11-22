#!/bin/sh
java -jar /codegen/swagger-codegen-cli.jar generate \
         -i /codegen/api.yml \
         -l undertow  \
         -o /stubs

cd stubs
xmlstarlet ed -O -L \
         -N pom=http://maven.apache.org/POM/4.0.0 \
         -u "/pom:project/pom:properties/pom:version.framework" \
         -v "1.0.0" pom.xml

mvn package
java -jar target/swagger-undertow-server-1.0.0.jar