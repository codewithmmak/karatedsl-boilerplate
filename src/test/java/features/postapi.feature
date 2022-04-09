Feature: Create user using POST api

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
      {
             "name": "tom",
             "email": "unquieEmail@gmail.com",
             "gender": "male",
             "status": "active"
         }

      """

  Scenario: Create a user with the given data
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.id == '#present'
    And match $.name == 'tom'
    And match $.email == '#present'
