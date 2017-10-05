# Code generation

You can generatate code templates for the LIPPU-API for different
programming languages using the swagger codegen tool. The codegen tool
and documentation is avaiable the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) 
Github-project. It supports atleast the following languages
```
akka-scala, android, apache2, apex, aspnet5, aspnetcore, async-scala, bash, csharp, clojure, cwiki, cpprest, CsharpDotNet2, dart, elixir, eiffel, erlang-server, finch, flash, python-flask, go, go-server, groovy, haskell, jmeter, jaxrs-cxf-client, jaxrs-cxf, java, inflector, jaxrs-cxf-cdi, jaxrs-spec, jaxrs, msf4j, java-play-framework, jaxrs-resteasy-eap, jaxrs-resteasy, javascript, javascript-closure-angular, java-vertx, kotlin, lumen, nancyfx, nodejs-server, objc, perl, php, php-symfony, powershell, pistache-server, python, qt5cpp, rails5, restbed, ruby, scala, scalatra, silex-PHP, sinatra, slim, spring, dynamic-html, html2, html, swagger, swagger-yaml, swift4, swift3, swift, tizen, typescript-angular2, typescript-angular, typescript-fetch, typescript-jquery, typescript-node, undertow, ze-ph
``` 
This directory has also configuration options for Java Spring Boot projects
in the [springCodegenOptions.json](springCodegenOptions.json)-file 

## Java spring boot server example
Run the following commands in the top level, you might
need to correct file paths.

```
git clone https://github.com/swagger-api/swagger-codegen
cd swagger-codegen
mvn clean package
java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -c ../lippu-api/codegen/springCodegenOptions.json -i ../lippu-api/yaml/api.yml -l spring -o /var/tmp/lippu-spring-client
```

## Clojure client example
Run the following commands in the top level, you might
need to correct file paths.

```
git clone https://github.com/swagger-api/swagger-codegen
cd swagger-codegen
mvn clean package
java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../lippu-api/yaml/api.yml -l clojure -o /var/tmp/lippu-clojure-client
```
