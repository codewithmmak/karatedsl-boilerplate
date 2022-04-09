Feature: Delete user using DELETE api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      function(s){
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for(var i=0; i<s; i++)
      text += pattern.charAt(Math.floor(Math.random()*pattern.length()));
      return text;
      }
      """
    * def randomString = random_string(10)
    * print randomString
    * def requestPayload =
      """
      {
             "name": "tom",
             "gender": "male",
             "status": "active"
         }

      """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Delete a user with the given user id
    #1. create a user using POST call
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.id == '#present'
    #fetch the user id
    * def userId = $.id
    * print userId
    #2. delete the same user
    Given path '/public/v2/users/' + userId
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method delete
    Then status 204
    #3. get the same user with user id
    Given url baseUrl+'/public/v2/users/' + userId
    When method GET
    Then status 404
    And match $.message == 'Resource not found'
