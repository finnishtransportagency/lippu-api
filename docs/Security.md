# Security Considerations
This documentation outlines security considerations that
API implementors should take into account when designing
and implementing the Lippu-API.

## Threat modeling
Threat modelling is a good practise to approach security for
a software application. In threat modelling, you try to identity,
quantify and address security risks of the application. In short
the aim is to identify and mitigate risks that have high probability
or have severe consequences. There are different guides
available for threat modeling, one is the [Application Threat Modeling](https://www.owasp.org/index.php/Application_Threat_Modeling)
by the [Open Web Application Security Project (OWASP)](https://www.owasp.org/). 
There is also an ongoing project to translate the guide to
Finnish at Github: [Uhka-analyysi](https://github.com/solita/uhka-analyysi).
It is suggested to incorporate threat modelling practises into
the software development process. 

## HTTP considerations
The Lippu-API is built on top of HTTP-protocol, all
the security considerations of the HTTP-protocol
as defined in the [section-9](https://tools.ietf.org/html/rfc7230#section-9)
of the [Hypertext Transfer Protocol (HTTP/1.1): Message Syntax and Routing](https://tools.ietf.org/html/rfc7230)
-standard and the related specifications are relevant also for the Lippu-API.

## TLS considerations
All traffic between the client and the server must be
encrypted. The server side must support TLS 1.2
([RFC5246](https://tools.ietf.org/html/rfc5246)) encryption
and may support additional transport-layer mechanisms.
Client side should perform a TLS/SSL server identity
check when using encrypted TLS connection. Additional
information can be found on [RFC6125](https://tools.ietf.org/html/rfc6125)
and [RFC7525](https://tools.ietf.org/html/rfc7525) 

## Authentication and authorization considerations
Requests to the secured endpoints must be protected
with the authentication token received from the authentication
service. Separate consideration must be placed on the
authentication token's expiry time, shorter expire
time reduces attacking time if the authentication
token falls into hands of a malicious attacker. Also
separate process to revoke authentication could be used,
the downside is that is removes the stateless aspect
of the authentication verification.  
 
In addition to the authentication, client's access to the
requested resources must be authorized accordingly to prevent
clients accessing other clients data.  

## Secure data storage
Service administrators should follow industry
best practises on protecting credentials and sensitive
data. See [section-5.1.4.1](https://tools.ietf.org/html/rfc6819#section-5.1.4.1)
of the [OAuth 2.0 Threat Model and Security Considerations](https://tools.ietf.org/html/rfc6819) 
for common practises to follow.  Also see related items in the common
web application vulnerabilities-section.

## Privacy considerations
The sensitive and personal data stored by the service must be
protected accordingly. If the service operates in EU it should
take account the requirements from the General Data Protection
Regulation (GDPR). Also separate considerations should
be places on application logging and prevent logging of sensitive
information to the application logs.

## Common web application vulnerabilities
OWASP maintains a list of [most used vulnerability categories](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project).
Implementors should go the through the list of the vulnerability categories
and try mitigate and prepare to the relevant vulnerability categories.
There is a separate [cheat sheet](https://www.owasp.org/index.php/OWASP_Top_Ten_Cheat_Sheet)
to mitigate and protect against the common vulnerabilities. At least
the following are relevant vulnerability categories from the 2013
top ten list: 

* [Injection](https://www.owasp.org/index.php/Top_10_2013-A1-Injection)
* [Broken Authentication and Session Management](https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management)
* [Sensitive Data Exposure](https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure)
* [Using Components with Known Vulnerabilities](https://www.owasp.org/index.php/Top_10_2013-A9-Using_Components_with_Known_Vulnerabilities)

## Links
* [RFC7230: Hypertext Transfer Protocol (HTTP/1.1): Message Syntax and Routing](https://tools.ietf.org/html/rfc7230)
* [RFC5246: The Transport Layer Security (TLS) Protocol Version 1.2](https://tools.ietf.org/html/rfc5246)
* [RFC6125: Representation and Verification of Domain-Based Application Service Identity within Internet Public Key Infrastructure Using X.509 (PKIX) Certificates in the Context of Transport Layer Security (TLS)](https://tools.ietf.org/html/rfc6125)
* [RFC7525: Recommendations for Secure Use of Transport Layer Security (TLS) and Datagram Transport Layer Security (DTLS)](https://tools.ietf.org/html/rfc7525)
* [RFC6810: OAuth 2.0 Threat Model and Security Considerations](https://tools.ietf.org/html/rfc6819) 
* [OWASP Top Ten Project](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project)
* [OWASP Top Ten Cheat Sheet](https://www.owasp.org/index.php/OWASP_Top_Ten_Cheat_Sheet)
* [OWASP Application Threat Modeling](https://www.owasp.org/index.php/Application_Threat_Modeling)
