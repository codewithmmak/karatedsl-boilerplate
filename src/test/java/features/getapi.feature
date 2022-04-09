Feature: GET API feature

  Scenario: get all user details
    Given url baseUrl+'/public/v2/users'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * print userCount = jsonResponse.length
    * match jsonResponse[0].gender == "#present"
    * match jsonResponse[0].name == "#present"
    * match jsonResponse[0].id == "#present"
    * match jsonResponse[0].email == "#present"
    * match jsonResponse[0].status == "#present"


  Scenario: get user details
    Given url baseUrl+'/public/v2/users'
    And path '30'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actualName = jsonResponse.name
    * def actualId = jsonResponse.id
    * def actualEmail = jsonResponse.email
    * print actualName
    * match actualName == 'Lai Reddy'
    * match actualId == 30
    * match actualEmail == 'reddy_lai@luettgen-friesen.org'

  Scenario: get user details - user not found
    Given url baseUrl+'/public/v2/users'
    And path '1'
    When method GET
    Then status 404
    * print response
