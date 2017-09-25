# LIPPU-project API -definitions

This repository has the LIPPU-project API-definitions in Swagger 2.0 yaml-format.
You can build a Docker-environment to view the API-definitions
or you can open the `yaml/api.yml` file in [Swagger-editor](https://github.com/swagger-api/swagger-editor).

To run the Swagger Docker container in local environment, run the following command (you must
have Docker and Docker compose installed):

```
docker-compose up
```
If Docker throws an error about firewall blocking volume shares (common problem in the Windows
environment), you must open ports for Docker in the firewall. 
[See Docker's documentation for instructions](https://docs.docker.com/docker-for-windows/#firewall-rules-for-shared-drives).

It takes a while to build the containers and start them, so be patient :)

After the containers have started, open a browser and point it to the [http://localhost](http://localhost) address
to see the documentation. You can terminate the containers with `ctrl+c`.

## What's in the containers?

When the `docker-compose up` command is executed, the following will happen

1. A Swagger UI container is created, which sees the `yaml/api.yml`-file. Making a page reload will
   update the UI with the changes to the API-definitions. 
2. Another container is created, which has a stub implementation of the API. When the container is created, the code
   is generated from the `yaml/api.yml` file. The stub implementation will not update
   without restarting the container (see below). 
3. A Nginx-server is started, which acts as a forward-proxy for the previous two containers and provides them
   the same hostname, so you can access both containers from the developers machine.
  
   
## Development

### Code generation

You can use Swagger codegen-tool to build stub implementation for LIPPU API. The code and the documentation is available
in the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) Github-project and some examples
are in the [codegen README](codegen/README.md)-file. 


### Swagger Docker
If you want to develop the API, it is recommended to start the Docker containers with the following
docker-compose command:

```
docker-compose up --build
```

This will trigger Docker to rebuild images that have changes. The maven dependencies
used by the stub image are shared with the host OS using volume-directivies. This 
way dependencies wont end up being part of the container and they are not
fetched everytime the container is built. These dependencies are stored in `./.docker_m2/`
directory. Building the containers for the first time takes time due
to the dependencies, but is faster the following times. When started,
the process will generate new stub implementation codes based on the
API-definitions, compile the code with maven and start the application
server.

## Future

In the future the `docker-compose up` command could start a reference implementation
of the API instead of the generated stub implementation. It could also replace the whole
Swagger UI container, as the reference implementation could provide the Swagger UI for the API.

## License
This work is licended under EUPL (European Union Public Licence) version 1.2. See [LICENSE.txt](LICENSE.txt)
for more information.