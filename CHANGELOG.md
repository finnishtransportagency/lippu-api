# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

## [Unreleased]
### Added
- Accessibility class.
- TravelPassenger class.
- Changelog.
- License (EUPL v1.2) and LICENSE.txt
- Separate README for code generation.
- From and to coordinates to products query.
- Response types for authentication requests.
- Server side nonce to AuthenticationRequest to allow multiple nonces for a user. 


### Changed
- Added ExtraServices and Accessibility options to products and availability
  queries. If user want those options most probably the user would like
  to query with those options and tie those to the certain passenger.
  Also those are needed in needed in the availability query to check if
  the transport service can capasity to offer the service.   
- Combined StopLocation and CoordinateLocation to Location object as Swagger 2.0
  does not support oneOf-structures
- Error responses to return JSON formatted responses (ApiError object).
- ReservationDelete operation to return RervervationDeleteResponse-object.
- Title and java8 attributes to spring codegen options.
- Changed default package names for spring codegen options.
- Translated the README to english.

### Fixed
- Date-path variable to required in Product request.
- Removed duplicate X-Initiator parameter.

## [0.1] - 2017-09-08
### Added
- Authentication API.
- Product API.
- Availibility API
- Reservation API
