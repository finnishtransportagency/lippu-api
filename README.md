# Lippu-projektin API -määritykset

Tämä repository sisältää Lippu-projektin API-määritykset Swagger 2.0 yaml -muodossa. Voit luoda itsellesi ympäristön, 
missä voit niitä katsoa omalla koneellasi käyttäen Dockeria

Käynnistääksesi Swaggerin lokaalisti aja seuraava komento komentorivillä (Docker pitää olla asennettuna):

```
docker-compose up
```
Jos Dockerin käynnistyksen yhteydessä tulee herjaa siitä, että palomuuri estää volume-jaot (ongelma Windowsissa 
ennenkaikkea), niin sinun tulee tehdä aukko Dockerille palomuuriisi. 
[Katso ohjeet Dockerin dokumentaatiosta](https://docs.docker.com/docker-for-windows/#firewall-rules-for-shared-drives).

Komennon suorittamiseen menee ensimmäisellä kerralla hetki, joten malta mielesi :)

Tämän jälkeen voit vain avata selaimeesi [http://localhost](http://localhost) nähdäksesi dokumentaation. Tavallinen 
`ctrl+c` sammuttaa Docker-kontit.

## Mitä käynnistyy?

Kun `docker-compose up` ajetaan niin tällöin tehdään seuraavaa:

1. Luodaan Swagger UI -kontti, joka näkee suoraan `yaml/api.yml` -tiedoston ja täten kyseisen tiedoston muokkaukset
   lokaalisti näkyvät suoraan Swagger UI:ssa kunhan tekee sivun uudelleenlatauksen.
2. Luodaan toinen kontti, johon luodaan imagen luontihetkellä `yaml/api.yml` -tiedoston mukainen palvelin-stub, joka
   käynnistetään kontin käynnistyshetkellä. Tämä stub-toteutus ei päivity automaattisesti ilman docker-imagen 
   uudelleenluomista (ks. alla)
3. Käynnistetään Nginx-palvelin, joka toimii proxy forwardina näiden kahden aikaisemman kontin välillä ja tarjoaa
   niille yhteisen hostin, jonka avulla niihin pääsee käsiksi suoraan kehittäjän omalta koneelta.
   
## Kehitys

### Koodigenerointi

LIPPU-rajapinnan käyttämiseksi on mahdollista luoda valmiit koodipohjat Swagger codegen-työkalulla. Koodit ja ohjeistus löytyvät Githubin [swagger-codegen](https://github.com/swagger-api/swagger-codegen) projektista. 

Tuettuja kieliä mm. 
```
akka-scala, android, apache2, apex, aspnet5, aspnetcore, async-scala, bash, csharp, clojure, cwiki, cpprest, CsharpDotNet2, dart, elixir, eiffel, erlang-server, finch, flash, python-flask, go, go-server, groovy, haskell, jmeter, jaxrs-cxf-client, jaxrs-cxf, java, inflector, jaxrs-cxf-cdi, jaxrs-spec, jaxrs, msf4j, java-play-framework, jaxrs-resteasy-eap, jaxrs-resteasy, javascript, javascript-closure-angular, java-vertx, kotlin, lumen, nancyfx, nodejs-server, objc, perl, php, php-symfony, powershell, pistache-server, python, qt5cpp, rails5, restbed, ruby, scala, scalatra, silex-PHP, sinatra, slim, spring, dynamic-html, html2, html, swagger, swagger-yaml, swift4, swift3, swift, tizen, typescript-angular2, typescript-angular, typescript-fetch, typescript-jquery, typescript-node, undertow, ze-ph
``` 

Esim. clojure client-stubit LIPPU-rajapinnan käyttämiseksi generoituu komennolla
```
git clone https://github.com/swagger-api/swagger-codegen
cd swagger-codegen
mvn clean package
java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../swagger-api-doc/yaml/api.yml -l clojure -o /var/tmp/lippu-clojure-client
```

### Swagger Docker
Mikäli haluat jatkokehittää tätä kokonaisuutta, niin on suositeltavaa käynnistää docker-compose käskyllä:

```
docker-compose up --build
```

jolloin Docker kääntää muuttuneet imaget käynnistyksen yhteydessä. Stub-imagen maven-riippuvuudet on jaettu
emokäyttiksen kanssa volume-direktiivillä jotta ne eivät päätyisi osaksi konttia ja täten asioiden muuttuessa ei
kaikkia riippuvuuksia jouduttaisi hakemaan joka kerta uudestaan ja uudestaan. Nämä Docker-konttien käyttämät
riippuvuudet tallennetaan hakemistoon `./.docker_m2/`. Täten ensimmäisen kerran jälkeen stub-imagen luonti on nopeaa
ja sen käynnistyksen yhteydessä generoidaan uudet koodit, käännetään ne mavenilla ja käynnistetään palvelin. Tässä
menee luonnollisesti hetki, mutta puhutaan kuitenkin muutamista sekunneista eikä minuuteista.

## Tulevaisuus

Tulevaisuudessa sama `docker-compose up` -komento voisi käynnistää oikean referenssitoteutuksen palvelimesta. Käytännössä
tämä tarkoittaa sitä, että stub-palvelin korvataan tällä referenssitoteutuksella. Tässä kohden tosin kannattaa harkita
vakavasti sitä, että onko mielekästä pitää swagger UI -kontti erillään referenssitoteutuksesta - yhtä hyvin tämän
Swagger UI:n voisi tarjoilla sieltä referenssitoteutuksesta itsestään ulos. Oikeaa referenssitoteutusta kun ei voi 
generoida automaattisesti kuitenkaan.