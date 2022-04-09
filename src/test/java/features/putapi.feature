Feature: Update user using PUT api

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
      {
             "status": "inactive"
         }

      """

  Scenario: Update a user with the given data
    Given path '/public/v2/users/3000'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.id == '#present'
    And match $.name == 'tom'
    And match $.email == '#present'
    And match $.status == 'inactive'
