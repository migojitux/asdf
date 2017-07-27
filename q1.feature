Feature: Postcode-based nearby station lookup

  Scenario: Null postcode
    Given a postcode with no value
    When the request is sent to the server
    Then the server should respond with an empty list of stations or a meaningful error

  Scenario: Non-existent (invalid) postcode
    Given an invalid postcode
    When the request is sent to the server
    Then the server should respond with a meaningful error

  Scenario: Postcode with no stations nearby
    Given a postcode on the outer Hebrides
    When the request is sent to the server
    Then the server should respond with no stations (since they cannot be walked/driven to)

  Scenario: Numerous valid postcodes.  Validate the output
    Given multiple valid <postcode> values
    When the request is sent to the server
    Then the server should respond with correct <stations> listings

    Examples:
      | postcode | stations                   |
      | W5 5RP   | Ealing, South Ealing       |
      | SW19 1JF | Wimbledon, South Wimbledon |
      | EC2A 01D | Moorgate, Liverpool Street |

  Scenario: Postcode of an existing station (fishing for a zero-distance error)
    Given the exact postcode of a train station
    When the request is sent to the server
    Then the server response should include the station in question, at a distance of zero

  Scenario: All the postcodes
    Given a list of all the postcodes in the system
    When the request is sent to the server
    Then the server should respond with all of the stations=

  Scenario: Duplicate postcodes
    Given a list of repeated duplicate postcodes
    When the request is sent to the server
    Then the server should deduplicate the result listings

  Scenario: One Hundred Billion Postcodes!!!
    Given an extraordinarily long list of postcode requests
    When the request is sent to the server
    Then the server should either truncate with an error message, or serve all data requested
