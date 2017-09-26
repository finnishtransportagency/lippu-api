# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

## [Unreleased]
### Added
- Changelog.
- License (EUPL v1.2) and LICENSE.txt
- Separate README for code generation.
- From and to coordinates to products query.
- Response types for authentication requests.
- Server side nonce to AuthenticationRequest to allow multiple nonces for a user. 

### Changed
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
