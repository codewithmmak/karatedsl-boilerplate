Feature: GET API with Query Parameters

  Scenario: get all active users
    * def query = {status:'active', gender:'female', id:2318}
    Given url baseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get all active users and get the count
    * def query = {status:'active'}
    Given url baseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 20
