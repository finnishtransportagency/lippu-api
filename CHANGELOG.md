# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

## [0.3.0] - 17.11.2017
### Added
- ticketType as a metadata for different ticket formats. Can be used to distinguish
  different ticket formats from each other.
- travelEntitlement endpoint for status query, activation and delete of a travelEntitlement.
- travelEntitlementId for identifying single travel entitlement in a reservation.
- TravelEntitlement defenition as response for status and activation of a travelEntitlement.
- chosenAccessibilityReservationIds to ReservationRequest to indicate reservevation
  for accessibility features.
- AccessibilityReservation definition with accessibilityReservationId for
  required accessibility feature reservation.
- Separate document for API.
- Examples for all of the response error cases.

### Removed
- reservationData field, replaced by travelEntitlementId. Use shorter ID for
  travelEntitlement endpoint instead of data field that could be a alot longer.  
- In AvailabilityRequest the unneeded fields from extraService and accessibility feature
  requirements: it is redundant that client side sends fare information. Titles/identifiers
  are only needed. Added AccessibilityBase and ExtraServicesBase.

## [0.2.0] - 6.10.2017
### Added
- Separate docs-folder for documentation, moved documentation there.
- Security considerations document for API implementors.
- Accessibility class.
- TravelPassenger class.
- Changelog.
- License (EUPL v1.2) and LICENSE.txt
- Separate Codegeneration.md document for generating code from API definition. 
- From and to coordinates to products query.
- Response types for authentication requests.
- Server side nonce to AuthenticationRequest to allow multiple nonces for a user. 


### Changed
- Added accessibility query option for the products query, so required accessibility
  options can be used to filter out products that are not suitable for the
  customer.
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
